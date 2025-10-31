<!-- 找回密码 第一步 -->
<template>
    <div class="main">

      

        <div class="main-container">
            <!-- title="找回密码 第一步" left-text="返回" -->
            <van-nav-bar :title="t('findPassWord_step1.10')" :left-text="t('common.110')" left-arrow @click-left="onBack" @click-right="router.push({path: '/'})">
                <template #right>
                    <van-icon name="wap-home-o" :size="convertViewportWidth('18px')"/>
                </template>
            </van-nav-bar>
            <!-- success-text="刷新成功" -->
            <van-pull-refresh v-model="form.isRefreshing" :success-text="t('common.130')" pull-distance="200" @refresh="onRefresh" style="min-height: 50vh;">
            
                <div class="findPassWordModule" >
                    <van-tabs v-model:active="form.type" swipeable v-if="form.allowLoginAccountType.indexOf(10) >-1 ||  form.allowLoginAccountType.indexOf(20) >-1 || form.allowLoginAccountType.indexOf(30) >-1">
                        <template v-for="accountType in form.allowLoginAccountType">
                            <!-- title="账号密码找回" -->
                            <van-tab :title="t('findPassWord_step1.20')" :name="10" v-if="accountType == 10">
                                <van-form ref="formAccountRef" label-width="3.8em" :scroll-to-error="true" class="form-container">
                                    <van-cell-group inset>
                                        <!-- label="账号" placeholder="请输入账号" -->
                                        <van-field v-model.trim="form.account" :label="t('findPassWord_step1.30')" :placeholder="t('findPassWord_step1.40')" maxlength="25" clearable :rules="[{ validator: validatorAccount }]" :error-message="error.account"/>
                                        <!-- label="验证码" placeholder="请输入验证码" -->
                                        <van-field v-model="form.captchaValue" v-if="form.showCaptcha" class="captcha-item" :label="t('common.70')" :placeholder="t('common.120')" maxlength="4" center clearable :rules="[{ validator: checkCaptchaValue }]" :error-message="error.captchaValue">
                                            <template #button>
                                                <van-image :src="form.imgUrl" @click="replaceCaptcha" class="captcha-image"/>
                                            </template>
                                            <template #extra >
                                                <!-- 换一幅 -->
                                                <span class="captcha-replace" @click="replaceCaptcha">{{t('common.80')}}</span>
                                            </template>
                                        </van-field>
                                    
                                    </van-cell-group>
                                    <div class="submitButton">
                                        <!-- 提交 -->
                                        <van-button round block type="primary" native-type="submit" @mousedown="onSubmit" :disabled="form.allowSubmit">{{t('common.50')}}</van-button>
                                    </div>
                                </van-form>
                            </van-tab>
                            <!-- title="手机号找回" -->
                            <van-tab :title="t('findPassWord_step1.50')" :name="20" v-if="accountType == 20">
                                <van-form ref="formMobileRef" label-width="3.8em" :scroll-to-error="true" class="form-container">
                                    <van-cell-group inset>
                                        <!-- label="区号" -->
                                        <van-field v-model="form.countryCodeName" v-if="form.isAllowForeignCellPhoneRegistration" is-link readonly :label="t('findPassWord_step1.130')" @click="onShowCountryCode" class="countryCodePopup" :error-message="error.countryCode"/>
                                    
                                        <!-- label="手机号" placeholder="请输入手机" -->
                                        <van-field v-model.trim="form.mobile" :label="t('findPassWord_step1.60')" :placeholder="t('findPassWord_step1.70')" maxlength="14"  type="tel" clearable :rules="[{ validator: validatorMobile }]" :error-message="error.mobile"/>
                                        <!--label="验证码" placeholder="请输入验证码"-->
                                        <van-field v-model="form.captchaValue" v-if="form.showCaptcha" class="captcha-item" :label="t('common.70')" :placeholder="t('common.120')" maxlength="4" center clearable :rules="[{ validator: checkCaptchaValue }]" :error-message="error.captchaValue">
                                            <template #button>
                                                <van-image :src="form.imgUrl" @click="replaceCaptcha" class="captcha-image"/>
                                            </template>
                                            <template #extra >
                                                <!-- 换一幅 -->
                                                <span class="captcha-replace" @click="replaceCaptcha">{{t('common.80')}}</span>
                                            </template>
                                        </van-field>
                                    
                                    </van-cell-group>
                                    <div class="submitButton">
                                        <!-- 提交 -->
                                        <van-button round block type="primary" native-type="submit" @mousedown="onSubmit" :disabled="form.allowSubmit">{{t('common.50')}}</van-button>
                                    </div>
                                </van-form>
                            </van-tab>
                            <!-- title="邮箱找回" -->
                            <van-tab :title="t('findPassWord_step1.140')" :name="30" v-if="accountType == 30">
                                <van-form ref="formEmailRef" label-width="3.8em" :scroll-to-error="true" class="form-container">
                                    <van-cell-group inset>
                                        
                                        <!-- label="邮箱" placeholder="请输入邮箱" -->
                                        <van-field v-model.trim="form.email" :label="t('findPassWord_step1.150')" :placeholder="t('findPassWord_step1.160')" maxlength="90"  clearable :rules="[{ validator: validatorEmail }]" :error-message="error.email"/>
                                        <!--label="验证码" placeholder="请输入验证码"-->
                                        <van-field v-model="form.captchaValue" v-if="form.showCaptcha" class="captcha-item" :label="t('common.70')" :placeholder="t('common.120')" maxlength="4" center clearable :rules="[{ validator: checkCaptchaValue }]" :error-message="error.captchaValue">
                                            <template #button>
                                                <van-image :src="form.imgUrl" @click="replaceCaptcha" class="captcha-image"/>
                                            </template>
                                            <template #extra >
                                                <!-- 换一幅 -->
                                                <span class="captcha-replace" @click="replaceCaptcha">{{t('common.80')}}</span>
                                            </template>
                                        </van-field>
                                    
                                    </van-cell-group>
                                    <div class="submitButton">
                                        <!-- 提交 -->
                                        <van-button round block type="primary" native-type="submit" @mousedown="onSubmit" :disabled="form.allowSubmit">{{t('common.50')}}</van-button>
                                    </div>
                                </van-form>
                            </van-tab>
                        </template>
                    </van-tabs>

                    <div v-if="form.isLoadingComplete && form.allowLoginAccountType.indexOf(10) <=-1 &&  form.allowLoginAccountType.indexOf(20) <=-1 && form.allowLoginAccountType.indexOf(30) <=-1">
                        <div class="resultModule">
                            <div class="result">
                                <div class="result-icon">
                                    <van-icon name="warning" class="icon-warning" size="64px"/>
                                </div>
                                <div class="result-title">
                                    <p>{{t('findPassWord_step1.190')}}</p><!-- 已关闭此功能 -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </van-pull-refresh>
        </div>
    </div>
</template>


<script lang="ts" setup>
    import { getCurrentInstance, ComponentInternalInstance, reactive, onMounted, ref, watchEffect, onActivated} from 'vue'
    import { onBeforeRouteUpdate, useRouter } from 'vue-router'
    import { AxiosResponse } from 'axios'
    import { getUri, getUrlParam, processErrorInfo} from '@/utils/tool';
    import pinia from '@/store/store'
    import { storeToRefs } from 'pinia';
    import {useStore} from '@/store'
    import { onBack } from '@/utils/history'
    import { convertViewportWidth } from '@/utils/px-to-viewport';
    import { useI18n } from 'vue-i18n';
    import { CountryCode } from '@/types';
    import { countryCodePopUp, getDefaultCountryCode } from '@/components/countryCode/countryCodeTool';
    let { t } = useI18n();

    const { proxy,appContext } = getCurrentInstance() as ComponentInternalInstance;
    const store = useStore(pinia);
    const router = useRouter();
    const {title:store_title,keywords:store_keywords,description:store_description,systemUser:store_systemUser} = storeToRefs(store)
 


    //html页元信息
    watchEffect(() => {
        let titleValue = store_title.value//监听网站标题
        if(titleValue != null && titleValue != ''){
            document.title = t('findPassWord_step1.80')+' - ' + titleValue;//找回密码
        }
    }, {
        flush: 'post'//在组件更新后触发，第一次运行需要组件渲染完成才执行
    })



    const form = reactive({
        type:10,//类型 10.账号密码找回 20.手机号找回
        account:'',//账号
        countryCode:'',//区号
        countryCodeName:'',//区号名称
        mobile:'',//手机号
        email:'',//邮箱
        allowLoginAccountType: [] as Array<number>,//允许登录账号类型
        isAllowForeignCellPhoneRegistration:false,//是否允许国外手机号注册
        showCaptcha:true,//是否显示验证码
        captchaKey: '',//验证码key
        captchaValue: '',//验证码值
        imgUrl: '',//验证码图片
        allowSubmit:false,//提交按钮disabled状态
        isLoadingComplete : false,//是否加载完成

        isRefreshing:false,//是否处于下拉加载中状态
    });
    

    //错误
    const error = reactive({
        account:'',//账号
        countryCode:'',//区号
        mobile:'',//手机号
        email:'',//邮箱
        captchaValue:'',//验证码
    })

    //下拉刷新时触发
    const onRefresh = () => {
        form.isRefreshing = false;

        //重置
        form.type = 10;//类型 10.账号密码找回 20.手机号找回 30.邮箱找回
        form.account = '';//账号
        form.countryCode='',//区号
        form.countryCodeName='',//区号名称
        form.mobile = '';//手机号
        form.email = '';//邮箱
        form.allowLoginAccountType.length=0;//允许登录账号类型
        form.isAllowForeignCellPhoneRegistration = false;//是否允许国外手机号注册
        form.showCaptcha = true;//是否显示验证码
        form.captchaKey =  '';//验证码key
        form.captchaValue =  '';//验证码值
        form.imgUrl =  '';//验证码图片
        form.allowSubmit = false;//提交按钮disabled状态
        form.isLoadingComplete = false;//是否加载完成

        init();
    };

    //显示区号选项
    const onShowCountryCode = () => {
        countryCodePopUp(proxy,appContext,form.countryCode,(data)=>{
            form.countryCode = data.phone_code;
            form.countryCodeName= data.name+' (+'+data.phone_code+')';//区号名称
        });
    }

    //查询找回密码第一步
    const queryFindPassWord_step1 = () => {
        proxy?.$axios({
            url: '/findPassWord/step1',
            method: 'get',
            params:  { 
               
            },
            //showLoading: false,//是否显示加载图标
            //loadingMask:false,// 是否显示遮罩层
        })
        .then((response: AxiosResponse) => {
            if(response){
                const result: any = response.data;
                form.isLoadingComplete = true;
                if(result.allowLoginAccountType){
                    form.allowLoginAccountType = result.allowLoginAccountType;//允许登录账号类型
                    if(result.allowLoginAccountType && result.allowLoginAccountType.length >0){
                        for(let i=0; i<result.allowLoginAccountType.length; i++){
                            let type = result.allowLoginAccountType[i];
                            if(type <= 30){
                                form.type = type;
                                break;
                            }
                        }
                    }
                }
                form.isAllowForeignCellPhoneRegistration = result.isAllowForeignCellPhoneRegistration;//是否允许国外手机号注册
                form.captchaKey = result.captchaKey;
                replaceCaptcha();
            }
            
        })
        .catch((error: any) =>{
            console.log(error);
        });
    }
    

     //校验账号
     const validatorAccount = (val:any):boolean => {
        if(val != ''){
            if(val.length <3 || val.length>25){
                error.account = t('findPassWord_step1.90')//账号在 3 至 25个字符之间
                return false;
            }
        }else{
            error.account = t('findPassWord_step1.100')//账号不能为空
            return false;
        }
        error.account = "";
        return true;
    }
    //校验手机号
    const validatorMobile = (val:any):boolean => {
        if(val != ''){
            if(val.length <7 || val.length>14){
                error.mobile = t('findPassWord_step1.110');//手机号码长度不正确
                return false;
            }
        }else{
            error.mobile = t('findPassWord_step1.120')//手机号不能为空
            return false;
        }
        error.mobile = "";
        return true;
    }
    //校验邮箱
    const validatorEmail = (val:any):boolean => {
        if(val != ''){
            if(val.length <5 || val.length>90){
                error.email = t('findPassWord_step1.170');//邮箱长度不正确
                return false;
            }
        }else{
            error.email = t('findPassWord_step1.180')//邮箱不能为空
            return false;
        }
        error.email = "";
        return true;
    }

    //刷新验证码
    const replaceCaptcha = () => {
        form.imgUrl = store.apiUrl+"captcha/" + form.captchaKey + ".jpg?" + Math.random();
    }
    //校验验证码
    const checkCaptchaValue = (val:any):Promise<boolean | string> => {
        return new Promise((resolve) => {
            if(form.captchaKey != null && form.captchaKey != ''){
                if(val != ''){
                    if (val.length < 4) {
                        error.captchaValue = t('common.20');//验证码长度为4个字符
                        resolve(false);
                    } else { 
                        if(form.allowSubmit){//按下提交按钮则不再请求校验验证码
                            resolve(true);
                            return;
                        }
                        proxy?.$axios({
                            url: '/userVerification',
                            method: 'get',
                            params:  {
                                captchaKey:form.captchaKey,
                                captchaValue:form.captchaValue
                            },
                            showLoading: false,//是否显示加载图标
                            loadingMask:false,// 是否显示遮罩层
                        })
                        .then((response: AxiosResponse) => {
                            if(form.allowSubmit){//按下提交按钮则不再处理校验验证码
                                resolve(true);
                                return;
                            }
                            if(response){
                                const result: any = response.data;
                                if(!JSON.parse(result)){
                                    error.captchaValue = t('common.30');//验证码错误
                                    resolve(false);
                                }else{
                                    error.captchaValue = "";
                                    resolve(true);
                                }
                            }
                        }).catch((error: any) =>{
                            console.log(error);
                        });
                    }
                }else{
                    error.captchaValue = t('common.10');//验证码不能为空
                    resolve(false);
                }

            }else{
                error.captchaValue = "";
                resolve(true);
            }
        });
    }


    //提交数据
    const onSubmit = () => {
        form.allowSubmit = true;//提交按钮disabled状态


        const p1 = new Promise<void>((resolve, reject) => {
            if(form.type == 10){//账号密码用户
                // 全局表单验证
                (proxy?.$refs['formAccountRef'] as any)[0]?.validate().then(() => {
                    resolve();
                }).catch(() => {
                    form.allowSubmit = false;//提交按钮disabled状态
                })
            }else{
                resolve();
            }
            
        });

        const p2 = new Promise<void>((resolve, reject) => {
            if(form.type == 20){//手机号用户
                // 全局表单验证
                (proxy?.$refs['formMobileRef'] as any)[0]?.validate().then(() => {
                    resolve();
                }).catch(() => {
                    form.allowSubmit = false;//提交按钮disabled状态
                })
            }else{
                resolve();
            }
        });

        const p3 = new Promise<void>((resolve, reject) => {
            if(form.type == 30){//邮箱用户
                // 全局表单验证
                (proxy?.$refs['formEmailRef'] as any)[0]?.validate().then(() => {
                    resolve();
                }).catch(() => {
                    form.allowSubmit = false;//提交按钮disabled状态
                })
            }else{
                resolve();
            }
        });
        Promise.all([p1,p2,p3])
            .then(() => {
                //清空error的属性值
                Object.keys(error).map(key => {
                    Object.assign(error, {[key] : ''});
                })
            

                let formData = new FormData();
                if(form.type == 10){//10:本地账号密码用户
                    formData.append('type', String(form.type));
                    //账号
                    if(form.account != ''){
                        formData.append('account', form.account);
                    }
                }else if(form.type == 20){//20: 手机用户
                    formData.append('type', String(form.type));
                    //手机号
                    if(form.mobile != ''){
                        //区号
                        formData.append('countryCode', form.countryCode);

                        formData.append('mobile', form.mobile);
                    }
                }else if(form.type == 30){//30: 邮箱用户
                    formData.append('type', String(form.type));
                    //邮箱
                    if(form.email != ''){
                        formData.append('email', form.email);
                    }
                }
                //验证码Key
                formData.append('captchaKey', form.captchaKey);
                //验证码值
                if(form.captchaValue != ''){
                    formData.append('captchaValue', form.captchaValue.trim());
                }

                proxy?.$axios({
                    url: '/findPassWord/step1',
                    method: 'post',
                    data: formData
                })
                .then((response: AxiosResponse) => {
                    if(response){

                        const result: any = response.data;
                        let jumpUrl = result.jumpUrl;
                        if(JSON.parse(result.success)){

                            let uri = getUri(jumpUrl);
                            let userName = getUrlParam(jumpUrl,'userName');
                            let countryCode = getUrlParam(jumpUrl,'countryCode');
                            let mobile = getUrlParam(jumpUrl,'mobile');
                            let email= getUrlParam(jumpUrl,'email');
                            router.push({
                                path : '/'+uri,
                                query:{
                                    userName: userName,
                                    countryCode: countryCode,
                                    mobile:mobile,
                                    email:email
                                }
                            });
                        }else{
                            //处理错误信息
                            processErrorInfo(result.error as Map<string,string> , error,()=>{});
                            

                            form.allowSubmit = false;//提交按钮disabled状态

                            if(result.captchaKey != null){
                                form.showCaptcha = true;
                                form.captchaKey = result.captchaKey;
                                replaceCaptcha();
                            }

                        }
                    }
                })
                .catch((error: any) =>{
                    console.log(error);
                    form.allowSubmit = false;//提交按钮disabled状态
                });
            }).catch(() => {
                console.log("提交数据错误");
            });

    }
    //导航守卫
    onBeforeRouteUpdate((to, from, next) => {
        if(to.name == 'findPassWord_step1'){
            queryFindPassWord_step1();
        }
        
        next();
    });
    onMounted(() => {
        init();
        
    }) 

    //初始化
    const init = () => {
		queryFindPassWord_step1();
        
        //获取默认国际区号
        let countryCode:CountryCode = getDefaultCountryCode();
        form.countryCode = countryCode.phone_code;
        form.countryCodeName= countryCode.name+' (+'+countryCode.phone_code+')';//区号名称
	}
    
    //进入keep-alive组件时触发
    onActivated(()=>{
        //后退时修改浏览器标题
        let titleValue = store_title.value
        if(titleValue != null && titleValue != ''){
            document.title = t('findPassWord_step1.80')+' - ' + titleValue;//找回密码
        }
    })
</script>

<style scoped lang="scss">
.findPassWordModule{
    margin-top: var(--van-cell-group-inset-padding);
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
}
</style>
