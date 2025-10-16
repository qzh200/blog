<!-- 用户列表 -->
<template id="userList-template">
	<div>
		<div class="main">
			<div class="navbar" style="display: flex; align-items: center; gap: 10px; flex-wrap: nowrap; overflow-x: auto;">
				<el-button type="primary" plain size="small" @click="downloadTemplate">下载批量导入模板</el-button>
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
					:auto-upload="false">
					<el-button type="primary" plain size="small">批量导入</el-button>
				</el-upload>
				<el-button type="primary" plain size="small" @click="exportData">批量导出</el-button>
				<div style="display: flex; gap: 10px; flex-shrink: 0;">
					<el-button type="primary" plain size="small" v-if="visible == 'false'" @click="$router.push({path: '/admin/control/user/list', query:{ visible : true}})">返回</el-button>
				<el-button type="primary" plain size="small" v-if="visible == 'true'" @click="$router.push({path: '/admin/control/user/manage/add', query:{ page:($route.query.page != undefined ? $route.query.page:'')}});">添加会员</el-button>
				<el-button type="primary" plain size="small" v-if="visible == 'true'" @click="$router.push({path: '/admin/control/user/list', query:{ visible : false}})">回收站</el-button>
				<el-button type="primary" plain size="small" v-if="visible == 'false'" @click="reductionUser($event)">还原</el-button>
					<el-button type="primary" plain size="small"  @click="deleteUser($event)">批量删除</el-button>
				</div>
			</div>
			
			<!-- 导入进度条 -->
			<el-progress 
				v-if="showProgress" 
				:percentage="uploadProgress" 
				:status="progressStatus"
				style="margin-top: 15px;">
			</el-progress>
			
			<!-- 导入结果反馈 -->
		<el-dialog 
			v-model="showResultDialog" 
			title="导入结果" 
			width="60%"
			:close-on-click-modal="false">
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
							:formatter="formatErrorMessage">
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
				:close-on-click-modal="false">
				<div class="verify-info">
					<p>检测到数据：{{ verifyInfo.totalRows }} 条</p>
					<p v-if="verifyInfo.repeatRows > 0" class="text-warning">发现重复数据：{{ verifyInfo.repeatRows }} 条</p>
					<p v-if="verifyInfo.invalidRows > 0" class="text-danger">发现无效数据：{{ verifyInfo.invalidRows }} 条</p>
					<p v-if="verifyInfo.validRows > 0" class="text-success">有效数据：{{ verifyInfo.validRows }} 条</p>
				</div>
				<template #footer>
					<el-button @click="showVerifyDialog = false">取消</el-button>
					<el-button type="primary" @click="confirmImport" :disabled="verifyInfo.validRows === 0">确认导入</el-button>
				</template>
			</el-dialog>
			
			<div class="data-table" >
				<el-table ref="multipleTable" :data="tableData" tooltip-effect="dark" style="width: 100%" @selection-change="handleSelectionChange" stripe empty-text="没有内容">
					<el-table-column type="selection" ></el-table-column>
					<el-table-column label="账号" align="center">
				    	<template #default="scope">
				    	
				        	<div class="multipleInfo-wrapper" >
				            <div>{{scope.row.account}}</div>
				            	<div class="multipleInfo-wrapper-blue" v-if="scope.row.type ==20">
				            手机号{{scope.row.mobile}}
				            </div>
				            <div class="multipleInfo-wrapper-green" v-if="scope.row.type !=20 && scope.row.mobile !=null && scope.row.mobile !='' ">
							绑定手机{{scope.row.mobile}}
				            </div>
							<div class="multipleInfo-wrapper-tangerine" v-if="scope.row.type ==30">
							邮箱{{scope.row.email}}
						</div>
							<div class="multipleInfo-wrapper-pink" v-if="scope.row.type !=30 && scope.row.email !=null && scope.row.email !='' ">
							绑定邮箱{{scope.row.email}}
						</div>
						<el-tag effect="dark"  v-if="scope.row.cancelAccountTime !='-1'" type="danger" class="tag-wrapper">已注销</el-tag>
				          </div>  
				    	</template>
				    </el-table-column>
					<el-table-column prop="nickname" label="呢称" align="center" ></el-table-column>
					<el-table-column label="头像" align="center" min-width="100">
						<template #default="scope">
					    	
				          	<div class="user-avatar-wrapper" >
								<div class="avatar-badge" v-if="scope.row.avatarName == null || scope.row.avatarName == ''">
									<el-avatar :size="48" icon="el-icon-user-solid"></el-avatar>
								</div>
								<div class="avatar-badge" v-if="scope.row.avatarName != null && scope.row.avatarName != ''">
									<el-avatar :size="48" :src="scope.row.avatarPath+'100x100/'+scope.row.avatarName"></el-avatar>
								</div>
							</div>
					    	
				    	</template>
					</el-table-column>
					<el-table-column label="类型" align="center" width="110">
						<template #default="scope">
							<el-tag effect="dark"  v-if="scope.row.type==10" type="warning" class="tag-wrapper">账号密码用户</el-tag>
							<el-tag effect="dark"  v-if="scope.row.type==20" class="tag-wrapper" >手机用户</el-tag>
							<el-tag effect="dark"  v-if="scope.row.type==30" type="info" class="tag-wrapper-tangerine" >邮箱用户</el-tag>
							<el-tag effect="dark"  v-if="scope.row.type==40" type="success" class="tag-wrapper" >微信用户</el-tag>
							<el-tag effect="dark"  v-if="scope.row.type==80" class="tag-wrapper-purple" >其他用户</el-tag>
				    	</template>
					</el-table-column>
					<el-table-column prop="point" label="积分" align="center" ></el-table-column>
					<el-table-column prop="gradeName" label="会员等级" align="center" width="100"></el-table-column>
					<el-table-column prop="registrationDate" label="注册日期" align="center" width="150"></el-table-column>
					<el-table-column label="状态" align="center" width="100">
						<template #default="scope">
							<el-tag effect="dark"  v-if="scope.row.state == 1" type="success" class="tag-wrapper">启用</el-tag>
							<el-tag effect="dark"  v-if="scope.row.state == 2" type="info" class="tag-wrapper">停用</el-tag>
					    	<el-tag effect="dark"  v-if="scope.row.state ==11" type="warning" class="tag-wrapper">启用时删除</el-tag>
							<el-tag effect="dark"  v-if="scope.row.state ==12" type="danger" class="tag-wrapper">停用时删除</el-tag>
				    	</template>
					</el-table-column>
					<el-table-column label="操作" align="center" width="200">
						<template #default="scope">
							<div class="button-group-wrapper">
								<el-button-group>
									<el-button type="primary" size="mini" @click="$router.push({path: '/admin/control/user/manage/show', query:{ id : scope.row.id}})">查看</el-button>
									<el-button type="primary" size="mini" @click="$router.push({path: '/admin/control/user/manage/edit', query:{ id : scope.row.id}})">修改</el-button>
									<el-button type="primary" size="mini" @click="deleteUser($event,scope.row)">删除</el-button>
								</el-button-group>
							</div>
				    	</template>
				
					</el-table-column>
				</el-table>
				<div class="pagination-wrapper" v-if="isShowPage">
					<el-pagination background  @current-change="page" :current-page="currentpage"  :page-size="maxresult" layout="total, prev, pager, next,jumper" :total="totalrecord"></el-pagination>
				</div>
			</div>
			
		</div>
		 
	</div>
</template>

<script>
//用户列表
export default({
	name: 'userList',//组件名称，keep-alive缓存需要本参数
	template : '#userList-template',
	inject:['reload'], 
	data : function data() {
		return {
			tableData: [],//表格内容
			multipleSelection: [],
			
			visible :'true',//是否显示 true:未删除用户 false:已删除用户
		    totalrecord : 0, //总记录数
		    currentpage : 1, //当前页码
			totalpage : 1, //总页数
			maxresult: 12, //每页显示记录数
			isShowPage:false,//是否显示分页 maxresult没返回结果前就显示会导致分页栏显示页码错误
			
			// 导入相关变量
		uploadUrl: '/control/user/import/upload',
		uploadProgress: 0,
		showProgress: false,
		progressStatus: 'success',
		showResultDialog: false,
		showVerifyDialog: false,
		importResult: {
			total: 0,
			success: 0,
			failed: 0,
			errors: []
		},
		verifyInfo: {
			totalRows: 0,
			validRows: 0,
			invalidRows: 0,
			repeatRows: 0
		},
		currentFile: null
		};
	},
	
	created : function created() {
		//设置缓存
		this.$store.commit('setCacheComponents',  [this.$route.name]);

		if(this.$route.query.visible != undefined && this.$route.query.visible != ''){
			this.visible = this.$route.query.visible;
		}
		if(this.$route.query.page != undefined && this.$route.query.page != ''){
			this.currentpage = this.$route.query.page;
		}
		//初始化
		this.queryUserList();
	},
	methods : {
		downloadTemplate() {
			window.open('/control/user/import/template');
		},
		
		// 文件选择变化处理
		handleFileChange(file, fileList) {
			// 保存当前文件引用
			this.currentFile = file.raw;
			
			// 检查文件类型
			const isExcel = file.raw.type === 'application/vnd.ms-excel' || 
				file.raw.type === 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';
			const isLt10M = file.raw.size / 1024 / 1024 < 10;

			if (!isExcel) {
				this.$message.error('上传文件只能是 Excel 格式!');
				// 清除文件选择
				this.$refs.upload.clearFiles();
				return;
			}
			if (!isLt10M) {
				this.$message.error('上传文件大小不能超过 10MB!');
				// 清除文件选择
				this.$refs.upload.clearFiles();
				return;
			}
			
			// 进行文件预验证
			this.verifyExcelFile(file.raw);
		},
		
		// 上传前验证文件
		beforeUpload(file) {
			// 由于使用了on-change，这里可以保持简单
			return false; // 阻止自动上传，等待用户确认
		},
		
		// 验证Excel文件内容
		verifyExcelFile(file) {
			// 提示用户Excel文件的列顺序和必填项
			this.$message.info('请确保Excel文件格式正确：昵称(必填)、等级(默认0)、Email地址(默认空)、预存款(默认0)、积分(默认0)、备注(默认无)、角色(默认无)');
		  const formData = new FormData();
		  formData.append('file', file);
		  console.log('开始验证文件...');
		  this.$ajax({
		    method: 'post',
		    url: '/control/user/import/verify',
		    data: formData,
		    processData: false,
		    contentType: false
		  }).then(response => {
		    console.log('验证响应:', response);
		    // 确保response存在
		    if (!response) {
		      console.error('响应为空');
		      this.$message.error('服务器无响应');
		      return;
		    }
		    
		    // 获取响应数据
		    let responseData = response.data;
		    
		    // 重点修改：检查responseData是否为字符串，如果是则尝试解析为JSON对象
		    if (typeof responseData === 'string') {
		      try {
		        responseData = JSON.parse(responseData);
		        console.log('解析后的响应数据:', responseData);
		      } catch (parseError) {
		        console.error('解析响应数据失败:', parseError);
		        this.$message.error('解析响应数据失败');
		        return;
		      }
		    }
		    
		    // 处理解析后的数据
		    if (responseData) {
		      if (responseData.success) {
		        console.log('验证成功，有效行数:', responseData.validRows);
		        // 显示验证结果
		        this.verifyInfo = {
		          totalRows: responseData.totalRows || 0,
		          validRows: responseData.validRows || 0,
		          invalidRows: responseData.invalidRows || 0,
		          repeatRows: responseData.repeatRows || 0
		        };
		        this.showVerifyDialog = true;
		      } else {
		        console.log('验证失败:', responseData.message);
		        this.$message.error(responseData.message || '文件验证失败');
		      }
		    } else {
		      console.error('响应数据为空或无效');
		      this.$message.error('响应数据无效');
		    }
		  }).catch(error => {
		    console.error('文件验证失败:', error);
		    this.$message.error('文件验证失败，请重试');
		  });
		}
		,
		// 确认导入
		confirmImport() {
		  console.log('开始导入数据...');
		  this.showVerifyDialog = false;
		  
		  // 显示进度条
		  this.showProgress = true;
		  this.uploadProgress = 0;
		  this.progressStatus = 'success';
		  
		  // 使用原生XMLHttpRequest来获取上传进度
		  const xhr = new XMLHttpRequest();
		  const _self = this;
		  
		  // 创建表单数据
		  const formData = new FormData();
		  formData.append('file', this.currentFile);
		  
		  xhr.upload.addEventListener('progress', function(e) {
		    if (e.lengthComputable) {
		      const percent = Math.round((e.loaded / e.total) * 100);
		      _self.uploadProgress = percent;
		    }
		  }, false);
		  
		  xhr.addEventListener('load', function() {
		    console.log('导入请求完成，状态码:', xhr.status);
		    if (xhr.status === 200) {
		      try {
		        console.log('导入响应内容:', xhr.responseText);
		        
		        // 重点修改：尝试解析响应
		        let response;
		        if (typeof xhr.responseText === 'string') {
		          try {
		            response = JSON.parse(xhr.responseText);
		            console.log('解析后的导入结果:', response);
		          } catch (parseError) {
		            console.error('解析导入结果失败:', parseError);
		            _self.$message.error('解析导入结果失败');
		            _self.showProgress = false;
		            return;
		          }
		        } else {
		          response = xhr.responseText;
		        }
		        
		        _self.handleImportResult(response);
		      } catch (error) {
		        console.error('解析导入结果失败:', error);
		        _self.$message.error('解析导入结果失败');
		        _self.showProgress = false;
		      }
		    } else {
		      console.error('导入失败，HTTP状态码:', xhr.status);
		      _self.$message.error('导入失败，请重试');
		      _self.showProgress = false;
		    }
		  }, false);
		  
		  xhr.addEventListener('error', function() {
		    console.error('导入网络错误');
		    _self.$message.error('网络错误，请重试');
		    _self.showProgress = false;
		  }, false);
		  
		  xhr.open('POST', _self.uploadUrl);
		  xhr.send(formData);
		}
		,
		// 格式化错误信息
		formatErrorMessage(row, column, cellValue) {
			// 如果有直接的message字段，直接返回
			if (row.message) {
				return row.message;
			}
			
			// 否则检查具体的字段错误
			let errorMessages = [];
			if (row.usernameError) {
				errorMessages.push(`用户名: ${row.usernameError}`);
			}
			if (row.mobileError) {
				errorMessages.push(`手机号: ${row.mobileError}`);
			}
			
			return errorMessages.length > 0 ? errorMessages.join('; ') : '未知错误';
		},
		
		// 处理导入结果
		handleImportResult(response) {
			console.log('处理导入结果:', response);
			this.showProgress = false;
			
			// 确保response存在
			if (!response) {
				console.error('导入结果为空');
				this.$message.error('导入结果为空');
				return;
			}
			
			if (response.success) {
				console.log('导入成功，成功条数:', response.successCount);
				// 映射后端返回的数据格式到前端需要的格式
				this.importResult = {
					total: response.totalCount || 0,
					success: response.successCount || 0,
					failed: response.failedCount || 0,
					errors: response.errors || []
				};
				this.showResultDialog = true;
				this.queryUserList(); // 刷新用户列表
			} else {
				console.log('导入失败:', response.message);
				this.$message.error(response.message || '导入失败');
			}
		},
		
		// 上传进度回调
		onProgress(event, file, fileList) {
			if (event.lengthComputable) {
				this.uploadProgress = Math.round((event.loaded / event.total) * 100);
			}
		},
		
		// 上传成功回调
		handleSuccess(response) {
			// 由于我们使用XMLHttpRequest处理上传，这个方法可能不会被调用
			// 但保留以防止意外情况
			this.showProgress = false;
			this.handleImportResult(response);
		},
		
		// 上传错误回调
		handleError(error) {
			this.showProgress = false;
			this.progressStatus = 'exception';
			this.$message.error('导入失败，请重试');
			console.error('导入错误:', error);
		},
		
		//查询用户列表
		queryUserList : function() {
			let _self = this;
			
			
			//清空内容
			_self.tableData = []; 
			
			
			_self.$ajax.get('control/user/list', {
			    params: {
			    	visible :_self.visible,
			    	page :  _self.currentpage
			    }
			})
			.then(function (response) {
				if(response == null){
					return;
				}
			    let result = response.data;
			    if(result){
			    	let returnValue = JSON.parse(result);
			    	if(returnValue.code === 200){//成功
			    		let pageView = returnValue.data;
			    		let topicList = pageView.records;
			    		if(topicList != null && topicList.length >0){
			    			_self.tableData = topicList;
			 
			    			_self.totalrecord = parseInt(pageView.totalrecord);//服务器返回的long类型已转为String类型
			    			_self.currentpage = pageView.currentpage;
						_self.totalpage = parseInt(pageView.totalpage);//服务器返回的long类型已转为String类型
						_self.maxresult = pageView.maxresult;
						_self.isShowPage = true;//显示分页栏
			    		}
			    	}else if(returnValue.code === 500){//错误
			    	}
			    }
			})
			.catch(function (error) {
				console.log(error);
			});
		},
		//分页
		page: function(page) {
			//删除缓存
			this.$store.commit('setCacheNumber');
			this.$router.push({
				path: '/admin/control/user/list', 
				query:{visible : this.visible,page : page}
			});
	    },
		//删除用户
	    deleteUser : function(event,row) {
			//强制失去焦点
			let target = event.target;
			// 根据button组件内容 里面包括一个span标签，如果设置icon，则还包括一个i标签，其他情况请自行观察。
    		// 所以，在我们点击到button组件上的文字也就是span标签上时，直接执行e.target.blur()不会生效，所以要加一层判断。
        	if(target.nodeName == 'SPAN' || target.nodeName == 'I'){
            	target = event.target.parentNode;
       		}
        	target.blur();
			
		
			let _self = this;
			if (row) {//选中行
				this.$refs.multipleTable.toggleRowSelection(row,true);
			}
			
			if(this.multipleSelection.length <1){
				this.$message.error('至少要选择一行数据');
				return;
			}
			
			
			
			this.$confirm('此操作将删除该项, 是否继续?', '提示', {
	            confirmButtonText: '确定',
	            cancelButtonText: '取消',
	            type: 'warning'
	        }).then(() => {
				let formData = new FormData();
				for(let i=0; i<this.multipleSelection.length; i++){
					let rowData = this.multipleSelection[i];
					formData.append('userId', rowData.id);
				}
				formData.append('visible', _self.visible);
				
				this.$ajax({
				    method: 'post',
				    url: 'control/user/manage?method=delete',
				    data: formData
				})
				.then(function (response) {
					if(response == null){
						return;
					}
				    let result = response.data;
				    if(result){
				    	let returnValue = JSON.parse(result);
				    	if(returnValue.code === 200){//成功
				    		_self.$message.success("删除成功");
				    		//删除缓存
				  			_self.$store.commit('setCacheNumber');
				    		_self.queryUserList();
				    	}else if(returnValue.code === 500){//错误
				    	
				    		let errorMap = returnValue.data;
				    		let htmlContent = "";
				    		let count = 0;
				    		for (let key in errorMap) {   
				    			count++;
				    			htmlContent += "<p>"+count + ". " + errorMap[key]+"</p>";
				    			
				    	    }
				    		_self.$alert(htmlContent, '错误', {
				    			showConfirmButton :false,
				    			dangerouslyUseHTMLString: true
				    		})
				    		.catch(function (error) {
							console.log(error);
						});
				    	}
				    }
				})
				.catch(function (error) {
					console.log(error);
				});
				
			}).catch((error) => {
				//取消选中行
				this.$refs.multipleTable.toggleRowSelection(row,false);
				console.log(error);
			});
	    },
	  	//处理多选
	    handleSelectionChange: function(val) {
	        this.multipleSelection = val;
	    },
	  	//还原用户
	    reductionUser : function(event) {
	    	//强制失去焦点
			let target = event.target;
			// 根据button组件内容 里面包括一个span标签，如果设置icon，则还包括一个i标签，其他情况请自行观察。
    		// 所以，在我们点击到button组件上的文字也就是span标签上时，直接执行e.target.blur()不会生效，所以要加一层判断。
        	if(target.nodeName == 'SPAN' || target.nodeName == 'I'){
            	target = event.target.parentNode;
       		}
	    	target.blur();
	    	
	    	let _self = this;
	    	
	    	if(this.multipleSelection.length <1){
	    		this.$message.error('至少要选择一行数据');
	    		return;
	    	}
	    	
	    	this.$confirm('此操作将还原该用户, 是否继续?', '提示', {
	            confirmButtonText: '确定',
	            cancelButtonText: '取消',
	            type: 'warning'
	        }).then(() => {
	        	let formData = new FormData();
		    	
		    	for(let i=0; i<this.multipleSelection.length; i++){
		    		let rowData = this.multipleSelection[i];
		    		formData.append('userId', rowData.id);
		    	}
		    	
		    	
				this.$ajax({
			        method: 'post',
			        url: 'control/user/manage?method=reduction',
			        data: formData
				})
				.then(function (response) {
					if(response == null){
						return;
					}
				    let result = response.data;
				    if(result){
				    	
				    	let returnValue = JSON.parse(result);
				    	if(returnValue.code === 200){//成功
				    		_self.$message.success("还原成功");
				    		_self.queryUserList();
				    	}else if(returnValue.code === 500){//错误
				    	
				    		let errorMap = returnValue.data;
				    		let htmlContent = "";
				    		let count = 0;
				    		for (let key in errorMap) {   
				    			count++;
				    			htmlContent += "<p>"+count + ". " + errorMap[key]+"</p>";
				    			
				    	    }
				    	
				    	
				    		_self.$alert(htmlContent, '错误', {
				    			showConfirmButton :false,
				    			dangerouslyUseHTMLString: true
				    		})
				    		.catch(function (error) {
								console.log(error);
							});
				    	}
				    }
				})
				.catch(function (error) {
					console.log(error);
				});
	        }).catch((error) => {
	        	
	        	console.log(error);
	        });
	    },
		
		// 批量导出功能
		exportData() {
			// 检查是否有选中的用户
			if(this.multipleSelection.length < 1) {
				this.$message.warning('请先选择要导出的用户');
				return;
			}
			
			// 构建选中用户的ID列表
			let userIds = this.multipleSelection.map(item => item.id).join(',');
			
			// 调用后端API进行批量导出，带上用户ID列表参数
			window.open(`/control/user/export?visible=${this.visible}&userIds=${userIds}`);
		}
	}
});
</script>

<style scoped>
/* 导入结果样式 */
.import-result {
	padding: 10px 0;
}

.result-summary {
	margin-bottom: 15px;
	line-height: 1.8;
}

/* 验证信息样式 */
.verify-info {
	padding: 10px 0;
	line-height: 1.8;
}

.text-warning {
	color: #f56c6c;
}

.text-danger {
	color: #e6a23c;
}

.text-success {
	color: #67c23a;
}
</style>
