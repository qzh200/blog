<!-- 富文本插入代码弹出层 -->
<template>
    <van-popup v-model:show="show_popup" class="richtextEditorInsertCodePopup" :lock-scroll="true" position="bottom" :close-on-popstate="true" close-icon="close" :round="true" :closeable="true"  @closed="closed()" :before-close="onBeforeClose" >
            
        <div class="insertCodeModule">
            
            <van-form ref="formRef" @submit="onSubmit" :scroll-to-error="true" class="form-container" >
                
                <!-- 自适应:autosize="state.autosize" placeholder="请输入代码" 
                <van-field v-model="state.code" rows="5" type="textarea" :placeholder="t('richtextEditorInsertCodePopup.10')"  class="code-item"/>-->
                <van-field class="code-item">
                    <template #input>
                        <textarea ref="codeRef" v-html="state.code" :placeholder="t('richtextEditorInsertCodePopup.10')" ></textarea>
                    </template>
                </van-field>
                

                <van-row gutter="20" justify="space-between" class="action-item">
                    <van-col span="9">
                        <van-dropdown-menu direction="up" active-color="#1989fa" >
                            <van-dropdown-item v-model="state.language" :options="state.languageOption" @open="onOpenMenu" @close="onCloseMenu"/>
                        </van-dropdown-menu>
                    </van-col>
                    <van-col span="8">
                        <!-- 插入代码 -->
                        <van-button block type="primary" native-type="submit" >{{t('richtextEditorInsertCodePopup.20')}}</van-button>
                    </van-col>
                </van-row>
            </van-form>
        </div>
    </van-popup>
</template>

<script setup lang="ts">
    import { markRaw, nextTick, onMounted, reactive, ref} from 'vue'
    import { definePropType } from '@/utils/tool';
    import i18n from "@/locale/index";
    import { FieldAutosizeConfig, Toast } from 'vant';
    import CodeMirror from "codemirror";
    import "codemirror/lib/codemirror.css";
    import "codemirror/mode/xml/xml";
    import "codemirror/mode/javascript/javascript";
    import "codemirror/mode/css/css";
    import "codemirror/mode/htmlmixed/htmlmixed";
    import "codemirror/mode/vue/vue";
    import "codemirror/addon/display/placeholder";
    
    const { t } = i18n.global;

    const show_popup = ref(false);

    const codeRef = ref();
    

    const state = reactive({
        autosize:{ maxHeight: 250, minHeight: 250 } as FieldAutosizeConfig,
        language: 'other',//语言
        showLanguageMenu:false,//是否显示语言菜单
        code:'',//代码
        editor:{} as any,//代码编辑器
        languageOption : [
                    { text: 'JavaScript', value:'js' },
                    { text: 'HTML', value: 'html' },
                    { text: 'CSS', value: 'CSS' },
                    { text: 'Java', value: 'java' },
                    { text: 'Python', value: 'py' },
                    { text: 'PHP', value: 'php' },
                    { text: 'C/C++', value: 'cpp' },
                    { text: 'Shell', value: 'bsh' },
                    { text: 'Go', value: 'go' },
                    { text: 'Ruby', value: 'rb' },
                    { text: 'Perl', value: 'pl' },
                    { text: 'C#', value: 'cs' },
                    { text: 'XML', value: 'xml' },
                    { text: t('richtextEditorInsertCodePopup.30') , value: 'other'},
                ]
    });
   
    //接收父组件消息
    const props = defineProps({
        show: {
            type: Boolean,
            default: false
        },
        language: {
            type: String,
            default: ''
        },
        code: {
            type: String,
            default: ''
        },
        type: {
            type: String,
            default: 'new'
        },
        callback: {
            type: definePropType<(language: string,code: string,type: string) => void>(Function),
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
    
   
    const handleCreateInsertCodePicker = () => {
        show_popup.value = props.show;

    };


    //打开语言菜单
    const onOpenMenu = () => {
        state.showLanguageMenu = true;
    }
    //关闭语言菜单
    const onCloseMenu = () => {
        state.showLanguageMenu = false;
    }

     //提交表单
     const onSubmit = () => {
        if(state.editor.getValue() != ''){
            props.callback(state.language,state.editor.getValue(),props.type)
        
            show_popup.value = false;
        }else{
            Toast({
                //请输入代码
                message: t('richtextEditorInsertCodePopup.10'),//文本内容，支持通过\n换行
                duration:3000,//展示时长(ms)，值为 0 时，toast 不会消失
                overlay: false,//是否显示背景遮罩层
                closeOnClickOverlay: true,//是否在点击遮罩层后关闭
            });
        }
        
     }


    //关闭前的回调函数，返回 false 可阻止关闭，支持返回 Promise
    const onBeforeClose = (action: string) => {
        if(state.showLanguageMenu){
            return false;
        }else{
            return true;
        }
    }

    //关闭弹出层且动画结束后触发。
    const closed = () => {

        state.editor.toTextArea();//删除编辑器，并恢复原始文本区（内容与编辑器的当前内容保持一致）
        codeRef.value = ""
        props.close();
    }

    onMounted(() => {
        handleCreateInsertCodePicker();
        state.code = props.code;

        CodeMirror.commands.autocomplete = function(cm:any) {
			CodeMirror.simpleHint(cm, CodeMirror.javascriptHint); 
		};


        nextTick(()=> {
            let editor = markRaw(CodeMirror.fromTextArea(codeRef.value, {
                lineNumbers: true,
                mode: 'text/html',
                indentUnit: 4,
                extraKeys: {"Alt-/": "autocomplete"},
                lineSeparator: '\n', // 强制所有内容使用 LF
                indentWithTabs: true,
                autoCloseTags: true,
                lineWrapping: true, //自动换行
            }));
            editor.setSize("100%",'auto');//设置自适应高度 
            if(state.code == ''){
                editor.focus();//设置焦点‌
            }
           
           //editor.setValue(state.code);
           state.editor = editor;

        });


        if(props.language){
            state.language = props.language;
        }
        
    }) 
   
</script>

<style scoped lang="scss">

:deep(.van-overlay) {
    background: transparent;
}

:deep(.van-dropdown-item__content) {
    max-height: 75%;
}

:deep(.van-dropdown-menu__bar) {
    height: 44px;
}
:deep(.van-dropdown-menu__item) {
    border: 1px solid #dcdee0;
    border-radius :2px;
}
:deep(.CodeMirror pre) {
    word-break: break-all !important;  //长单词或数字在容器边缘换行
}
:deep(.CodeMirror-scroll) {
    cursor: text;
    height: calc(80vh - 100px);//弹出层已设置80%的高度
}
:deep(.CodeMirror pre.CodeMirror-placeholder){
  color: #c8c9cc;
  font-size: 15px;
}


.insertCodeModule {
    margin-top: 15px;
    
    :deep(.form-container){
        position: fixed;
        bottom: 0px;
        width: 100%;
        .code-item{
            border-top-left-radius:20px;
            border-top-right-radius:20px;
        
            &:after{
                border-bottom: 1px solid transparent;
            }
        }
        .action-item{
            margin: 8px 16px 16px 16px;
        }
    }
}

</style>

