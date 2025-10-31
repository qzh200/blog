<!-- 富文本上传文件弹出层 -->
<template>
    <van-popup v-model:show="show_popup" class="richtextEditorUploadFilePopup" :lock-scroll="true" position="bottom" :close-on-popstate="true" close-icon="close" :round="true" :closeable="true"  @closed="closed()"  >     
        <div class="uploadFileModule">
            <div class="scroll" >
                <van-form ref="formRef" @submit="onSubmit" :scroll-to-error="true" class="form-container" >
                    
                    <van-uploader v-model="state.fileList" :upload-text="t('richtextEditorUploadFilePopup.10')" :preview-size="convertViewportWidth('80px')" upload-icon="plus" :before-read="beforeRead" :after-read="afterRead" @delete="deleteFilePreview" accept="*" class="uploadFile-item"/>
                    
                    <!-- placeholder="文件描述" -->
                    <van-field v-model.trim="state.text" ref="textRef" :placeholder="t('richtextEditorUploadFilePopup.20')" type="textarea" autosize rows="1" clearable class="text-item"/>

                    <div class="action-container">
                        <van-row gutter="20" justify="space-between" class="action-item">
                            <van-col span="8">
                                <!-- 删除文件 -->
                                <van-button block plain type="primary" v-if="props.isDeleteFileButton" @click="onDeleteFile">{{t('richtextEditorUploadFilePopup.30')}}</van-button>
                            </van-col>
                            <van-col span="8">
                                <!-- 插入 -->
                                <van-button block type="primary" native-type="submit" >{{t('richtextEditorUploadFilePopup.40')}}</van-button>
                            </van-col>
                        </van-row>
                    </div>
                </van-form>
            </div>
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
        text:'',//文件描述
        link:'',//文件链接
        fileList : [] as any,//上传表单图片列表
    });
   
    //接收父组件消息
    const props = defineProps({
        show: {
            type: Boolean,
            default: false
        },
        uploadFile: {
            type: definePropType<(files:any,callback:(fileLink:string,fileText:string) => void) => void>(Function),
            default: null
        },
        insertFileCallback: {
            type: definePropType<(text: string,link: string) => void>(Function),
            default: null
        },
        deleteFileCallback: {
            type: Function,
            default: null
        },
        text: {
            type: String,
            default: ''
        },
        link: {
            type: String,
            default: ''
        },
        isDeleteFileButton: {
            type: Boolean,
            default: false
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

    //删除文件预览时处理
    const deleteFilePreview = (file:any) => {
        state.text = "";
        state.link = "";
    };
    //上传文件前处理
    const beforeRead = (file:any):boolean => {

        state.text = "";
        state.link = "";

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
        props.uploadFile(files,(fileLink:string,fileText:string)=>{
            state.text = fileText;
            state.link = fileLink;

            
        })
    };


     //提交表单
     const onSubmit = () => {
        if(state.link){
            let text = state.text
            if(text == ''){
                //获取文件名
                text = state.link.substring(state.link.lastIndexOf('/')+1);
            }
           
            props.insertFileCallback(text,state.link);

            show_popup.value = false;
        }else{
            Toast({
                //请选择文件
                message: t('richtextEditorUploadFilePopup.50'),//文本内容，支持通过\n换行
                duration:3000,//展示时长(ms)，值为 0 时，toast 不会消失
                overlay: false,//是否显示背景遮罩层
                closeOnClickOverlay: true,//是否在点击遮罩层后关闭
            });
        }
     }

    //删除文件
    const onDeleteFile = () => {
        props.deleteFileCallback()
        
        show_popup.value = false;
     }


    //关闭弹出层且动画结束后触发。
    const closed = () => {
        props.close();
    }

    onMounted(() => {
        handleCreateLinkPicker();
        state.text = props.text;
        state.link = props.link;
        
        nextTick(()=> {
            textRef.value?.focus();

        });
        
    }) 
   
</script>

<style scoped lang="scss">
.uploadFileModule {
    margin-top: 15px;
    .scroll{
        overflow-y:auto;
        -webkit-overflow-scrolling: touch;
        max-height:calc(60vh - 90px);
    }

    :deep(.form-container){
        .uploadFile-item{
            margin-top: 10px;
            margin-left: 16px;
            margin-right: 16px;
        }
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
        .action-container{
            position: fixed;
            bottom: 0px;
            width: 100%;
            .action-item{
                margin: 8px 16px 16px 16px;
            }
        }
    }
}

</style>

