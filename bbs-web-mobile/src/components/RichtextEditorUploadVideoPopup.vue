<!-- 富文本上传视频弹出层 -->
<template>
    <van-popup v-model:show="show_popup" class="richtextEditorUploadVideoPopup" :lock-scroll="true" position="bottom" :close-on-popstate="true" close-icon="close" :round="true" :closeable="true"  @closed="closed()"  >     
        <div class="uploadVideoModule">

            <van-tabs v-model:active="state.type" swipeable >
                <!-- 上传视频 -->
                <van-tab :title="t('richtextEditorUploadVideoPopup.10')" :name="'uploadVideo'">
                    <div class="tab-content">
                        <div class="scroll">
                            <div class="uploadVideo-tab-item-container">
                                <!-- 选择视频 -->
                                <van-uploader v-model="state.fileList" :upload-text="t('richtextEditorUploadVideoPopup.30')" :preview-size="convertViewportWidth('80px')" upload-icon="plus" :before-read="beforeRead" :after-read="afterRead" accept="*" class="uploadVideo-item"/>
                   
                            </div>
                        </div>
                    </div>
                </van-tab>
                <!-- 嵌入视频 -->
                <van-tab :title="t('richtextEditorUploadVideoPopup.20')" :name="'embedVideo'">
                    <div class="tab-content">
                        <div class="scroll">
                            <div class="embedVideo-tab-item-container">
                                <van-form ref="formRef" :scroll-to-error="true" class="form-container" >
                   
                                    <!-- placeholder="代码格式如：&lt;iframe src=https://.. >&lt;/iframe>" -->
                                    <van-field v-model.trim="state.link" :placeholder="t('richtextEditorUploadVideoPopup.40')" type="textarea" autosize rows="3" clearable class="text-item"/>

                                    
                                    
                                </van-form>
                            </div>
                            <div class="action-container">
                                <van-row gutter="20" justify="space-between" class="action-item">
                                    <van-col span="8">
                                        
                                    </van-col>
                                    <van-col span="8">
                                        <!-- 插入 -->
                                        <van-button block type="primary" @click="onSubmit">{{t('richtextEditorUploadVideoPopup.50')}}</van-button>
                                    </van-col>
                                </van-row>
                            </div>
                        </div>
                    </div>
                </van-tab>
            </van-tabs>
        </div>
    </van-popup>
</template>

<script setup lang="ts">
    import { nextTick, onMounted, reactive, ref} from 'vue'
    import { definePropType } from '@/utils/tool';
    import i18n from "@/locale/index";
    import { FieldInstance, Toast } from 'vant';
    import { convertViewportWidth } from '@/utils/px-to-viewport';

    const { t } = i18n.global;

    const show_popup = ref(false);

    const state = reactive({
        type :'uploadVideo',//类型 uploadVideo、embedVideo
        fileList : [] as any,//上传表单图片列表
        link:'',//嵌入视频链接
    });
   
    //接收父组件消息
    const props = defineProps({
        show: {
            type: Boolean,
            default: false
        },
        embedVideoCallback: {
            type: definePropType<(link: string) => void>(Function),
            default: null
        },
        uploadVideo: {
            type: definePropType<(fileList: any) => void>(Function),
            default: null
        },
        close: {
            type: definePropType<() => void>(Function),
            required: true,
        }
      //  onClickOutside: {//在选取器外部发生单击时回调
      //      type: Function,
      //      default: null
      //  },
    })  

    const handleCreateVideoPopup = () => {
        show_popup.value = props.show;

    };
    
    //上传文件前处理
    const beforeRead = (file:any):boolean => {

        return true;
    };
    //文件读取完成后处理
    const afterRead = (file:any) => {
        let files = new Array();
        files.push(file.file);
        //删除前一个文件
        if(state.fileList.length >=2){
            state.fileList.shift();
        }
        props.uploadVideo(files)
        props.close();
    };


     //提交表单
     const onSubmit = () => {
        if(state.type == 'embedVideo'){
            if(state.link){
                props.embedVideoCallback(state.link);
                show_popup.value = false;
            }else{
                Toast({
                    //请填写链接
                    message: t('richtextEditorUploadVideoPopup.60'),//文本内容，支持通过\n换行
                    duration:3000,//展示时长(ms)，值为 0 时，toast 不会消失
                    overlay: false,//是否显示背景遮罩层
                    closeOnClickOverlay: true,//是否在点击遮罩层后关闭
                });
            }
        }
     }

    //关闭弹出层且动画结束后触发。
    const closed = () => {
        props.close();
    }

    onMounted(() => {
        handleCreateVideoPopup();
       
    }) 
   
</script>

<style scoped lang="scss">
.uploadVideoModule {
    margin-top: 15px;

    width: 100%;
    height: 100%; 
    :deep(.van-tabs--line .van-tabs__wrap) {
        margin-left: var(--van-cell-group-inset-padding);
        margin-right: var(--van-cell-group-inset-padding);
        padding-bottom: 10px;
        background: #fff;
        border-radius: var(--van-cell-group-inset-border-radius) var(--van-cell-group-inset-border-radius) 0px 0px;
    }
    :deep(.van-cell-group--inset) {
        margin: 0px var(--van-cell-group-inset-padding);
        border-radius: 0px 0px var(--van-cell-group-inset-border-radius) var(--van-cell-group-inset-border-radius);
    }
    :deep(.van-tabs__line) {
        background: var(--van-blue);
    }
    .tab-content{
        height: calc(60vh - 70px);
        .scroll{
            overflow-y:auto;
            -webkit-overflow-scrolling: touch;
            max-height:calc(60vh - 142px);
            .uploadVideo-tab-item-container{
                margin-top: 10px;
                margin-left: 16px;
                margin-right: 6px;
                margin-bottom: 16px;
            }
            :deep(.action-container){
                position: fixed;
                bottom: 0px;
                width: 50%;//两个van-tab标签选项
                .action-item{
                    margin: 8px 16px 16px 16px;
                }
            }

            .embedVideo-tab-item-container{
               

                :deep(.form-container){
                    .text-item{
                        .van-field__control{
                            padding: 10px;
                            background-color: var(--van-gray-1);
                            overflow:hidden;//让输入框触摸可以滑动
                        }
                        &:after{
                            border-bottom: 1px solid transparent;
                        }
                    }
                }
                
            }
        }
    }
}

</style>

