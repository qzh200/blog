<!-- 富文本'隐藏标签'弹出层 -->
<template>
    <van-popup v-model:show="show_popup" class="richtextEditorHidePopup" :lock-scroll="true" position="bottom" :close-on-popstate="true" close-icon="close" :round="true" :closeable="true"  @closed="closed()"  >     
        <div class="hideModule">
            <div class="scroll" >
                <van-form ref="formRef" :scroll-to-error="true" class="form-container" >
                    <van-radio-group v-model="state.hideType" class="hideType" :disabled="state.type == 'edit'">
                        <div v-for="visibleType in props.menus">
                            <!--输入密码可见-->
                            <van-radio name="10" v-if="visibleType == 'hidePassword'" class="hideType-item">{{t('richtextEditorHidePopup.10')}}</van-radio>
                            <!--回复话题可见-->
                            <van-radio name="20" v-if="visibleType == 'hideComment'" class="hideType-item">{{t('richtextEditorHidePopup.20')}}</van-radio>
                            <!--达到等级可见-->
                            <van-radio name="30" v-if="visibleType == 'hideGrade'" class="hideType-item">{{t('richtextEditorHidePopup.30')}}</van-radio>
                            <!--积分购买可见-->
                            <van-radio name="40" v-if="visibleType == 'hidePoint'" class="hideType-item">{{t('richtextEditorHidePopup.40')}}</van-radio>
                            <!--余额购买可见-->
                            <van-radio name="50" v-if="visibleType == 'hideAmount'" class="hideType-item">{{t('richtextEditorHidePopup.50')}}</van-radio>
                        </div>
                    </van-radio-group>
                    <!-- placeholder="请填写密码" -->
                    <van-field v-model.trim="state.password" v-if="state.hideType == '10'" :placeholder="t('richtextEditorHidePopup.60')" maxlength="30" clearable class="password-field"/>
                  

                    <van-row gutter="20" align="center" v-if="state.hideType == '30'" class="grade-item">
                        <van-col>
                            {{t('richtextEditorHidePopup.70')}}
                        </van-col>
                        <van-col span="12">
                            <van-dropdown-menu direction="up" active-color="#1989fa" >
                                <van-dropdown-item v-model="state.gradePoint" :options="state.gradeOption" @change="onSelectGrade"/>
                            </van-dropdown-menu>
                        </van-col>
                    </van-row>
                    <!-- 等级达到{p1}以上可见 -->
                    <div class="prompt" v-if="state.hideType == '30'">
                        <i18n-t keypath="richtextEditorHidePopup.90"  scope="global" >
                            <template #p1>
                                <span class="highlight">{{ state.gradeName }}</span>
                            </template>
                        </i18n-t>
                    </div>

                    <!-- placeholder="请填写积分" -->
                    <van-field v-model.trim="state.point" v-if="state.hideType == '40'" type="digit" :placeholder="t('richtextEditorHidePopup.100')" maxlength="10" clearable class="password-field"/>
                    <!-- 需要支付{p1}积分可见 -->
                    <div class="prompt" v-if="state.hideType == '40'">
                        <i18n-t keypath="richtextEditorHidePopup.110"  scope="global">
                            <template #p1>
                                <span class="highlight"> {{ state.point }} </span>
                            </template>
                        </i18n-t>
                    </div>

                    <!-- placeholder="请填写价格" -->
                    <van-field v-model.trim="state.price" v-if="state.hideType == '50'" :placeholder="t('richtextEditorHidePopup.130')" maxlength="10" clearable class="password-field"/>
                    <!-- 需要支付{p1}元费用可见 -->
                    <div class="prompt" v-if="state.hideType == '50'">
                        <i18n-t keypath="richtextEditorHidePopup.140"  scope="global">
                            <template #p1>
                                <span class="highlight"> {{ state.price }} </span>
                            </template>
                        </i18n-t>
                    </div>

                    <div class="action-container">
                        <van-row gutter="20" justify="space-between" class="action-item">
                            <van-col span="8">
                                <!-- 删除 -->
                                <van-button block plain type="primary" v-if="state.type == 'edit'" @click="onDeleteHideTag">{{t('richtextEditorHidePopup.170')}}</van-button>
                            </van-col>
                            <van-col span="8">
                                <!-- 插入 -->
                                <van-button block type="primary" @click="onAddHideTag" >{{t('richtextEditorHidePopup.160')}}</van-button>
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
    import { UserGrade } from '@/types';
    import { useI18n } from 'vue-i18n';
    import Long from 'long';
    import { Toast } from 'vant';
    let { t } = useI18n();

    const show_popup = ref(false);

    //Select 选择器选项
    interface OptionsItem {
        text: string;
        value: string;
    }


    const state = reactive({
        type: 'add',//add、edit

        hideType:'10',//隐藏类型
        password:'',//密码
        gradePoint:'',//等级积分
        gradeName:'',//等级
        gradeOption : new Array<OptionsItem>(),
        point:'',//积分
        price:'',//价格
        
            
    });
   
    //接收父组件消息
    const props = defineProps({
        show: {
            type: Boolean,
            default: false
        },
        insertHideTagCallback: {
            type: definePropType<(visibleType: string, inputValue: string) => void>(Function),
            default: null
        },
        editHideTagCallback: {
            type: Function,
            default: null
        },
        deleteHideTagCallback: {
            type: Function,
            default: null
        },
        menus: {
            type: Array<String>,
        },
        selectedVisibleType: {
            type: String,
            default: ''
        },
        inputValue: {
            type: String,
            default: ''
        },
        userGradeList: {
            type: Array<UserGrade>,
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

    const init = () => {
        show_popup.value = props.show;

        if(props.selectedVisibleType!= null && props.selectedVisibleType != ''){
            state.type = 'edit';
            state.hideType = props.selectedVisibleType;
            if(props.selectedVisibleType == '10'){
                state.password = props.inputValue;

            }else if(props.selectedVisibleType == '20'){
                

            }else if(props.selectedVisibleType == '30'){
                state.gradePoint = props.inputValue;
            }else if(props.selectedVisibleType == '40'){
                state.point = props.inputValue;
            }else if(props.selectedVisibleType == '50'){
                state.price = props.inputValue;
            }
        }else{
            state.type = 'add';
        }

        if(props.userGradeList != null && props.userGradeList.length >0){
            for(let i =0; i<props.userGradeList.length; i++){
                let userGrade = props.userGradeList[i];
                
                if(Long.fromString(userGrade.needPoint).gt(0)){
                    let obj = new Object() as OptionsItem;
                    obj.text = userGrade.name;
                    obj.value = userGrade.needPoint;
                    state.gradeOption.push(obj);

                    

                    if(state.gradePoint == ''){
                        state.gradeName = userGrade.name;
                        state.gradePoint = userGrade.needPoint;
                    }else{
                        if(state.gradePoint == userGrade.needPoint){
                            state.gradeName = userGrade.name;
                        }
                    }
                }
            }
        }



    };

    //选择等级
    const onSelectGrade = (value:string) => {
        for(let i =0; i<props.userGradeList.length; i++){
            let userGrade = props.userGradeList[i];
            if(userGrade.needPoint == value){
                state.gradeName = userGrade.name;
            }
        }
    }
    


     //提交表单
     const onAddHideTag = () => {
        if(state.hideType == '10'){
            if(state.password != ''){
                if(state.type=='add'){//添加
                    props.insertHideTagCallback(state.hideType,state.password)
                }else{//修改
                    props.editHideTagCallback(state.hideType,state.password)
                }
                
                        
                show_popup.value = false;
            }else{
                Toast({
                    //请填写密码
                    message: t('richtextEditorHidePopup.60'),//文本内容，支持通过\n换行
                    duration:3000,//展示时长(ms)，值为 0 时，toast 不会消失
                    overlay: false,//是否显示背景遮罩层
                    closeOnClickOverlay: true,//是否在点击遮罩层后关闭
                });
            }
        }else if(state.hideType == '20'){
            if(state.type=='add'){//添加
                props.insertHideTagCallback(state.hideType,'')
            }else{
                props.editHideTagCallback(state.hideType,'')
            }
            show_popup.value = false;
        }else if(state.hideType == '30'){
            if(state.gradePoint != ''){
                if(state.type=='add'){//添加
                    props.insertHideTagCallback(state.hideType,state.gradePoint)
                }else{
                    props.editHideTagCallback(state.hideType,state.gradePoint)
                }
                show_popup.value = false;
            }else{
                Toast({
                    //请选择等级
                    message: t('richtextEditorHidePopup.80'),//文本内容，支持通过\n换行
                    duration:3000,//展示时长(ms)，值为 0 时，toast 不会消失
                    overlay: false,//是否显示背景遮罩层
                    closeOnClickOverlay: true,//是否在点击遮罩层后关闭
                });
            }
        }else if(state.hideType == '40'){
            if(state.point != '' && Long.fromString(state.point).gt(0)){
                if(state.type=='add'){//添加
                    props.insertHideTagCallback(state.hideType,state.point)
                }else{
                    props.editHideTagCallback(state.hideType,state.point)
                }
                show_popup.value = false;
            }else{
                Toast({
                    //请输入大于0的数字
                    message: t('richtextEditorHidePopup.120'),//文本内容，支持通过\n换行
                    duration:3000,//展示时长(ms)，值为 0 时，toast 不会消失
                    overlay: false,//是否显示背景遮罩层
                    closeOnClickOverlay: true,//是否在点击遮罩层后关闭
                });
            }
        }else if(state.hideType == '50'){
            if(state.price != '' && /^[0-9]*[1-9][0-9]*$/.test(state.price)){
                if(state.type=='add'){//添加
                    props.insertHideTagCallback(state.hideType,state.price)
                }else{
                    props.editHideTagCallback(state.hideType,state.price)
                }
                show_popup.value = false;
            }else{
                Toast({
                    //请输入大于0的金额
                    message: t('richtextEditorHidePopup.150'),//文本内容，支持通过\n换行
                    duration:3000,//展示时长(ms)，值为 0 时，toast 不会消失
                    overlay: false,//是否显示背景遮罩层
                    closeOnClickOverlay: true,//是否在点击遮罩层后关闭
                });
            }
        }
     }

    //删除‘隐藏标签‘
    const onDeleteHideTag = () => {
        props.deleteHideTagCallback()
        
        show_popup.value = false;
     }


    //关闭弹出层且动画结束后触发。
    const closed = () => {
        props.close();
    }

    onMounted(() => {
        init();



        
        
    }) 
   
</script>

<style scoped lang="scss">
:deep(.van-dropdown-item__content) {
    max-height: 60%;
}

:deep(.van-dropdown-menu__bar) {
    height: 44px;
}
:deep(.van-dropdown-menu__item) {
    border: 1px solid #dcdee0;
    border-radius :2px;
}
.hideModule {
    margin-top: 15px;
    .scroll{
        overflow-y:auto;
        -webkit-overflow-scrolling: touch;
        max-height:calc(60vh - 90px);
    }
    :deep(.form-container){
        .hideType{
            margin: 8px 16px 16px 16px;
            .hideType-item{
                margin-bottom: 14px;
            }
        }
        .password-field{
            .van-field__control{
                padding: 10px;
                background-color: var(--van-gray-1);
            }
            &:after{
                border-bottom: 1px solid transparent;
            }
        }
        .grade-item{
            margin: 20px 16px 16px 16px;
        }
        .prompt{
            margin: 8px 16px 16px 16px;
            font-size: 14px;
            line-height: 26px;
            color: var(--van-gray-5);
            display: flex;
            align-items: center;
            .highlight{
                background-color: var(--van-gray-2);
                color: var(--van-gray-5);
                padding: 0px 8px;
                border-radius:2px;
                min-width: 12px;
                height: 26px;
                display:inline-block;
                margin-left: 4px;
                margin-right: 4px;
            }
        }
        .point-field{
            width: 100px;
            .van-field__control{
                padding: 10px;
                background-color: var(--van-gray-1);
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

