<!-- 富文本上传图片弹出层 -->
<template>
    <van-popup v-model:show="show_popup" class="richtextEditorUploadImagePopup" :lock-scroll="true" position="bottom" :close-on-popstate="true" close-icon="close" :round="true" :closeable="true"  @closed="closed()"  >     
        <div class="uploadImageModule">

            <van-tabs v-model:active="state.type" swipeable >
                <!-- 上传图片 -->
                <van-tab :title="t('richtextEditorUploadImagePopup.10')" :name="'upload'">
                    <div class="tab-content">
                        <div class="scroll">
                            <div class="uploadImage-tab-item-container">
                                <!-- 选择图片 -->
                                <van-uploader v-model="state.fileList" multiple :upload-text="t('richtextEditorUploadImagePopup.60')" :preview-size="convertViewportWidth('80px')" upload-icon="plus" :before-read="beforeRead"/>
                            </div>
                            <div class="action-container">
                                <van-row gutter="20" justify="space-between" class="action-item">
                                    <van-col span="8">
                                        
                                    </van-col>
                                    <van-col span="8">
                                        <!-- 上传 -->
                                        <van-button block type="primary" @click="onUpload">{{t('richtextEditorUploadImagePopup.70')}}</van-button>
                                    </van-col>
                                </van-row>
                            </div>
                        </div>
                    </div>
                </van-tab>
                <!-- 网络图片 -->
                <van-tab :title="t('richtextEditorUploadImagePopup.20')" :name="'url'">
                    <div class="tab-content">
                        <div class="scroll">
                            <div class="netImage-tab-item-container">
                                <van-form ref="formRef" :scroll-to-error="true" class="form-container" >
                   
                                    <!-- placeholder="图片链接" -->
                                    <van-field v-model.trim="state.link" ref="textRef" :placeholder="t('richtextEditorUploadImagePopup.30')" type="textarea" autosize rows="3" clearable class="text-item"/>

                                    
                                    
                                </van-form>
                            </div>
                            <div class="action-container">
                                <van-row gutter="20" justify="space-between" class="action-item">
                                    <van-col span="8">
                                        
                                    </van-col>
                                    <van-col span="8">
                                        <!-- 插入 -->
                                        <van-button block type="primary" @click="onSubmit">{{t('richtextEditorUploadImagePopup.100')}}</van-button>
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

    const textRef = ref<FieldInstance>();


    const state = reactive({
        type :'upload',//类型 upload、url
        fileList : [] as any,//上传表单图片列表
        description:'',//图片描述
        link:'',//图片链接
    });
   
    //接收父组件消息
    const props = defineProps({
        show: {
            type: Boolean,
            default: false
        },
        insertUrlCallback: {
            type: definePropType<(description: string,link: string) => void>(Function),
            default: null
        },
        uploadImage: {
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

    const handleCreateLinkPicker = () => {
        show_popup.value = props.show;

    };


    //上传图片前处理
    const beforeRead = (file:any):boolean => {

        return true;
    };
    
    //上传
    const onUpload = () => {
        if(state.type == 'upload'){
            if(state.fileList.length){

                let files = new Array();
                //图片
                for(let i=0; i<state.fileList.length; i++){
                    let fileData = state.fileList[i];
                    files.push(fileData.file);
                }

                props.uploadImage(files)
                show_popup.value = false;
            }else{
                Toast({
                    //请选择图片
                    message: t('richtextEditorUploadImagePopup.80'),//文本内容，支持通过\n换行
                    duration:3000,//展示时长(ms)，值为 0 时，toast 不会消失
                    overlay: false,//是否显示背景遮罩层
                    closeOnClickOverlay: true,//是否在点击遮罩层后关闭
                });
            }
        }
       
     }


     //提交表单
     const onSubmit = () => {
        if(state.type == 'url'){
            if(state.link){
                props.insertUrlCallback(state.description,state.link);
                show_popup.value = false;
            }else{
                Toast({
                    //请填写链接
                    message: t('richtextEditorUploadImagePopup.90'),//文本内容，支持通过\n换行
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
        handleCreateLinkPicker();
       
        nextTick(()=> {
            textRef.value?.focus();

        });
        
    }) 
   
</script>

<style scoped lang="scss">
.uploadImageModule {
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
            .uploadImage-tab-item-container{
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

            .netImage-tab-item-container{
               

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

