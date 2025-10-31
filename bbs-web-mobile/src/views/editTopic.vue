<!-- 修改话题页 -->
<template>
    <div class="main">
        <div class="main-container">
            <!-- title="修改话题" left-text="返回" -->
            <van-nav-bar :title="t('editTopic.10')" :left-text="t('common.110')" left-arrow @click-left="onBack" @click-right="router.push({path: '/'})">
                <template #right>
                    <van-icon name="wap-home-o" :size="convertViewportWidth('18px')"/>
                </template>
            </van-nav-bar>
             <!-- success-text="刷新成功" -->
            <van-pull-refresh v-model="form.isRefreshing" :success-text="t('common.130')" pull-distance="200" @refresh="onRefresh" style="min-height: 50vh;">
            
                <div class="editTopicModule" v-if="store_systemUser != null && Object.keys(store_systemUser).length>0">
                    <van-form ref="formRef" :scroll-to-error="true" class="form-container" v-if="form.allowTopic">
                        <van-cell-group inset>
                            <!-- label="标题" placeholder="请输入标题" -->
                            <van-field v-model.trim="form.title" :label="t('editTopic.20')" :placeholder="t('editTopic.30')" maxlength="90" clearable :rules="[{ validator: validatorTitle }]" :error-message="error.title"/>
                            <!-- label="发起投票" -->
                            <van-field is-link readonly :label="t('editTopic.120')" v-if="form.isVoteView" :class="form.isVote ? 'redEnvelope-arrow-down':'redEnvelope-arrow-right'" @click="voteForm">
                                <template #input>
                                    
                                </template>
                            </van-field>
                            <div v-if="form.isVote">
                                <!-- label="投票标题" placeholder="请输入投票标题" -->
                                <van-field v-model.trim="form.voteTitle" :label="t('editTopic.140')" :placeholder="t('editTopic.150')" maxlength="150" clearable :error-message="error.voteTitle"/>
                           
                                 <!-- label="投票类型" -->
                                <van-field :label="t('editTopic.160')">
                                    <template #input>
                                        <van-radio-group v-model="form.voteMaxChoice" direction="horizontal">
                                            <van-radio :name="1">{{t('editTopic.170')}}</van-radio><!--单选-->
                                            <van-radio :name="-1">{{t('editTopic.180')}}</van-radio><!--多选-->
                                        </van-radio-group>
                                    </template>
                                </van-field>
                                

                                <div class="van-cell cell-field">
                                    <div class="van-cell__title van-field__label cell-field-title">
                                        <span>{{t('editTopic.190')}}</span> <!-- 投票截止时间 -->
                                    </div>
                                    <div class="van-cell__value">
                                        <span>
                                            <!--  placeholder="选择时间" -->
                                            <van-field v-model="form.voteEndDate_format" is-link readonly :placeholder="t('editTopic.200')" @click="onShowDatetimePicker" class="cell-field-value tagPopup voteEndDate" :error-message="error.voteEndDate">
                                                <template #button>
                                                    <!-- 清除按钮 -->
                                                    <i v-if="form.voteEndDate_format != null && form.voteEndDate_format != ''" class="van-badge__wrapper van-icon van-icon-clear van-field__clear" @click="onClearVoteEndDate($event)"></i>
                                                </template>
                                            </van-field>
                                        </span>
                                    </div>
                                    <div class="van-cell__label cell-field-label">
                                        <span class="help-text">
                                            <!-- 空值表示没有截止时间 -->
                                            <span>{{t('editTopic.210')}}</span>
                                        </span>
                                    </div>
                                </div>

                                
                                <van-popup v-model:show="form.showDatetimePicker" round position="bottom">
                                    <DatetimesecPicker v-model="form.voteEndDate" @cancel="form.showDatetimePicker = false" :datetimePickerProps="{ 'visible-item-count': 5, title: t('addTopic.340') }" :pickerProps="{ 'visible-item-count': 5 }" @confirm="onVoteEndDate"/>
                                </van-popup>

                                
                                <template v-for="(voteOption, index) in form.voteOptions">
                                    <van-field v-model="voteOption.text" :placeholder="t('addTopic.370')" maxlength="50" clearable class="clearUnderline">
                                        <template #button>
                                            <div class="option-button-container">
                                                <!--上移-->
                                                <van-button icon="arrow-up" type="primary"  plain size="mini" round class="option-button" @click.prevent="moveUp(voteOption)"></van-button>
                                                <!--下移-->
                                                <van-button icon="arrow-down" type="primary"  plain size="mini" round class="option-button" @click.prevent="moveDown(voteOption)"></van-button>
                                                <!--删除-->
                                                <van-button icon="delete-o" type="primary"  plain size="mini" round class="option-button" @click.prevent="removeItem(voteOption)"></van-button>
                                            </div>
                                        </template>
                                    </van-field>
                                </template>

                                <van-cell class="lastItem">
                                    <template #title>
                                        <!--增加投票选项-->
                                        <van-button plain type="primary" :disabled="form.voteOptions.length >= form.maxVoteOptions" size="small" class="addItem-button" @click="addItem">{{t('editTopic.220')}}</van-button>
                                    </template>
                                    <template #label>
                                        <div class="van-field__error-message" v-if="error.voteOption != ''">{{error.voteOption}}</div>
                                    </template>
                                    
                                    
                                </van-cell>
                            </div>
                            <van-field center :error-message="error.content">
                                <template #input>
                                    <div v-show="!form.isMarkdown" style="width: 100%; ">
                                        <van-sticky :z-index="1" >
                                            <div ref="topicContentEditorToolbarRef" class="editor-toolbar" style="padding-top: 5px;margin-left: -12px;"></div>
                                        </van-sticky>
                                        <div ref="topicContentEditorTextRef"  class="editor-text" style="min-height: 320px;"></div>
                                    </div>
                                    <div v-if="form.isMarkdown" style="width: 100%;">
                                        <!-- placeholder="请输入内容..." -->
                                        <Editor mode="tab" :editorId="'editTopic'" :value="form.markdownContent" :plugins="form.editTopicEditorPlugin" :locale="setMarkdownLanguage()" :editorConfig="markdownEditorConfig" :sanitize="editTopicSanitize" :placeholder="t('editTopic.40')" @change="handleMarkdownChange"/>
                                    </div>
                                </template>
                            </van-field>

                            <!-- label="验证码" placeholder="请输入验证码" -->
                            <van-field v-model="form.captchaValue" v-if="form.showCaptcha" class="captcha-item captcha-input-left" :label="t('common.70')" :placeholder="t('common.120')" maxlength="4" center clearable :rules="[{ validator: checkCaptchaValue }]" :error-message="error.captchaValue">
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

                    <div class="resultModule" v-if="!form.allowTopic">
                        <div class="result">
                            <div class="result-icon">
                                <van-icon name="warning" class="icon-warning" size="64px"/>
                            </div>
                            <div class="result-title">
                                <p>{{t('editTopic.50')}}</p><!-- 不允许修改话题 -->
                            </div>
                        </div>
                    </div>

                </div>
                <div class="editTopicModule" v-if="store_systemUser == null || Object.keys(store_systemUser).length ==0">
                    <van-skeleton :row="3" class="skeleton"/>
                </div>
            </van-pull-refresh>

            <van-popup v-model:show="form.popup_mentionUser" class="markdownEditorMentionPopup" :lock-scroll="false" position="bottom" :close-on-popstate="true" close-icon="close" :round="true" :closeable="true"  @closed="closeMentionUser()">
                <van-form ref="formMentionRef" class="form-mention-container">
                    <!-- placeholder="用户账号或呢称" -->
                    <van-search v-model.trim="form.keyword" show-action maxlength="30" clearable :placeholder="t('editTopic.60')" @search="searchMentionUser">
                        <template #action>
                            <!-- 搜索 -->
                            <van-button size="small" type="primary" @click="searchMentionUser">{{t('editTopic.70')}}</van-button>
                        </template>
                    </van-search>
                
                </van-form>
                <div class="container">
                    <div class="mentionUserItem" v-for="mentionUser in form.mentionUserList" @click="selectMentionUser(mentionUser)">
                        <div class="left-layout">
                            <div class="avatarBox">
                                
                                <img v-if="mentionUser.avatarName != null" :src="mentionUser.avatarPath+'100x100/'+mentionUser.avatarName" class="img">
                                <img v-if="mentionUser.avatarName == null" :src="mentionUser.avatar" width="48" height="48" class="img"/>
                                    
                            </div>
                        </div>
                        <div class="right-layout">
                            <span class="userInfo">{{mentionUser.nickname != null && mentionUser.nickname != '' ?mentionUser.nickname : mentionUser.account}}</span>
                        </div>
                    </div>
                </div>
            </van-popup>
        </div>
    </div>
</template>

<script setup lang="ts">
import { getCurrentInstance, ComponentInternalInstance, reactive, onMounted, ref, onUnmounted, watchEffect, onActivated, nextTick} from 'vue'
    import { onBeforeRouteUpdate, useRouter } from 'vue-router'
    import { AxiosResponse } from 'axios'
    import { getPageBasePath,  processErrorInfo} from '@/utils/tool';
    import pinia from '@/store/store'
    import {useStore} from '@/store'
    import { storeToRefs } from 'pinia';
    import { Notify } from 'vant'
    import { onBack } from '@/utils/history'
    import { convertViewportWidth } from '@/utils/px-to-viewport';
    import { createEditor, destroyEditor } from '@/utils/editor';
    import { escapeVueHtml } from '@/utils/escape';
    import { markdownPlugins,markdownEditorConfig,sanitize, markdownToHtml, setMarkdownLanguage } from '@/utils/markdownEditor';
    import { toggleEditor } from '@/utils/markdownPlugin/plugin-toggle-editor';
    import { help } from '@/utils/markdownPlugin/plugin-help';
    import { emoji } from '@/utils/markdownPlugin/plugin-emoji';
    import { imageUpload } from '@/utils/markdownPlugin/plugin-image-upload';
    import { pasteImageUpload } from '@/utils/markdownPlugin/plugin-paste-image';
    import { fileUpload } from '@/utils/markdownPlugin/plugin-file-upload';
    import { videoUpload } from '@/utils/markdownPlugin/plugin-video-upload';
    import { hideContent } from '@/utils/markdownPlugin/plugin-hide-content';
    import type { BytemdPlugin,BytemdEditorContext } from 'bytemd'
    import { Editor } from '@bytemd/vue-next'
    import { mention } from '@/utils/markdownPlugin/plugin-mention';
    import { User } from '@/types';
    import { letterAvatar } from '@/utils/letterAvatar';
    import { aiPopUp } from '@/components/aiAssistant/aiAssistantTool';
    import { ai } from '@/utils/markdownPlugin/plugin-ai';
    import { useI18n } from 'vue-i18n';
import dayjs from 'dayjs';
    let { t } = useI18n();
    const { proxy,appContext } = getCurrentInstance() as ComponentInternalInstance;
    const store = useStore(pinia);
    const router = useRouter();
    const formRef = ref();
    const topicContentEditorToolbarRef = ref();
    const topicContentEditorTextRef = ref();
    const {title:store_title,keywords:store_keywords,description:store_description,systemUser:store_systemUser} = storeToRefs(store)
 
    
    //html页元信息
    watchEffect(() => {
        let titleValue = store_title.value//监听网站标题
        if(titleValue != null && titleValue != ''){
            document.title = t('editTopic.10')+' - ' + titleValue;//修改话题
        }
    }, {
        flush: 'post'//在组件更新后触发，第一次运行需要组件渲染完成才执行
    })

    interface VoteOptionItem {
        id: string;
        text: string;
    }
    
    //表单
    const form = reactive({
        topicId:'',//话题Id
        allowTopic:true,//是否允许提交话题
        userGradeList:[],//用户等级
        availableTag:[] as Array<string>,//话题编辑器允许使用标签
        fileSystem:0,//文件存储系统
        supportEditor:10,//支持编辑器

        title:'',//标题
        content:'',//内容
        markdownContent:'',//markdown内容
        isMarkdown:false,//是否使用markdown编辑器

        showDatetimePicker:false,//显示时间选择
        maxVoteOptions :0,//发起投票选项数量
        isVoteView:false,//是否显示发起投票
        isVote:false,//是否发起投票
        voteTitle :'',
        voteMaxChoice :1,
        voteEndDate_format:'',
        voteEndDate :null as Date | null,//截止时间
        voteOptions: [] as Array<VoteOptionItem>,//投票选项列表

        popup_mentionUser :false,//是否弹出选择提及用户表单
        keyword :'',//关键词
        mentionUserList:[] as Array<User>,//提及用户集合
        mentionUserEditorId:'',//提及用户编辑器Id
        currentMarkdownEditor:{} as BytemdEditorContext | undefined,//Markdown编辑器打开‘@提及’弹窗的编辑器对象

        showCaptcha:false,//是否显示验证码
        captchaKey: '',//验证码key
        captchaValue: '',//验证码值
        imgUrl: '',//验证码图片
        allowSubmit:false,//提交按钮disabled状态

        editTopicEditor :{} as any,//修改话题编辑器
		editTopicEditorCreateParameObject :{} as any,//修改话题编辑器的创建参数

        editTopicEditorPlugin:[] as BytemdPlugin[],//添加话题Markdown编辑器插件

        isRefreshing:false,//是否处于下拉加载中状态
    })
    //错误
    const error = reactive({
        title:'',//标题
        content:'',//内容
        captchaValue:'',//验证码

        keyword :'',
        voteOption :'',
        voteTitle :'',
        voteMaxChoice :'',
        voteEndDate :'',
    })

    //下拉刷新时触发
    const onRefresh = () => {
        form.isRefreshing = false;

        //重置
        form.allowTopic = true;//是否允许提交话题
        form.userGradeList.length =0;//用户等级
        form.availableTag.length =0;//话题编辑器允许使用标签
        form.fileSystem = 0,//文件存储系统
        form.supportEditor=10;//支持编辑器

        form.popup_mentionUser =false;//是否弹出选择提及用户表单
        form.keyword ='';//关键词
        form.mentionUserList.length= 0;//提及用户集合
        form.mentionUserEditorId='';//提及用户编辑器Id
        form.currentMarkdownEditor = {} as BytemdEditorContext | undefined,//Markdown编辑器打开‘@提及’弹窗的编辑器对象


        form.title = '';//标题
        form.content = '';//内容
        form.markdownContent='';//markdown内容
        form.isMarkdown = false;//是否使用markdown编辑器

        form.showDatetimePicker= false;//显示时间选择
        form.maxVoteOptions =0;//发起投票选项数量
        form.isVoteView = false;//是否显示发起投票
        form.isVote = false;//是否发起投票
        form.voteTitle ='';
        form.voteMaxChoice =1;
        form.voteEndDate_format ='';//截止时间
        form.voteEndDate=null;
        form.voteOptions.length = 0;

        form.showCaptcha = false;//是否显示验证码
        form.captchaKey =  '';//验证码key
        form.captchaValue =  '';//验证码值
        form.imgUrl =  '';//验证码图片
        form.allowSubmit = false;//提交按钮disabled状态

        if (Object.keys(form.editTopicEditor).length != 0) {//不等于空
            destroyEditor(form.editTopicEditor);
            form.editTopicEditor = {};
        }
		form.editTopicEditorCreateParameObject = {} as any;//添加话题编辑器的创建参数
        
        form.editTopicEditorPlugin.length =0;

        init();
    };


    //处理Markdown
    const handleMarkdownChange = (value: string) => {
        form.markdownContent = value;
    }

    //白名单
    const editTopicSanitize = (schema: any) => {
        schema = sanitize(schema);
        
        if(form.availableTag?.indexOf('embedVideo') != -1){//嵌入视频
            schema.tagNames.push('iframe');
        }

        return schema;
    }

    //处理切换到富文本编辑器
    const handleToggleRichtextEditor = (editorId: string) => {
        form.isMarkdown = false;
        nextTick(()=>{
            if (Object.keys(form.editTopicEditorCreateParameObject).length != 0) {//不等于空
                //创建富文本编辑器
                form.editTopicEditor = createEditor(
                    form.editTopicEditorCreateParameObject.toolbarRef, 
                    form.editTopicEditorCreateParameObject.textRef, 
                    form.editTopicEditorCreateParameObject.editorIconList, 
                    getPageBasePath()+'common/default/', 
                    form.editTopicEditorCreateParameObject.uploadPath, 
                    form.editTopicEditorCreateParameObject.userGradeList,
                    form.fileSystem,
                    ()=>{
                        handleToggleMarkdownEditor(editorId);
                    },
                    ()=>{
                        mentionPopUp(editorId,undefined)
                    },
                    ()=>{
                        //AI弹窗
                        aiPopUp(proxy,appContext,editorId,form.editTopicEditorCreateParameObject.uploadPath,'file',form.fileSystem,form.isMarkdown,form.editTopicEditor,undefined)
                    }
                );
                form.editTopicEditor.txt.html(form.editTopicEditorCreateParameObject.html);//切换时设置富文本内容
            }
        })
        
        
    }

    //处理切换到Markdown编辑器
    const handleToggleMarkdownEditor = (editorId: string) => {
        
        if (Object.keys(form.editTopicEditor).length != 0) {//不等于空
            form.editTopicEditorCreateParameObject.html = form.editTopicEditor.txt.exportHtml();//切换时保存富文本内容
			destroyEditor(form.editTopicEditor);
            form.editTopicEditor = {};
		}
        form.isMarkdown = true;
    }


    //显示、隐藏提及弹窗
    const mentionPopUp = (editorId: string,ctx:BytemdEditorContext| undefined) => {
       
       form.popup_mentionUser = true;
       form.mentionUserEditorId = editorId;
       form.keyword = "";
       form.mentionUserList.length = 0;
       form.currentMarkdownEditor = ctx;
       error.keyword = "";
   }

   //关闭提及用户弹出框
   const closeMentionUser = () => {
       form.popup_mentionUser = false;
       form.currentMarkdownEditor = undefined;
   }

   //选择提及用户
   const selectMentionUser = (mentionUser:User) => {
       let link = "user/control/home?userName="+mentionUser.userName;
       let text = mentionUser.nickname != null && mentionUser.nickname != '' ? '@'+mentionUser.nickname : '@'+mentionUser.account;
       
       if(form.isMarkdown){
           form.currentMarkdownEditor?.editor.replaceSelection(`${text}`);
       }else{
           form.editTopicEditor.txt.insertMention(text, link);
       }

       closeMentionUser();
   }


   //搜索提及用户
   const searchMentionUser = () => {
       form.mentionUserList.length = 0
       error.keyword = "";
       if(form.keyword == null || form.keyword.trim() == ''){
           error.keyword = t('editTopic.80');//请输入用户账号或呢称
           return;
       }
       proxy?.$axios({
           url: '/user/control/queryUser',//暂时使用查询提及用户API
           method: 'get',
           params:  {keyword:form.keyword},
           showLoading: false,//是否显示加载图标
           loadingMask:false,// 是否显示遮罩层
       })
       .then((response: AxiosResponse) => {
           if(response){
               const result: any = response.data;
               if(result != ""){
                   let mentionUser = JSON.parse(result)
               
                   if(mentionUser != null){
                       let userList = new Array();
                       if(mentionUser.nickname != null && mentionUser.nickname !=''){
                           mentionUser.avatar = letterAvatar(mentionUser.nickname, 48);
                       }else{
                           mentionUser.avatar = letterAvatar(mentionUser.account, 48);
                       }
                       userList.push(mentionUser);
                       
                       form.mentionUserList = userList;
                   }else{
                       error.keyword = t('editTopic.90');//当前用户不存在
                   }
               }
           }
       })
       .catch((error: any) =>{
           console.log(error);
       });

   }

   //投票 添加项
    const addItem = () => {
        if(form.voteOptions.length >= form.maxVoteOptions){
            Notify({ type: 'warning', message: t('editTopic.130',{'p1': form.maxVoteOptions})});//投票选项不能超过 {p1} 项
            return;
        }

        form.voteOptions.push({
            id: '',
            text: ''
        });
    }
    //投票 删除项
    const removeItem = (voteOption:any) => {
        let index = form.voteOptions.indexOf(voteOption);
        if (index !== -1) {
            form.voteOptions.splice(index, 1);
        }
    }
    //投票 上移
    const moveUp = (voteOption:any) => {
        let index = form.voteOptions.indexOf(voteOption);
        if (index >0) {
            let upData = form.voteOptions[index - 1];
            form.voteOptions.splice(index - 1, 1);
            form.voteOptions.splice(index, 0, upData);
        }
    }
    //投票 下移
    const moveDown = (voteOption:any) => {
        let index = form.voteOptions.indexOf(voteOption);
        if ((index + 1) < form.voteOptions.length) {
            let downData = form.voteOptions[index + 1];
            form.voteOptions.splice(index + 1, 1);
            form.voteOptions.splice(index, 0, downData);
        }
    }


    
    //查询修改话题页
    const queryEditTopic = (topicId:string) => {
        //清空error的属性值
        Object.keys(error).map(key => {
            Object.assign(error, {[key] : ''});
        })

        proxy?.$axios({
            url: '/user/editTopic',
            method: 'get',
            params:  {
                topicId:topicId
            },
            showLoading: false,//是否显示加载图标
            loadingMask:false,// 是否显示遮罩层
        })
        .then((response: AxiosResponse) => {
            if(response){
                let data =  response.data;
                if(data){
                    let topic = data.topic;
                    if(topic){
                        form.title = topic.title;
                        if(topic.isMarkdown != null && topic.isMarkdown == true){
                            form.isMarkdown = true;
                            form.markdownContent = topic.markdownContent;
                        }
                    }
                    


                    form.allowTopic = data.allowTopic;//是否允许提交话题


                     form.maxVoteOptions = data.maxVoteOptions;
                    if(data.maxVoteOptions != null){
                        if(data.maxVoteOptions >0){//发起投票选项数量
                            form.isVoteView = true;//是否显示发起投票
                        }
                    }else{
                        form.isVoteView = true;//是否显示发起投票
                    }
                    if(topic.voteThemeId != null && topic.voteThemeId != ''){
                        form.isVoteView = true;//是否显示发起投票
                        form.isVote = true;//是否发起投票
                    }
                    if(data.voteTheme != null && Object.keys(data.voteTheme).length > 0){
			    				
                        form.voteTitle = data.voteTheme.title;
                        form.voteMaxChoice = data.voteTheme.maxChoice;
                        form.voteEndDate_format = data.voteTheme.endDate;//截止时间
                        if(form.voteEndDate_format != null && form.voteEndDate_format != ''){
                            form.voteEndDate = dayjs(form.voteEndDate_format).toDate();
                        }

                        for (let i =0; i<data.voteTheme.voteOptionList.length; i++) {  
                            let voteOption = data.voteTheme.voteOptionList[i];
                            let item = {
                                id: voteOption.id,
                                text: voteOption.text,
                            }
                        
                            form.voteOptions.push(item);
                        }
                    }

                    if(data.userGradeList != null && data.userGradeList != ''){
                        form.userGradeList = JSON.parse(data.userGradeList);//JSON转为对象
                    }
                    if(data.availableTag != null && data.availableTag != ''){
                        let availableTagObject = JSON.parse(data.availableTag);//JSON转为对象

                        
                        if(availableTagObject != null && availableTagObject.length >0){
                            for(let i=0; i< availableTagObject.length; i++){
                                let availableTag = availableTagObject[i];
                                if(availableTag == "hidePassword" || availableTag == "hideComment" ||
                                availableTag == "hideGrade" || availableTag == "hidePoint" || availableTag == "hideAmount"){
                                    availableTagObject.splice(i, 0, 'hide');//在指定索引处插入元素
                                    break;
                                }
                            }
                            for(var i=0; i< availableTagObject.length; i++){
                                let availableTag = availableTagObject[i];
                                if(availableTag == "image"){//增加批量插入图片按钮
                                    availableTagObject.splice(i+1, 0, 'multiimage');//在指定索引处插入元素
                                    break;
                                }
                            }
                        }

                        form.availableTag = availableTagObject;//话题编辑器允许使用标签
                    }
                    
                    form.fileSystem = data.fileSystem;//文件存储系统

                    
                    if (data.captchaKey != undefined && data.captchaKey != '') {
                        form.showCaptcha = true;
                        form.captchaKey = data.captchaKey;
                        replaceCaptcha();//刷新验证码
                    }

                    if(data.allowTopic && Object.keys(form.editTopicEditorCreateParameObject).length === 0) {//等于空
                        let uploadPath = "user/control/topic/upload?method=upload";

                        //编辑器图标
                        let editorIconList = new Array();
                        

                        for(let i=0; i<form.availableTag.length; i++){
							let _availableTag = form.availableTag[i];
							if(_availableTag == "code"){//代码
								editorIconList.push("code");
							}else if(_availableTag == "forecolor"){//文字颜色
							//	editorIconList.push("foreColor");
							}else if(_availableTag == "hilitecolor"){//文字背景
							//	editorIconList.push("backColor");
							}else if(_availableTag == "bold"){//粗体
							//	editorIconList.push("bold");
							}else if(_availableTag == "italic"){//斜体
							//	editorIconList.push("italic");
							}else if(_availableTag == "underline"){//下划线
							//	editorIconList.push("underline");
							}else if(_availableTag == "link"){//插入链接
								editorIconList.push("link");
							}else if(_availableTag == "emoticons"){//插入表情
								editorIconList.push("emoticon");
							}else if(_availableTag == "image"){//图片
								editorIconList.push("image");
							}else if(_availableTag == "media"){//视频
								editorIconList.push("video");
							}else if(_availableTag == "embedVideo"){//嵌入视频
								editorIconList.push("embedVideo");
							}else if(_availableTag == "uploadVideo"){//上传视频
								editorIconList.push("uploadVideo");
							}else if(_availableTag == "insertfile"){//文件
								editorIconList.push("file");
							}else if(_availableTag == "hidePassword"){//输入密码可见
								editorIconList.push("hidePassword");
							}else if(_availableTag == "hideComment"){//评论话题可见
								editorIconList.push("hideComment");
							}else if(_availableTag == "hideGrade"){//达到等级可见
								editorIconList.push("hideGrade");
							}else if(_availableTag == "hidePoint"){//积分购买可见
								editorIconList.push("hidePoint");
							}else if(_availableTag == "hideAmount"){//余额购买可见
								editorIconList.push("hideAmount");
							}else if(_availableTag == "mention"){//提及
								editorIconList.push("mention");
							}else if(_availableTag == "ai"){//AI
								editorIconList.push("ai");
							}else if(_availableTag == "toggleEditor"){//切换编辑器
								editorIconList.push("toggleEditor");
							}
						}
                        for(let i=0; i< editorIconList.length; i++){
                            let editorIcon = editorIconList[i];
                            if(editorIcon == "hidePassword" || editorIcon == "hideComment" ||
                                    editorIcon == "hideGrade" || editorIcon == "hidePoint" || editorIcon == "hideAmount"){
                                editorIconList.splice(i, 0, 'hide');//在指定索引处插入元素
                                break;
                            }
                        }
                        if(form.editTopicEditorPlugin != null && form.editTopicEditorPlugin.length ==0){
                            //添加插件
                            form.editTopicEditorPlugin.push(...markdownPlugins());
                            
                            
                            if(form.supportEditor == 30 || form.supportEditor == 40){//10.仅富文本编辑器 20.仅Markdown编辑器  30.富文本编辑器优先 40.Markdown编辑器优先
                                form.editTopicEditorPlugin.push(
                                    toggleEditor((editorId: string)=>{handleToggleRichtextEditor(editorId)})
                                );
                            }
                            
                            if(form.availableTag?.indexOf('hidePassword') != -1 
                                || form.availableTag?.indexOf('hideComment') != -1
                                || form.availableTag?.indexOf('hideGrade') != -1 
                                || form.availableTag?.indexOf('hidePoint') != -1 
                                || form.availableTag?.indexOf('hideAmount') != -1
                                ){
                                form.editTopicEditorPlugin.push(
                                    hideContent(form.availableTag,form.userGradeList)
                                );
                            }

                            if(editorIconList?.indexOf('uploadVideo') != -1){
                                form.editTopicEditorPlugin.push(
                                    videoUpload("user/control/topic/upload?method=upload","file",form.fileSystem)
                                );
                            }
                            if(editorIconList?.indexOf('image') != -1){
                                form.editTopicEditorPlugin.push(
                                    imageUpload("user/control/topic/upload?method=upload",'file',form.fileSystem)
                                );
                                form.editTopicEditorPlugin.push(
                                    pasteImageUpload("user/control/topic/upload?method=upload",'file',form.fileSystem)
                                );
                            }  
                            if(editorIconList?.indexOf('file') != -1){
                                form.editTopicEditorPlugin.push(
                                    fileUpload("user/control/topic/upload?method=upload",'file',form.fileSystem)
                                );
                            }
                            form.editTopicEditorPlugin.push(emoji());
                            if(editorIconList?.indexOf('mention') != -1){
                                form.editTopicEditorPlugin.push(
                                    mention((editorId: string,ctx:BytemdEditorContext)=>{mentionPopUp(editorId,ctx)})
                                );
                            }
                            if(editorIconList?.indexOf('ai') != -1){
                                form.editTopicEditorPlugin.push(
                                    ai((editorId: string,ctx:BytemdEditorContext)=>{aiPopUp(proxy,appContext,editorId,uploadPath,'file',form.fileSystem,form.isMarkdown,undefined,ctx)})
                                );
                            }
                            form.editTopicEditorPlugin.push(
                                help(editorIconList,form.userGradeList)
                            );
                            
                        }


                        if(!form.isMarkdown){
                            //创建富文本编辑器
                            //处理节点路径
                            let contentNode = document.createElement("div");
                            contentNode.innerHTML = topic.content;
                            processNodePath(contentNode);
                            
                            topic.content = escapeVueHtml(contentNode.innerHTML);

                            //创建富文本编辑器
                            form.editTopicEditor = createEditor(topicContentEditorToolbarRef.value,topicContentEditorTextRef.value,editorIconList, getPageBasePath()+'common/default/', uploadPath, form.userGradeList,form.fileSystem,(editorId: string)=>{
                                handleToggleMarkdownEditor(editorId);
                            },
                            (editorId: string)=>{
                                mentionPopUp(editorId,undefined)
                            },
                            (editorId: string)=>{
                                //AI弹窗
                                aiPopUp(proxy,appContext,editorId,uploadPath,'file',form.fileSystem,form.isMarkdown,form.editTopicEditor,undefined)
                            });
                            form.editTopicEditor.txt.html(topic.content);//初始化内容
                        }

                        
                        
                        
                        form.editTopicEditorCreateParameObject = {
                            toolbarRef:topicContentEditorToolbarRef.value,
                            textRef:topicContentEditorTextRef.value,
                            editorIconList:editorIconList,
                            uploadPath:uploadPath,
                            userGradeList:form.userGradeList
                        }

                    }
                }
                
            }
        })
        .catch((error: any) =>{
            console.log(error);
        });

    }

    //处理节点路径
    const processNodePath = (node:any) => {
        //先找到子节点
        let nodeList = node.childNodes;
        for(let i = 0;i < nodeList.length;i++){
            //childNode获取到到的节点包含了各种类型的节点
            //但是我们只需要元素节点  通过nodeType去判断当前的这个节点是不是元素节点
            let childNode = nodeList[i];
            let random = Math.random().toString().slice(2);
            //判断是否是元素节点。如果节点是元素(Element)节点，则 nodeType 属性将返回 1。如果节点是属性(Attr)节点，则 nodeType 属性将返回 2。
            if(childNode.nodeType == 1){
                //处理表情
                if(childNode.nodeName.toLowerCase() == "img" ){
                    let src = childNode.getAttribute("src");
                    if(childNode.getAttribute("width") != null){//如果是表情，需要处理后端返回的没有全路径表情
                       
                        if(src.indexOf("http://") != 0 && src.indexOf("https://") != 0){
                            childNode.setAttribute("src",getPageBasePath()+src);
                        }
                    }
                }
                //禁止视频预加载
                if(childNode.nodeName.toLowerCase() == "video" ){
                    childNode.setAttribute("preload","none");
                }
                processNodePath(childNode);
            }
        }
    }


    
    //校验标题
    const validatorTitle = (val:any):boolean => {
        if(val == ''){
            error.title = t('editTopic.100')//标题不能为空
            return false;
        }
        error.title = "";
        return true;
    }

    //显示/隐藏投票表单层
    const voteForm = () => {
        if(form.isVote == false){
            form.isVote = true;
            
        }else{
            form.isVote = false;
        }
    }

    //清除投票截止时间
    const onClearVoteEndDate = (event: any) => {
        form.voteEndDate_format = "";
        event.preventDefault();
        event.stopPropagation()
    }
    //显示时间选项
    const onShowDatetimePicker = () => {
        form.showDatetimePicker = true;
        if(form.voteEndDate_format != null && form.voteEndDate_format != ''){
            form.voteEndDate = dayjs(form.voteEndDate_format).toDate();
        }else{
            form.voteEndDate = new Date();
        }
        
    }
    /**
     * 确定截止时间
     * @param value 当前选中的时间
     */
    const onVoteEndDate = (value: Date) => {
        form.voteEndDate_format = dayjs(value).format('YYYY-MM-DD HH:mm:ss');
        form.showDatetimePicker = false;
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
            // 全局表单验证
            formRef.value.validate().then(() => {
                resolve();
            }).catch(() => {
                form.allowSubmit = false;//提交按钮disabled状态
            })
        });
        
        Promise.all([p1])
            .then(() => {
                //清空error的属性值
                Object.keys(error).map(key => {
                    Object.assign(error, {[key] : ''});
                })
            

               

                let formData = new FormData();
                formData.append('topicId', form.topicId);

                if(form.title != null && form.title != ''){
                    formData.append('title', form.title);
                }


                if(form.isMarkdown){
                    formData.append('isMarkdown', form.isMarkdown.toString());
                    formData.append('markdownContent', form.markdownContent);
                }else{
                    let content =  form.editTopicEditor.txt.exportHtml()
                    if(content != null && content !=''){
                        formData.append('content', content);
                    }
                }

                
                formData.append('isVote', form.isVote.toString());
                if(form.voteTitle != null && form.voteTitle != ''){
                    formData.append('voteTitle', form.voteTitle);
                }
                formData.append('voteMaxChoice', String(form.voteMaxChoice));
                if(form.voteEndDate_format != null && form.voteEndDate_format != ''){
                    formData.append('voteEndDate', form.voteEndDate_format);
                }
                if(form.voteOptions != null && form.voteOptions.length >0){
                    for(let i=0; i<form.voteOptions.length; i++){
                        let voteOption = form.voteOptions[i];
                        formData.append('voteOptionIdList', voteOption.id);
                        formData.append('voteOptionTextList', voteOption.text);
                        
                    }
                }
              
                //验证码Key
                formData.append('captchaKey', form.captchaKey);
                //验证码值
                if(form.captchaValue != ''){
                    formData.append('captchaValue', form.captchaValue.trim());
                }

                proxy?.$axios({
                    url: '/user/control/topic/edit',
                    method: 'post',
                    data: formData
                })
                .then((response: AxiosResponse) => {
                    if(response){

                        const result: any = response.data;
                    
                        if(JSON.parse(result.success)){
                            // 成功通知
                            Notify({ 
                                type: 'success', 
                                message: t('editTopic.110'),//提交成功，即将自动跳转到话题内容页
                                onClose: ()=>{
                                    
                                } 
                            });
                            router.push({
                                path : '/thread',
                                query: {topicId: form.topicId}
                            });

                        }else{
                            //处理错误信息
                            processErrorInfo(result.error as Map<string,string> , error,()=>{});
                            

                            

                            if(result.captchaKey != null){
                                form.showCaptcha = true;
                                form.captchaKey = result.captchaKey;
                                replaceCaptcha();
                            }else{
                                form.showCaptcha = false;
                            }

                            form.allowSubmit = false;//提交按钮disabled状态
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
        if(to.name == 'editTopic'){
            if(to.query.topicId != undefined){
                form.topicId = to.query.topicId as string
            }
            init();
        }
        
        next();
    });

    onMounted(() => {
        init();
    }) 


    //卸载组件实例后调用
    onUnmounted (()=>{
        if (Object.keys(form.editTopicEditor).length != 0) {//不等于空
            destroyEditor(form.editTopicEditor);
            form.editTopicEditor = {};
        }
    })
    //初始化
    const init = () => {
        form.topicId = router.currentRoute.value.query.topicId != undefined ?router.currentRoute.value.query.topicId as string :'';
         
        queryEditTopic(form.topicId);
    }

    //进入keep-alive组件时触发
    onActivated(()=>{
        //后退时修改浏览器标题
        let titleValue = store_title.value
        if(titleValue != null && titleValue != ''){
            document.title = t('editTopic.10')+' - ' + titleValue;//修改话题
        }
    })
</script>
<style scoped lang="scss">
.editTopicModule{
    :deep(.bytemd-editor){
        min-height: 250px !important; 
    }
    :deep(.CodeMirror-sizer){
        min-height: 245px !important; 
    }
    :deep(.bytemd-preview){
        min-height: 250px !important; 
    }
    :deep(.voteEndDate){
        .van-field__clear{
            margin-right: 2px;
            line-height: normal;
        }
    }

    .form-container{
        :deep(.van-radio--horizontal){
            margin-top: 2px;
            margin-bottom: 8px;
        }
        .help-text{
            font-size: 13px;
            line-height: 22px;
            color: var(--van-gray-5);
        }
        :deep(.clearUnderline){
            &:after{
                display: none;
            }
        }
        :deep(.lastItem){
            &:last-child:after{
                display: inline;
            }
            .van-field__error-message{
                margin-top: 10px;
            }
            .addItem-button{
                font-size: 13px;
            }
        }
        .option-button-container{
            display:flex;
            align-items:center;
            .option-button{
                border-radius:50%;
                width: 24px;
                margin-left: 10px;
            }
        }
    }
    
    .skeleton{
        margin: 8px;
        padding-top: 16px;
        padding-bottom: 16px;
        background: #fff;
        border-radius: var(--van-border-radius-lg);
    }

}
</style>

