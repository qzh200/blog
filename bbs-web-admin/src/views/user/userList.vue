<!-- 用户列表 -->
<template>
  <div class="main">
  <div class="navbar" style="display: flex; flex-wrap: wrap; align-items: center; gap: 5px;">
      <template v-if="state.visible == 'true'">
        <el-button type="primary" plain @click="downloadTemplate">下载批量导入模板</el-button>
        <el-upload
          ref="upload"
          class="upload-demo"
          :action="uploadUrl"
          :show-file-list="false"
          :before-upload="beforeUpload"
          :on-change="handleFileChange"
          :on-progress="onProgress"
          :on-success="handleSuccess"
          :on-error="handleError"
          :auto-upload="false"
        >
          <el-button type="primary" plain>批量导入</el-button>
        </el-upload>
        <el-button type="primary" plain @click="exportData">批量导出</el-button>
        <el-button
          type="primary"
          plain
          v-if="verifyPermissionMenu('/control/user/manage?method=add*', 'get')"
          @click="$router.push({ path: '/admin/control/user/manage/add', query: { page: $route.query.page != undefined ? $route.query.page : '' } })"
        >添加会员</el-button>
        <el-button
          type="primary"
          plain
          @click="$router.push({ path: '/admin/control/user/list', query: { visible: 'false' } })"
        >回收站</el-button>
      </template>
      <el-button
        type="primary"
        plain
        v-if="state.visible == 'false'"
        @click="$router.push({ path: '/admin/control/user/list', query: { visible: 'true' } })"
      >返回</el-button>
      <el-button
        type="primary"
        plain
        v-if="state.visible == 'false' && verifyPermissionMenu('/control/user/manage?method=reduction*', 'post')"
        @click="reductionUser($event)"
      >还原</el-button>
      <el-button
        type="primary"
        plain
        v-if="verifyPermissionMenu('/control/user/manage?method=delete*', 'post')"
        @click="deleteUser($event, undefined)"
      >批量删除</el-button>
    </div>

    <!-- 导入进度条 -->
    <el-progress
      v-if="showProgress"
      :percentage="uploadProgress"
      :status="progressStatus"
      style="margin-top: 15px"
    >
    </el-progress>

    <!-- 导入结果反馈 -->
    <el-dialog
      v-model="showResultDialog"
      title="导入结果"
      width="60%"
      :close-on-click-modal="false"
    >
      <div class="import-result">
        <div class="result-summary">
          <p>总条数：{{ importResult.total }}</p>
          <p>成功条数：{{ importResult.success }}</p>
          <p>失败条数：{{ importResult.failed }}</p>
        </div>
        <template v-if="importResult.errors && importResult.errors.length > 0">
          <el-divider>错误详情</el-divider>
          <el-table :data="importResult.errors" style="width: 100%">
            <el-table-column prop="row" label="行号" width="80"></el-table-column>
            <el-table-column prop="username" label="用户名"></el-table-column>
            <el-table-column
              label="错误信息"
              show-overflow-tooltip
              :formatter="formatErrorMessage"
            >
            </el-table-column>
          </el-table>
        </template>
      </div>
      <template #footer>
        <el-button @click="showResultDialog = false">关闭</el-button>
      </template>
    </el-dialog>

    <!-- 导入前验证对话框 -->
    <el-dialog
      v-model="showVerifyDialog"
      title="导入数据验证"
      width="60%"
      :close-on-click-modal="false"
    >
      <div class="verify-info">
        <p>检测到数据：{{ verifyInfo.totalRows }} 条</p>
        <p v-if="verifyInfo.repeatRows > 0" class="text-warning">
          发现重复数据：{{ verifyInfo.repeatRows }} 条
        </p>
        <p v-if="verifyInfo.invalidRows > 0" class="text-danger">
          发现无效数据：{{ verifyInfo.invalidRows }} 条
        </p>
        <p v-if="verifyInfo.validRows > 0" class="text-success">
          有效数据：{{ verifyInfo.validRows }} 条
        </p>
      </div>
      <template #footer>
        <el-button @click="showVerifyDialog = false">取消</el-button>
        <el-button
          type="primary"
          @click="confirmImport"
          :disabled="verifyInfo.validRows === 0"
          >确认导入</el-button
        >
      </template>
    </el-dialog>
    <div class="data-table">
      <el-table
        ref="multipleTable"
        :data="state.tableData"
        tooltip-effect="dark"
        style="width: 100%"
        @selection-change="handleSelectionChange"
        stripe
        empty-text="没有内容"
      >
        <el-table-column type="selection"></el-table-column>
        <el-table-column label="账号" align="center">
          <template #default="scope">
            <div class="multipleInfo-wrapper">
              <div>{{ scope.row.account }}</div>
              <div class="multipleInfo-wrapper-blue" v-if="scope.row.type == 20">
                手机号{{ scope.row.mobile }}
              </div>
              <div
                class="multipleInfo-wrapper-green"
                v-if="
                  scope.row.type != 20 &&
                  scope.row.mobile != null &&
                  scope.row.mobile != ''
                "
              >
                绑定手机{{ scope.row.mobile }}
              </div>
              <div class="multipleInfo-wrapper-tangerine" v-if="scope.row.type == 30">
                邮箱{{ scope.row.email }}
              </div>
              <div
                class="multipleInfo-wrapper-pink"
                v-if="
                  scope.row.type != 30 && scope.row.email != null && scope.row.email != ''
                "
              >
                绑定邮箱{{ scope.row.email }}
              </div>
              <el-tag
                effect="dark"
                v-if="scope.row.cancelAccountTime != '-1'"
                type="danger"
                class="tag-wrapper"
                >已注销</el-tag
              >
            </div>
          </template>
        </el-table-column>
        <el-table-column prop="nickname" label="呢称" align="center"></el-table-column>
        <el-table-column label="头像" align="center" min-width="100">
          <template #default="scope">
            <div class="user-avatar-wrapper">
              <div
                class="avatar-badge"
                v-if="scope.row.avatarName == null || scope.row.avatarName == ''"
              >
                <el-avatar :size="48" :icon="UserFilled"></el-avatar>
              </div>
              <div
                class="avatar-badge"
                v-if="scope.row.avatarName != null && scope.row.avatarName != ''"
              >
                <el-avatar
                  :size="48"
                  :src="scope.row.avatarPath + '100x100/' + scope.row.avatarName"
                ></el-avatar>
              </div>
            </div>
          </template>
        </el-table-column>
        <el-table-column label="类型" align="center" width="110">
          <template #default="scope">
            <el-tag
              effect="dark"
              v-if="scope.row.type == 10"
              type="warning"
              class="tag-wrapper"
              >账号密码用户</el-tag
            >
            <el-tag effect="dark" v-if="scope.row.type == 20" class="tag-wrapper"
              >手机用户</el-tag
            >
            <el-tag
              effect="dark"
              v-if="scope.row.type == 30"
              type="info"
              class="tag-wrapper-tangerine"
              >邮箱用户</el-tag
            >
            <el-tag
              effect="dark"
              v-if="scope.row.type == 40"
              type="success"
              class="tag-wrapper"
              >微信用户</el-tag
            >
            <el-tag effect="dark" v-if="scope.row.type == 80" class="tag-wrapper-purple"
              >其他用户</el-tag
            >
          </template>
        </el-table-column>
        <el-table-column prop="point" label="积分" align="center"></el-table-column>
        <el-table-column
          prop="gradeName"
          label="会员等级"
          align="center"
          width="100"
        ></el-table-column>
        <el-table-column
          prop="registrationDate"
          label="注册日期"
          align="center"
          width="160"
        ></el-table-column>
        <el-table-column label="状态" align="center" width="100">
          <template #default="scope">
            <el-tag
              effect="dark"
              v-if="scope.row.state == 1"
              type="success"
              class="tag-wrapper"
              >启用</el-tag
            >
            <el-tag
              effect="dark"
              v-if="scope.row.state == 2"
              type="info"
              class="tag-wrapper"
              >停用</el-tag
            >
            <el-tag
              effect="dark"
              v-if="scope.row.state == 11"
              type="warning"
              class="tag-wrapper"
              >启用时删除</el-tag
            >
            <el-tag
              effect="dark"
              v-if="scope.row.state == 12"
              type="danger"
              class="tag-wrapper"
              >停用时删除</el-tag
            >
          </template>
        </el-table-column>
        <el-table-column label="操作" align="center" width="200">
          <template #default="scope">
            <div class="button-group-wrapper">
              <el-button-group>
                <el-button
                  type="primary"
                  v-if="verifyPermissionMenu('/control/user/manage?method=show*', 'get')"
                  @click="
                    $router.push({
                      path: '/admin/control/user/manage/show',
                      query: { id: scope.row.id },
                    })
                  "
                  >查看</el-button
                >
                <el-button
                  type="primary"
                  v-if="verifyPermissionMenu('/control/user/manage?method=edit*', 'get')"
                  @click="
                    $router.push({
                      path: '/admin/control/user/manage/edit',
                      query: { id: scope.row.id },
                    })
                  "
                  >修改</el-button
                >
                <el-button
                  type="primary"
                  v-if="
                    verifyPermissionMenu('/control/user/manage?method=delete*', 'post')
                  "
                  @click="deleteUser($event, scope.row)"
                  >删除</el-button
                >
              </el-button-group>
            </div>
          </template>
        </el-table-column>
      </el-table>
      <div class="pagination-wrapper" v-if="state.isShowPage">
        <el-pagination
          background
          @current-change="page"
          :current-page="state.currentpage"
          :page-size="state.maxresult"
          layout="total, prev, pager, next,jumper"
          :total="state.totalrecord"
        ></el-pagination>
      </div>
    </div>
  </div>
</template>
<script lang="ts" setup>
import {
  ComponentInternalInstance,
  getCurrentInstance,
  onMounted,
  reactive,
  ref,
} from "vue";
import pinia from "@/store/store";
import { useStore } from "@/store";
import { AxiosResponse } from "axios";
import { useRouter } from "vue-router";
import { ElMessage, ElMessageBox, ElTable } from "element-plus";
import { processErrorInfo, verifyPermissionMenu } from "@/utils/tool";
import { UserFilled } from "@element-plus/icons-vue";

const store = useStore(pinia);
const { proxy } = getCurrentInstance() as ComponentInternalInstance;
const router = useRouter();
const multipleTable = ref<InstanceType<typeof ElTable>>();

const state = reactive({
  tableData: [], //表格内容
  multipleSelection: [],
  visible: "true", //是否显示 true:未删除用户 false:已删除用户
  totalrecord: 0, //总记录数
  currentpage: 1, //当前页码
  totalpage: 1, //总页数
  maxresult: 12, //每页显示记录数
  isShowPage: false, //是否显示分页 maxresult没返回结果前就显示会导致分页栏显示页码错误
});

// 批量导入相关变量
const apiUrl = (import.meta.env.VITE_API_URL || "").replace(/\/$/, "");
const uploadUrl = `${apiUrl}/control/user/import/upload`;
const uploadProgress = ref(0);
const showProgress = ref(false);
const progressStatus = ref<"success" | "exception">("success");
const showResultDialog = ref(false);
const showVerifyDialog = ref(false);
const importResult = reactive({
  total: 0,
  success: 0,
  failed: 0,
  errors: [] as any[],
});
const verifyInfo = reactive({
  totalRows: 0,
  validRows: 0,
  invalidRows: 0,
  repeatRows: 0,
});
const currentFile = ref<File | null>(null);

// 下载模板
const downloadTemplate = () => {
  const apiUrl = (import.meta.env.VITE_API_URL || "").replace(/\/$/, "");
  window.open(`${apiUrl}/control/user/import/template`);
};

// 文件选择变化处理
const handleFileChange = (file: any, fileList: any) => {
  currentFile.value = file.raw;
  const isExcel =
    file.raw.type === "application/vnd.ms-excel" ||
    file.raw.type === "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
  const isLt10M = file.raw.size / 1024 / 1024 < 10;
  if (!isExcel) {
    ElMessage.error("上传文件只能是 Excel 格式!");
    (proxy?.$refs.upload as any)?.clearFiles();
    return;
  }
  if (!isLt10M) {
    ElMessage.error("上传文件大小不能超过 10MB!");
    (proxy?.$refs.upload as any)?.clearFiles();
    return;
  }
  verifyExcelFile(file.raw);
};

// 上传前验证文件
const beforeUpload = (file: any) => {
  return false; // 阻止自动上传，等待用户确认
};

// 验证Excel文件内容
const verifyExcelFile = (file: File) => {
  ElMessage.info(
    "请确保Excel文件格式正确：昵称(必填)、等级(默认0)、Email地址(默认空)、预存款(默认0)、积分(默认0)、备注(默认无)、角色(默认无)"
  );
  const formData = new FormData();
  formData.append("file", file);
  proxy
    ?.$axios({
      method: "post",
      url: "/control/user/import/verify",
      data: formData,
    })
    .then((response: AxiosResponse) => {
      if (!response) {
        ElMessage.error("服务器无响应");
        return;
      }
      let responseData = response.data;
      if (typeof responseData === "string") {
        try {
          responseData = JSON.parse(responseData);
        } catch (parseError) {
          ElMessage.error("解析响应数据失败");
          return;
        }
      }
      if (responseData) {
        if (responseData.success) {
          verifyInfo.totalRows = responseData.totalRows || 0;
          verifyInfo.validRows = responseData.validRows || 0;
          verifyInfo.invalidRows = responseData.invalidRows || 0;
          verifyInfo.repeatRows = responseData.repeatRows || 0;
          showVerifyDialog.value = true;
        } else {
          ElMessage.error(responseData.message || "文件验证失败");
        }
      } else {
        ElMessage.error("响应数据无效");
      }
    })
    .catch(() => {
      ElMessage.error("文件验证失败，请重试");
    });
};

// 确认导入
const confirmImport = () => {
  showVerifyDialog.value = false;
  showProgress.value = true;
  uploadProgress.value = 0;
  progressStatus.value = "success";
  const xhr = new XMLHttpRequest();
  const formData = new FormData();
  formData.append("file", currentFile.value!);
  xhr.upload.addEventListener(
    "progress",
    function (e) {
      if (e.lengthComputable) {
        const percent = Math.round((e.loaded / e.total) * 100);
        uploadProgress.value = percent;
      }
    },
    false
  );
  xhr.addEventListener(
    "load",
    function () {
      if (xhr.status === 200) {
        let response;
        try {
          response = JSON.parse(xhr.responseText);
        } catch {
          ElMessage.error("解析导入结果失败");
          showProgress.value = false;
          return;
        }
        handleImportResult(response);
      } else {
        ElMessage.error("导入失败，请重试");
        showProgress.value = false;
      }
    },
    false
  );
  xhr.addEventListener(
    "error",
    function () {
      ElMessage.error("网络错误，请重试");
      showProgress.value = false;
    },
    false
  );
  xhr.open("POST", uploadUrl);
  xhr.send(formData);
};

// 格式化错误信息
const formatErrorMessage = (row: any, column: any, cellValue: any) => {
  if (row.message) {
    return row.message;
  }
  let errorMessages = [];
  if (row.usernameError) {
    errorMessages.push(`用户名: ${row.usernameError}`);
  }
  if (row.mobileError) {
    errorMessages.push(`手机号: ${row.mobileError}`);
  }
  return errorMessages.length > 0 ? errorMessages.join("; ") : "未知错误";
};

// 处理导入结果
const handleImportResult = (response: any) => {
  showProgress.value = false;
  if (!response) {
    ElMessage.error("导入结果为空");
    return;
  }
  if (response.success) {
    importResult.total = response.totalCount || 0;
    importResult.success = response.successCount || 0;
    importResult.failed = response.failedCount || 0;
    importResult.errors = response.errors || [];
    showResultDialog.value = true;
    queryUserList();
  } else {
    ElMessage.error(response.message || "导入失败");
  }
};

// 上传进度回调
const onProgress = (event: any, file: any, fileList: any) => {
  if (event.lengthComputable) {
    uploadProgress.value = Math.round((event.loaded / event.total) * 100);
  }
};

// 上传成功回调
const handleSuccess = (response: any) => {
  showProgress.value = false;
  handleImportResult(response);
};

// 上传错误回调
const handleError = (error: any) => {
  showProgress.value = false;
  progressStatus.value = "exception";
  ElMessage.error("导入失败，请重试");
};

// 批量导出功能
const exportData = () => {
  if (state.multipleSelection.length < 1) {
    ElMessage.warning("请先选择要导出的用户");
    return;
  }
  let userIds = state.multipleSelection.map((item: any) => item.id).join(",");
  window.open(
    `${apiUrl}/control/user/export?visible=${state.visible}&userIds=${userIds}`
  );
};

// ...原有代码...
//查询用户列表
const queryUserList = () => {
  state.tableData = [];
  proxy
    ?.$axios({
      url: "/control/user/list",
      method: "get",
      params: {
        visible: state.visible,
        page: state.currentpage,
      },
      loadingMask: false,
    })
    .then((response: AxiosResponse) => {
      if (response) {
        const result: any = response.data;
        if (result) {
          let returnValue = JSON.parse(result);
          if (returnValue.code === 200) {
            //成功
            let pageView = returnValue.data;
            let topicList = pageView.records;
            if (topicList != null && topicList.length > 0) {
              state.tableData = topicList;
              state.totalrecord = parseInt(pageView.totalrecord);
              state.currentpage = pageView.currentpage;
              state.totalpage = parseInt(pageView.totalpage);
              state.maxresult = pageView.maxresult;
              state.isShowPage = true;
            }
          } else if (returnValue.code === 500) {
            //错误
            processErrorInfo(
              returnValue.data as Map<string, string>,
              reactive({}),
              () => {}
            );
          }
        }
      }
    })
    .catch((error: any) => {
      console.log(error);
    });
};

//分页
const page = (page: number) => {
  store.setCacheNumber();
  router.push({
    path: "/admin/control/user/list",
    query: { visible: state.visible, page: page },
  });
};

//删除用户
const deleteUser = (event: any, row: any) => {
  let target = event.target;
  if (target.nodeName == "SPAN" || target.nodeName == "I") {
    target = event.target.parentNode;
  }
  target.blur();
  if (row) {
    multipleTable.value!.toggleRowSelection(row, true);
  }
  if (state.multipleSelection.length < 1) {
    ElMessage({
      showClose: true,
      message: "至少要选择一行数据",
      type: "error",
    });
    return;
  }
  ElMessageBox.confirm("此操作将删除该项, 是否继续?", {
    cancelButtonText: "取消",
    confirmButtonText: "确定",
  })
    .then(() => {
      let formData = new FormData();
      for (let i = 0; i < state.multipleSelection.length; i++) {
        let rowData: any = state.multipleSelection[i];
        formData.append("userId", rowData.id);
      }
      formData.append("visible", state.visible);
      proxy
        ?.$axios({
          url: "/control/user/manage?method=delete",
          method: "post",
          data: formData,
        })
        .then((response: AxiosResponse) => {
          if (response) {
            const result: any = response.data;
            if (result) {
              let returnValue = JSON.parse(result);
              if (returnValue.code === 200) {
                //成功
                store.setCacheNumber();
                ElMessage({
                  showClose: true,
                  message: "删除成功",
                  type: "success",
                });
                queryUserList();
              } else if (returnValue.code === 500) {
                //错误
                processErrorInfo(
                  returnValue.data as Map<string, string>,
                  reactive({}),
                  () => {}
                );
              }
            }
          }
        })
        .catch((error: any) => {
          console.log(error);
        });
    })
    .catch(() => {
      multipleTable.value!.toggleRowSelection(row, false);
    });
};

//处理多选
const handleSelectionChange = (val: any) => {
  state.multipleSelection = val;
};

//还原用户
const reductionUser = (event: any) => {
  let target = event.target;
  if (target.nodeName == "SPAN" || target.nodeName == "I") {
    target = event.target.parentNode;
  }
  target.blur();
  if (state.multipleSelection.length < 1) {
    ElMessage({
      showClose: true,
      message: "至少要选择一行数据",
      type: "error",
    });
    return;
  }
  ElMessageBox.confirm("此操作将还原该用户, 是否继续?", {
    cancelButtonText: "取消",
    confirmButtonText: "确定",
  })
    .then(() => {
      let formData = new FormData();
      for (let i = 0; i < state.multipleSelection.length; i++) {
        let rowData: any = state.multipleSelection[i];
        formData.append("userId", rowData.id);
      }
      proxy
        ?.$axios({
          url: "/control/user/manage?method=reduction",
          method: "post",
          data: formData,
        })
        .then((response: AxiosResponse) => {
          if (response) {
            const result: any = response.data;
            if (result) {
              let returnValue = JSON.parse(result);
              if (returnValue.code === 200) {
                //成功
                ElMessage({
                  showClose: true,
                  message: "还原成功",
                  type: "success",
                });
                queryUserList();
              } else if (returnValue.code === 500) {
                //错误
                processErrorInfo(
                  returnValue.data as Map<string, string>,
                  reactive({}),
                  () => {}
                );
              }
            }
          }
        })
        .catch((error: any) => {
          console.log(error);
        });
    })
    .catch(() => {
      //取消
    });
};

onMounted(() => {
  store.setCacheComponents(String(router.currentRoute.value.name));
  if (
    router.currentRoute.value.query.visible != undefined &&
    router.currentRoute.value.query.visible != ""
  ) {
    state.visible = router.currentRoute.value.query.visible as string;
  }
  if (
    router.currentRoute.value.query.page != undefined &&
    router.currentRoute.value.query.page != ""
  ) {
    state.currentpage = parseInt(router.currentRoute.value.query.page as string);
  }
  queryUserList();
});
</script>
