<!-- 富文本插入链接弹出层 -->
<template>
    <van-popup v-model:show="show_popup" class="richtextEditorLinkPopup" :lock-scroll="true" position="bottom" :close-on-popstate="true" close-icon="close" :round="true" :closeable="true"  @closed="closed()"  >     
        <div class="linkModule">
            <div class="scroll" >
                <van-form ref="formRef" @submit="onSubmit" :scroll-to-error="true" class="form-container" >
                   
                    <!-- placeholder="链接文字" -->
                    <van-field v-model="state.text" ref="textRef" :placeholder="t('richtextEditorLinkPopup.10')" type="textarea" autosize rows="1" clearable class="text-item"/>

                    <van-field v-model.trim="state.link" :placeholder="t('richtextEditorLinkPopup.40')" type="textarea" autosize rows="4" clearable class="text-item"/>

                    <div class="action-container">
                        <van-row gutter="20" justify="space-between" class="action-item">
                            <van-col span="8">
                                <!-- 删除链接 -->
                                <van-button block plain type="primary" v-if="props.isDeleteLinkButton" @click="onDeleteLink">{{t('richtextEditorLinkPopup.50')}}</van-button>
                            </van-col>
                            <van-col span="8">
                                <!-- 插入链接 -->
                                <van-button block type="primary" native-type="submit" >{{t('richtextEditorLinkPopup.60')}}</van-button>
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
    
    const { t } = i18n.global;

    const show_popup = ref(false);

    const textRef = ref<FieldInstance>();

    const state = reactive({
        text:'',//链接文字
        link:'',//链接
    });
   
    //接收父组件消息
    const props = defineProps({
        show: {
            type: Boolean,
            default: false
        },
        insertLinkCallback: {
            type: definePropType<(text: string,link: string) => void>(Function),
            default: null
        },
        deleteLinkCallback: {
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
        isDeleteLinkButton: {
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




     //提交表单
     const onSubmit = () => {
        if(state.link != ''){
            if(state.text.trim() != '' ){
                props.insertLinkCallback(state.text.trim(),state.link)
            }else{
                props.insertLinkCallback(state.link,state.link)
            }
            show_popup.value = false;
        }else{
            Toast({
                //请填写链接
                message: t('richtextEditorLinkPopup.70'),//文本内容，支持通过\n换行
                duration:3000,//展示时长(ms)，值为 0 时，toast 不会消失
                overlay: false,//是否显示背景遮罩层
                closeOnClickOverlay: true,//是否在点击遮罩层后关闭
            });
        }
        
     }

    //删除链接
    const onDeleteLink = () => {
        props.deleteLinkCallback()
        
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
.linkModule {
    margin-top: 15px;
    .scroll{
        overflow-y:auto;
        -webkit-overflow-scrolling: touch;
        max-height:calc(60vh - 90px);
    }
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

