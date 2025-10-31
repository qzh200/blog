<!-- 提问题页 -->
<template>
    <div class="main">
        <div class="main-container">

            <!-- title="提问题" left-text="返回" -->
            <van-nav-bar :title="t('addQuestion.10')" :left-text="t('common.110')" left-arrow @click-left="onBack" @click-right="router.push({path: '/'})">
                <template #right>
                    <van-icon name="wap-home-o" :size="convertViewportWidth('18px')"/>
                </template>
            </van-nav-bar>
            <!-- success-text="刷新成功" -->
            <van-pull-refresh v-model="form.isRefreshing" :success-text="t('common.130')" pull-distance="200" @refresh="onRefresh" style="min-height: 50vh;">
                <div class="addQuestionModule" v-if="store_systemUser != null && Object.keys(store_systemUser).length>0">
                    <van-form ref="formRef" :scroll-to-error="true" class="form-container" v-if="form.allowQuestion">
                        <van-cell-group inset>
                            <!-- label="标题" placeholder="请输入标题" -->
                            <van-field v-model.trim="form.title" :label="t('addQuestion.30')" :placeholder="t('addQuestion.40')" maxlength="90" clearable :rules="[{ validator: validatorTitle }]" :error-message="error.title"/>
                            
                            <div class="van-cell cell-field">
                                <div class="van-cell__title van-field__label cell-field-title">
                                    <!-- 标签 -->
                                    <span>{{t('addQuestion.50')}}</span>
                                </div>
                                <div class="van-cell__value">
                                    <span>
                                        <div class="questionTag">
                                            <span class="btn mr"  v-for="selectedTag in form.selectedTagList"  >{{selectedTag.name}}<span class="ml"  @click="deleteTag(selectedTag.id);">×</span></span>
                                        
                                            <div class="addTag">
                                                <!-- 添加标签 -->
                                                <button type="button" class="btn"  @click="showTagUI();" >+ {{t('addQuestion.60')}}(<span>{{form.selectedTagList.length}}</span>/{{form.maxQuestionTagQuantity}})</button>
                                            </div>
                                            
                                        </div>
                                    </span>
                                    <div class="van-field__error-message">{{error.tagId}}</div>
                                </div>
                               
                            </div>
                            <van-popup v-model:show="form.popup_allTag" safe-area-inset-bottom :close-on-popstate="true" position="bottom" closeable close-icon="close" class="custom-bottom-popupModule" :style="{ height: '65%' }" round>
                                
                                <div ref="questionTagScroll" class="selectQuestionTagModule">
                                    <div class="box" >
                                        <div class="questionTagNavigation">
                                            <van-loading color="#1989fa" v-if="form.loading" style="text-align: center"/>
                                            <ul class="nav" v-if="form.allTagList != null && form.allTagList.length >0">
                                                <li class="nav-item" :class="selectedTagClass(questionTag.id)" v-for="questionTag in form.allTagList" >
                                                    <span class="nav-link" @click="selectChildTag(questionTag.id)" >{{questionTag.name}}</span>
                                                </li>
                                            </ul>
                                            <!-- 二级标签 -->
                                            <div class="tab-content">
                                                <div class="tab-pane">
                                                    <span :class="selectedChildTagClass(childQuestionTag.id)" @click="selectedTag(childQuestionTag)"  v-for="childQuestionTag in form.childTagList" >{{childQuestionTag.name}}</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </van-popup>

                            <div class="van-cell cell-field"  v-if="form.questionRewardAmountMax == null || (form.questionRewardAmountMax != null && parseFloat(form.questionRewardAmountMax) >0)">
                                <div class="van-cell__title van-field__label cell-field-title">
                                    <!-- 悬赏金额 -->
                                    <span>{{t('addQuestion.70')}}</span>
                                </div>
                                <div class="van-cell__value">
                                    <span>
                                        <!-- placeholder="输入金额" -->
                                        <van-field v-model.trim="form.amount" :placeholder="t('addQuestion.80')" maxlength="10" class="cell-field-value" :formatter="amountFormat" clearable :error-message="error.amount"/>
                                    </span>
                                </div>
                                <div class="van-cell__label cell-field-label">
                                    <span class="help-text">
                                        <!-- 悬赏金额不能少于 {{form.questionRewardAmountMin}} 元； -->
                                        <span v-if="parseFloat(form.questionRewardAmountMin) >0">{{t('addQuestion.90',{'p1': form.questionRewardAmountMin})}}</span>	
                                        <!-- 悬赏金额不能超过 {{form.questionRewardAmountMax}} 元； -->
                                        <span v-if="form.questionRewardAmountMax != null && parseFloat(form.questionRewardAmountMax) >0">{{t('addQuestion.100',{'p1': form.questionRewardAmountMax})}}</span>	
                                        <!-- 用户共有金额 {{form.maxDeposit}} 元 -->
                                        <span>{{t('addQuestion.110',{'p1': form.maxDeposit})}}</span>
                                    </span>
                                </div>
                            </div>

                            <div class="van-cell cell-field"  v-if="form.questionRewardPointMax == null || (form.questionRewardPointMax != null && parseInt(form.questionRewardPointMax) >0)">
                                <div class="van-cell__title van-field__label cell-field-title">
                                    <!-- 悬赏积分 -->
                                    <span> {{t('addQuestion.120')}}</span>
                                </div>
                                <div class="van-cell__value">
                                    <span>
                                        <!-- placeholder="输入积分" -->
                                        <van-field v-model.trim="form.point" :placeholder="t('addQuestion.130')" maxlength="9" class="cell-field-value" type="digit" clearable :error-message="error.point"/>
                                    </span>
                                </div>
                                <div class="van-cell__label cell-field-label">
                                    <span class="help-text">
                                        <!-- 悬赏积分不能少于 {{form.questionRewardPointMin}} ； -->
                                        <span v-if="parseInt(form.questionRewardPointMin) >0">{{t('addQuestion.140',{'p1': form.questionRewardPointMin})}}</span>	
                                        <!-- 悬赏积分不能超过 {{form.questionRewardPointMax}}； -->
                                        <span v-if="form.questionRewardPointMax != null && parseInt(form.questionRewardPointMax) >0">{{t('addQuestion.150',{'p1': form.questionRewardPointMax})}}</span>	
                                        <!-- 用户共有积分 {{form.maxPoint}}  -->
                                        <span>{{t('addQuestion.160',{'p1': form.maxPoint})}}</span>
                                    </span>
                                </div>
                            </div>

                            <!-- label="发起投票" -->
                            <van-field is-link readonly :label="t('addQuestion.270')" v-if="form.isVoteView" :class="form.isVote ? 'redEnvelope-arrow-down':'redEnvelope-arrow-right'" @click="voteForm">
                                <template #input>
                                    
                                </template>
                            </van-field>
                            <div v-if="form.isVote">
                                <!-- label="投票标题" placeholder="请输入投票标题" -->
                                <van-field v-model.trim="form.voteTitle" :label="t('addQuestion.290')" :placeholder="t('addQuestion.300')" maxlength="150" clearable :error-message="error.voteTitle"/>
                           
                                 <!-- label="投票类型" -->
                                <van-field :label="t('addQuestion.310')">
                                    <template #input>
                                        <van-radio-group v-model="form.voteMaxChoice" direction="horizontal">
                                            <van-radio :name="1">{{t('addQuestion.320')}}</van-radio><!--单选-->
                                            <van-radio :name="-1">{{t('addQuestion.330')}}</van-radio><!--多选-->
                                        </van-radio-group>
                                    </template>
                                </van-field>
                                

                                <div class="van-cell cell-field">
                                    <div class="van-cell__title van-field__label cell-field-title">
                                        <span>{{t('addQuestion.340')}}</span> <!-- 投票截止时间 -->
                                    </div>
                                    <div class="van-cell__value">
                                        <span>
                                            <!--  placeholder="选择时间" -->
                                            <van-field v-model="form.voteEndDate_format" is-link readonly :placeholder="t('addQuestion.350')" @click="onShowDatetimePicker" class="cell-field-value tagPopup voteEndDate" :error-message="error.voteEndDate">
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
                                            <span>{{t('addQuestion.360')}}</span>
                                        </span>
                                    </div>
                                </div>

                                
                                <van-popup v-model:show="form.showDatetimePicker" round position="bottom">
                                    <DatetimesecPicker v-model="form.voteEndDate" @cancel="form.showDatetimePicker = false" :datetimePickerProps="{ 'visible-item-count': 5, title: t('addQuestion.340') }" :pickerProps="{ 'visible-item-count': 5 }" @confirm="onVoteEndDate"/>
                                </van-popup>

                                
                                <template v-for="(voteOption, index) in form.voteOptions">
                                    <van-field v-model="voteOption.text" :placeholder="t('addQuestion.370')" maxlength="50" clearable class="clearUnderline">
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
                                        <van-button plain type="primary" :disabled="form.voteOptions.length >= form.maxVoteOptions" size="small" class="addItem-button" @click="addItem">{{t('addQuestion.380')}}</van-button>
                                    </template>
                                    <template #label>
                                        <div class="van-field__error-message" v-if="error.voteOption != ''">{{error.voteOption}}</div>
                                    </template>
                                    
                                    
                                </van-cell>
                            </div>

                            <van-field center :error-message="error.content" class="content">
                                <template #input>
                                    <div v-show="!form.isMarkdown" style="width: 100%;">
                                        <van-sticky :z-index="1" >
                                            <div ref="questionContentEditorToolbarRef" class="editor-toolbar" style="padding-top: 5px;margin-left: -5px;"></div>
                                        </van-sticky>
                                        <div ref="questionContentEditorTextRef"  class="editor-text" style="min-height: 320px;"></div>
                                    </div>

                                    <div v-if="form.isMarkdown" style="width: 100%;" >
                                        <!-- placeholder="请输入内容..." -->
                                        <Editor mode="tab" :editorId="'addQuestion'" :value="form.markdownContent" :plugins="form.addQuestionEditorPlugin" :locale="setMarkdownLanguage()" :editorConfig="markdownEditorConfig" :sanitize="addQuestionSanitize" :placeholder="t('addQuestion.170')" @change="handleMarkdownChange"/>
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

                    <div class="resultModule" v-if="!form.allowQuestion">
                        <div class="result">
                            <div class="result-icon">
                                <van-icon name="warning" class="icon-warning" size="64px"/>
                            </div>
                            <div class="result-title">
                                <!-- 提问题功能已关闭 -->
                                <p>{{t('addQuestion.180')}}</p>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="addTopicModule" v-if="store_systemUser == null || Object.keys(store_systemUser).length ==0">
                    <van-skeleton :row="3" class="skeleton"/>
                </div>
            </van-pull-refresh>
            <van-popup v-model:show="form.popup_mentionUser" class="markdownEditorMentionPopup" :lock-scroll="false" position="bottom" :close-on-popstate="true" close-icon="close" :round="true" :closeable="true"  @closed="closeMentionUser()">
                <van-form ref="formMentionRef" class="form-mention-container">
                    <!-- placeholder="用户账号或呢称" -->
                    <van-search v-model.trim="form.keyword" show-action maxlength="30" clearable :placeholder="t('addQuestion.190')" @search="searchMentionUser">
                        <template #action>
                            <!-- 搜索 -->
                            <van-button size="small" type="primary" @click="searchMentionUser">{{t('addQuestion.200')}}</van-button>
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
    import {getPageBasePath, processErrorInfo} from '@/utils/tool';
    import { QuestionTag, Tag, User } from '@/types';
    import pinia from '@/store/store'
    import {useStore} from '@/store'
    import { storeToRefs } from 'pinia';
    import { Notify, Toast } from 'vant'
    import { onBack } from '@/utils/history'
    import { convertViewportWidth } from '@/utils/px-to-viewport';
    import { createEditor, destroyEditor } from '@/utils/editor';
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
    const questionContentEditorToolbarRef = ref();
    const questionContentEditorTextRef = ref();
    const {title:store_title,keywords:store_keywords,description:store_description,systemUser:store_systemUser} = storeToRefs(store)
 

    //html页元信息
    watchEffect(() => {
        let titleValue = store_title.value//监听网站标题
        if(titleValue != null && titleValue != ''){
            document.title = t('addQuestion.10')+' - ' + titleValue;//提问题
        }
    }, {
        flush: 'post'//在组件更新后触发，第一次运行需要组件渲染完成才执行
    })
    
    //Select 选择器选项
    interface OptionsItem {
        id: string;
        name: string;
    }
    interface VoteOptionItem {
        id: string;
        text: string;
    }
    //表单
    const form = reactive({
        tagList:[] as Array<Tag>,//标签
        allowQuestion:true,//是否允许提问题
        userGradeList:[],//用户等级
        availableTag:[] as Array<string>,//问题编辑器允许使用标签
        fileSystem:0,//文件存储系统
        supportEditor:10,//支持编辑器

        popup_mentionUser :false,//是否弹出选择提及用户表单
        keyword :'',//关键词
        mentionUserList:[] as Array<User>,//提及用户集合
        mentionUserEditorId:'',//提及用户编辑器Id
        currentMarkdownEditor:{} as BytemdEditorContext | undefined,//Markdown编辑器打开‘@提及’弹窗的编辑器对象

        maxDeposit: '',//用户共有预存款
        maxPoint: '',//用户共有积分
        questionRewardPointMin: '',//问题悬赏积分下限
        questionRewardPointMax: '',//问题悬赏积分上限
        questionRewardAmountMin: '',//问题悬赏金额下限
        questionRewardAmountMax: '',//问题悬赏金额上限
        maxQuestionTagQuantity:0,//标签最多可选数量

        amount: '',//悬赏金额
        point: '',//悬赏积分

        showDatetimePicker:false,//显示时间选择
        maxVoteOptions :0,//发起投票选项数量
        isVoteView:false,//是否显示发起投票
        isVote:false,//是否发起投票
        voteTitle :'',
        voteMaxChoice :1,
        voteEndDate_format:'',
        voteEndDate :null as Date | null,//截止时间
        voteOptions: [{
            id: '',
            text: ''
        }] as Array<VoteOptionItem>,

        popup_allTag :false,

        
        
        allTagList: [] as Array<QuestionTag>,//标签,//全部标签
        selectedFirstTagId: '',//选中的一级标签Id
        childTagList: [] as Array<QuestionTag>,//选中一级标签的子标签集合
        selectedTagList: [] as Array<OptionsItem>,//选中标签对象集合 id:标签Id name:标签名称
        isAllowLoadTagGroup:true,//是否允许加载标签组
        loading :false,//是否正在从远程获取数据

        tagId:'',//标签Id
        title:'',//标题
        content:'',//内容
        markdownContent:'',//markdown内容
        isMarkdown:false,//是否使用markdown编辑器

        showCaptcha:false,//是否显示验证码
        captchaKey: '',//验证码key
        captchaValue: '',//验证码值
        imgUrl: '',//验证码图片
        allowSubmit:false,//提交按钮disabled状态

        addQuestionEditor :{} as any,//添加话题编辑器
		addQuestionEditorCreateParameObject :{} as any,//添加话题编辑器的创建参数

        isRefreshing:false,//是否处于下拉加载中状态

        addQuestionEditorPlugin:[] as BytemdPlugin[],//添加话题Markdown编辑器插件
    })
    //错误
    const error = reactive({
        tagId:'',//标签Id
        tagIdGroup:'',//标签Id
        title:'',//标题
        content:'',//内容
        amount: '',//悬赏金额
        point: '',//悬赏积分
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
        form.tagList.length = 0;//标签
        form.allowQuestion = true;//是否允许提问题
        form.userGradeList.length = 0;//用户等级
        form.availableTag.length = 0;//问题编辑器允许使用标签
        form.fileSystem = 0;//文件存储系统
        form.supportEditor= 10;//支持编辑器

        form.popup_mentionUser =false;//是否弹出选择提及用户表单
        form.keyword ='';//关键词
        form.mentionUserList.length= 0;//提及用户集合
        form.mentionUserEditorId='';//提及用户编辑器Id
        form.currentMarkdownEditor = {} as BytemdEditorContext | undefined,//Markdown编辑器打开‘@提及’弹窗的编辑器对象

        form.maxDeposit =  '';//用户共有预存款
        form.maxPoint =  '';//用户共有积分
        form.questionRewardPointMin =  '';//问题悬赏积分下限
        form.questionRewardPointMax =  '';//问题悬赏积分上限
        form.questionRewardAmountMin =  '';//问题悬赏金额下限
        form.questionRewardAmountMax =  '';//问题悬赏金额上限
        form.maxQuestionTagQuantity = 0;//标签最多可选数量

        form.amount = '';//悬赏金额
        form.point = '';//悬赏积分

        form.showDatetimePicker= false;//显示时间选择
        form.maxVoteOptions =0;//发起投票选项数量
        form.isVoteView = false;//是否显示发起投票
        form.isVote = false;//是否发起投票
        form.voteTitle ='';
        form.voteMaxChoice =1;
        form.voteEndDate_format ='';//截止时间
        form.voteEndDate=null;
        form.voteOptions.length = 0;

        form.popup_allTag = false;
        
        
        form.allTagList.length = 0;//标签,//全部标签
        form.selectedFirstTagId =  '';//选中的一级标签Id
        form.childTagList.length = 0;//选中一级标签的子标签集合
        form.selectedTagList.length = 0;//选中标签对象集合 id:标签Id name:标签名称
        form.isAllowLoadTagGroup = true;//是否允许加载标签组
        form.loading = false;//是否正在从远程获取数据

        form.tagId = '';//标签Id
        form.title = '';//标题
        form.content = '';//内容
        form.markdownContent = '';//markdown内容
        form.isMarkdown =false;//是否使用markdown编辑器

        form.showCaptcha = false;//是否显示验证码
        form.captchaKey =  '';//验证码key
        form.captchaValue =  '';//验证码值
        form.imgUrl =  '';//验证码图片
        form.allowSubmit = false;//提交按钮disabled状态

        form.addQuestionEditorPlugin.length = 0;//添加话题Markdown编辑器插件

        if (Object.keys(form.addQuestionEditor).length != 0) {//不等于空
            destroyEditor(form.addQuestionEditor);
            form.addQuestionEditor = {};
        }
		form.addQuestionEditorCreateParameObject = {} as any;//添加话题编辑器的创建参数
        
        init();
    };


    //处理Markdown
    const handleMarkdownChange = (value: string) => {
        form.markdownContent = value;
    }

    //白名单
    const addQuestionSanitize = (schema: any) => {
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
            if (Object.keys(form.addQuestionEditorCreateParameObject).length != 0) {//不等于空
                //创建富文本编辑器
                form.addQuestionEditor = createEditor(
                    form.addQuestionEditorCreateParameObject.toolbarRef, 
                    form.addQuestionEditorCreateParameObject.textRef, 
                    form.addQuestionEditorCreateParameObject.editorIconList, 
                    getPageBasePath()+'common/default/', 
                    form.addQuestionEditorCreateParameObject.uploadPath, 
                    form.addQuestionEditorCreateParameObject.userGradeList,
                    form.fileSystem,
                    (editorId: string)=>{
                        handleToggleMarkdownEditor(editorId);
                    },
                    (editorId: string)=>{
                        mentionPopUp(editorId,undefined)
                    },
                    ()=>{
                        //AI弹窗
                        aiPopUp(proxy,appContext,editorId,form.addQuestionEditorCreateParameObject.uploadPath,'file',form.fileSystem,form.isMarkdown,form.addQuestionEditor,undefined)
                    }
                );
                form.addQuestionEditor.txt.html(form.addQuestionEditorCreateParameObject.html);//切换时设置富文本内容
            }
        })
        
        
    }

    //处理切换到Markdown编辑器
    const handleToggleMarkdownEditor = (editorId: string) => {
        if (Object.keys(form.addQuestionEditor).length != 0) {//不等于空
            form.addQuestionEditorCreateParameObject.html = form.addQuestionEditor.txt.exportHtml();//切换时保存富文本内容
            destroyEditor(form.addQuestionEditor);
            form.addQuestionEditor = {};
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
           form.addQuestionEditor.txt.insertMention(text, link);
       }

       closeMentionUser();
   }


   //搜索提及用户
   const searchMentionUser = () => {
       form.mentionUserList.length = 0
       error.keyword = "";
       if(form.keyword == null || form.keyword.trim() == ''){
           error.keyword = t('addQuestion.210');//请输入用户账号或呢称
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
                       error.keyword = t('addQuestion.220');//当前用户不存在
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
            Notify({ type: 'warning', message: t('addTopic.280',{'p1': form.maxVoteOptions})});//投票选项不能超过 {p1} 项
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

    //查询提问题页
    const queryAddQuestion = () => {
        //清空error的属性值
        Object.keys(error).map(key => {
            Object.assign(error, {[key] : ''});
        })

        proxy?.$axios({
            url: '/user/queryAddQuestion',
            method: 'get',
            params:  {},
            showLoading: false,//是否显示加载图标
            loadingMask:false,// 是否显示遮罩层
        })
        .then((response: AxiosResponse) => {
            if(response){
                let data =  response.data;

                form.allowQuestion = data.allowQuestion;//是否允许提问题

                if(data.allowQuestion){
                    if(data.maxDeposit){
                        form.maxDeposit = data.maxDeposit;
                    }
                    if(data.maxPoint){
                        form.maxPoint = data.maxPoint;
                    }
                    form.questionRewardPointMin = data.questionRewardPointMin;
                    form.questionRewardPointMax = data.questionRewardPointMax;
                    form.questionRewardAmountMin = data.questionRewardAmountMin;
                    form.questionRewardAmountMax = data.questionRewardAmountMax;
                    form.maxQuestionTagQuantity = data.maxQuestionTagQuantity;
                    


                    if(data.userGradeList != null && data.userGradeList != ''){
                        form.userGradeList = JSON.parse(data.userGradeList);//JSON转为对象
                    }
                    if(data.availableTag != null && data.availableTag != ''){
                        let availableTagObject = JSON.parse(data.availableTag);//JSON转为对象

                        if(data.supportEditor == 30 || data.supportEditor == 40){
                            availableTagObject.push("toggleEditor");
                        }
                        form.availableTag = availableTagObject;//问题编辑器允许使用标签
                    }
                    
                    form.fileSystem = data.fileSystem;//文件存储系统
                    form.supportEditor = data.supportEditor;//支持编辑器 10.仅富文本编辑器 20.仅Markdown编辑器  30.富文本编辑器优先 40.Markdown编辑器优先

                    form.maxVoteOptions = data.maxVoteOptions;
                    if(data.maxVoteOptions != null){
                        if(data.maxVoteOptions >0){//发起投票选项数量
                            form.isVoteView = true;//是否显示发起投票
                        }
                    }else{
                        form.isVoteView = true;//是否显示发起投票
                    }
                
                    if(form.supportEditor == 20 || form.supportEditor == 40){
                        form.isMarkdown = true;
                    }

                    if (data.captchaKey != undefined && data.captchaKey != '') {
                        form.showCaptcha = true;
                        form.captchaKey = data.captchaKey;
                        replaceCaptcha();//刷新验证码
                    }

                    if (Object.keys(form.addQuestionEditorCreateParameObject).length === 0) {//等于空
                        let uploadPath = "user/control/question/upload?method=upload";

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
							}else if(_availableTag == "mention"){//提及
								editorIconList.push("mention");
							}else if(_availableTag == "ai"){//AI
								editorIconList.push("ai");
							}else if(_availableTag == "toggleEditor"){//切换编辑器
								editorIconList.push("toggleEditor");
							}
						}

                        if(form.addQuestionEditorPlugin != null && form.addQuestionEditorPlugin.length ==0){
                            //添加插件
                            form.addQuestionEditorPlugin.push(...markdownPlugins());
                            
                            
                            if(form.supportEditor == 30 || form.supportEditor == 40){//10.仅富文本编辑器 20.仅Markdown编辑器  30.富文本编辑器优先 40.Markdown编辑器优先
                                form.addQuestionEditorPlugin.push(
                                    toggleEditor((editorId: string)=>{handleToggleRichtextEditor(editorId)})
                                );
                            }
                            
                        
                            if(editorIconList?.indexOf('image') != -1){
                                form.addQuestionEditorPlugin.push(
                                    imageUpload("user/control/question/upload?method=upload",'file',form.fileSystem)
                                );
                                form.addQuestionEditorPlugin.push(
                                    pasteImageUpload("user/control/question/upload?method=upload",'file',form.fileSystem)
                                );
                            }  
                        
                            form.addQuestionEditorPlugin.push(emoji());
                            if(editorIconList?.indexOf('mention') != -1){
                                form.addQuestionEditorPlugin.push(
                                    mention((editorId: string,ctx:BytemdEditorContext)=>{mentionPopUp(editorId,ctx)})
                                );
                            }
                            if(editorIconList?.indexOf('ai') != -1){
                                form.addQuestionEditorPlugin.push(
                                    ai((editorId: string,ctx:BytemdEditorContext)=>{aiPopUp(proxy,appContext,editorId,uploadPath,'file',form.fileSystem,form.isMarkdown,undefined,ctx)})
                                );
                            }
                            form.addQuestionEditorPlugin.push(
                                help(form.availableTag,form.userGradeList)
                            );
                            
                        }

                        if(!form.isMarkdown){
                             //创建富文本编辑器
                            form.addQuestionEditor = createEditor(questionContentEditorToolbarRef.value,questionContentEditorTextRef.value,editorIconList, getPageBasePath()+'common/default/', uploadPath, form.userGradeList,form.fileSystem,(editorId: string)=>{
                                handleToggleMarkdownEditor(editorId);
                            },
                            (editorId: string)=>{
                                mentionPopUp(editorId,undefined)
                            },
                            (editorId: string)=>{
                                //AI弹窗
                                aiPopUp(proxy,appContext,editorId,uploadPath,'file',form.fileSystem,form.isMarkdown,form.addQuestionEditor,undefined)
                            });
                        
                        }
                        
                        form.addQuestionEditorCreateParameObject = {
                            toolbarRef:questionContentEditorToolbarRef.value,
                            textRef:questionContentEditorTextRef.value,
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


    //显示标签界面
    const showTagUI = () => {
        form.popup_allTag = true;
        queryQuestionTagList();
    }


    //查询所有标签
    const queryQuestionTagList = () => {
        if(!form.isAllowLoadTagGroup){
	        return;
	    }
        form.loading = true;
       
        proxy?.$axios({
            url: '/queryAllQuestionTag',
            method: 'get',
            params:  {},
            showLoading: false,//是否显示加载图标
            loadingMask:false,// 是否显示遮罩层
        })
        .then((response: AxiosResponse) => {
            return response?.data
        })
        .then((data: Array<QuestionTag>) => {
            if(data != null && data.length >0){
                form.allTagList = data;
                for(let i=0; i<data.length; i++){
                    let questionTag = data[i];

                    //第一次选中第一个标签
                    if(form.selectedFirstTagId == ''){
                        form.childTagList = questionTag.childTag;
                        form.selectedFirstTagId = questionTag.id;
                        break;
                    }else{
                        if(form.selectedFirstTagId == questionTag.id){
                            form.childTagList = questionTag.childTag;
                            break;
                        }
                    }
                }
            }
            form.isAllowLoadTagGroup = false;
            form.loading = false;

        })
        .catch((error: any) =>{
            console.log(error);
        });
    }

    //选择子标签
    const selectChildTag = (questionTagId:string) => {
        form.selectedFirstTagId = questionTagId;
			
        if(form.allTagList != null && form.allTagList.length >0){
            for (let i= 0; i < form.allTagList.length; i++) {
                let questionTag = form.allTagList[i];
                
                if(questionTagId == questionTag.id){
                    form.childTagList = questionTag.childTag;
                    
                    //如果只有一个节点，则允许选择本标签
                    if(questionTag.childNodeNumber == 0){
                        selectedTag(questionTag);
                    }

                    break;
                }
                
            }
            
        }
    }
		
    //选中标签
    const selectedTag = (childQuestionTag:QuestionTag) => {
        //判断是否重复选择,如果重复则取消选择
        if(form.selectedTagList != null && form.selectedTagList.length >0){
            for(let i=0; i<form.selectedTagList.length; i++){
                let selectedTag = form.selectedTagList[i];
                if(selectedTag.id == childQuestionTag.id){
                    //删除标签
                    deleteTag(selectedTag.id);
                    return;
                }
            }
            
        }
        
        //如果超过最大允许选择数量
        if(form.selectedTagList.length >= form.maxQuestionTagQuantity){
            Toast.fail(t('addQuestion.230'));//已超过允许选择的最大标签数量
            return;
        }

        let o = new Object() as any;
        o.id = childQuestionTag.id;
        o.name = childQuestionTag.name;

        form.selectedTagList.push(o);
    }
    //删除标签
    const deleteTag = (questionTagId:string) => {
        if(form.selectedTagList != null && form.selectedTagList.length >0){
            for(let i=0; i<form.selectedTagList.length; i++){
                let selectedTag = form.selectedTagList[i];
                if(selectedTag.id == questionTagId){
                    form.selectedTagList.splice(i, 1);
                    return;
                }
            }
            
        }
    }
    //选中一级标签样式
    const selectedTagClass = (questionTagId:string) => {
        let className = "nav-item";
        if(form.selectedFirstTagId == questionTagId){
            className += " active";
            
        }
        if(form.selectedTagList != null && form.selectedTagList.length >0){
            for(let i=0; i<form.selectedTagList.length; i++){
                let selectedTag = form.selectedTagList[i];
                if(selectedTag.id == questionTagId){
                    className += " selected";
                }
            }
            
        }
        return className;
    }
    //选中二级标签样式
    const selectedChildTagClass = (questionTagId:string) => {
        if(form.selectedTagList != null && form.selectedTagList.length >0){
            for(let i=0; i<form.selectedTagList.length; i++){
                let selectedTag = form.selectedTagList[i];
                if(selectedTag.id == questionTagId){
                    return "child-tag selected";
                }
            }
            
        }
        return "child-tag";
    }

    //金额格式化
    const amountFormat = (value:string):string => {
       return value = clearNoNum(value);
    }

    //控制只能输入小数点后2位
    const clearNoNum = (val:string) => {
        val = val.replace(/[^\d.]/g, "");  //清除“数字”和“.”以外的字符   
        val = val.replace(/\.{2,}/g, "."); //只保留第一个. 清除多余的   
        val = val.replace(".", "$#$").replace(/\./g, "").replace("$#$", ".");
        val = val.replace(/^(\-)*(\d+)\.(\d\d).*$/, '$1$2.$3');//只能输入两个小数   
        if (val.indexOf(".") < 0 && val != "") {//以上已经过滤，此处控制的是如果没有小数点，首位不能为类似于 01、02的金额  
            val = parseFloat(val).toString();
        }
        return val;
    }

    //校验标题
    const validatorTitle = (val:any):boolean => {
        if(val == ''){
            error.title = t('addQuestion.240')//标题不能为空
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
                if(form.selectedTagList != null && form.selectedTagList.length >0){
                    for(var i=0; i<form.selectedTagList.length; i++){
                        var selectedTag =form.selectedTagList[i];
                        formData.append('tagId', selectedTag.id); 
                    }
                    
                }

                if(form.title != null && form.title != ''){
                    formData.append('title', form.title);
                }

                
                if(form.isMarkdown){
                    formData.append('isMarkdown', form.isMarkdown.toString());
                    formData.append('markdownContent', form.markdownContent);
                }else{
                    let content =  form.addQuestionEditor.txt.exportHtml()
                    if(content != null && content !=''){
                        formData.append('content', content);
                    }
                }

                
                if(form.amount != null && form.amount != ''){
                    formData.append('amount', form.amount);
                }
                if(form.point != null && form.point != ''){
                    formData.append('point', form.point);
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
                    url: '/user/control/question/add',
                    method: 'post',
                    data: formData
                })
                .then((response: AxiosResponse) => {
                    if(response){

                        const result: any = response.data;
                        if(JSON.parse(result.success)){//登录成功
                             // 成功通知
                             Notify({ 
                                type: 'success', 
                                message: t('addQuestion.250'),//提交成功，3秒后自动跳转到问答页
                                onClose: ()=>{
                                    router.push({
                                        path : '/askList'
                                    }); 
                                } 
                            });
                        }else{
                            /**
                            //修改返回属性
                            for (const [key, value] of Object.entries(result.error as Map<string,string>) as [string, string][]){
                                if(key == "tagId"){
                                    result.error.tagIdGroup = value;
                                }
                            } */

                            //处理错误信息
                            processErrorInfo(result.error as Map<string,string>, error,()=>{});
                            

                            

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
        if(to.name == 'addQuestion'){
            init();
        }
        
        next();
    });

    onMounted(() => {
        init();
    }) 


    //卸载组件实例后调用
    onUnmounted (()=>{
        if (Object.keys(form.addQuestionEditor).length != 0) {//不等于空
            destroyEditor(form.addQuestionEditor);
            form.addQuestionEditor = {};
        }
    })
    //初始化
    const init = () => {
        queryAddQuestion();
       // queryTagList();
    }

    //进入keep-alive组件时触发
    onActivated(()=>{
        //后退时修改浏览器标题
        let titleValue = store_title.value
        if(titleValue != null && titleValue != ''){
            document.title = t('addQuestion.10')+' - ' + titleValue;//提问题
        }
    })
</script>
<style scoped lang="scss">

.addQuestionModule{
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
        
        .content{
            &:after{
                display: none;
            }
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




    .questionTag{
        margin-top: -3px;
        line-height: 40px;
        .btn {
            display: inline-block;
            font-weight: 400;
            text-align: center;
            vertical-align: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            
            border: 1px solid transparent;
            color: var(--van-gray-7);
            background-color: var(--van-gray-3);
            border-color: var(--van-gray-3);

            padding: 3px 8px;
            font-size: 14px;
            line-height: 22px;
            border-radius: 3px;
            transition: color .15s ease-in-out,background-color .15s ease-in-out,border-color .15s ease-in-out,box-shadow .15s ease-in-out;
            outline:none;
            
            word-wrap:break-word;
            word-break:break-all;
            
            &:hover {
                color: #5c5f65;
                background-color: #e2e6ea;
                border-color: #dae0e5
            }
        }
        .mr{
            margin-right: 5px!important;
        }
        .ml{
            margin-left: 5px!important;
        }
        .addTag{
            position: relative;
            display: inline-block!important
        }
        .warning {
            -webkit-animation: tag-warning 2s;
            animation: tag-warning 2s
        }
        /**将动画与元素绑定**/
        @-webkit-keyframes tag-warning {
            0% {
                background-color: #ff9e00;
                border-color: #ff9e00
            }

            to {
                background-color: #fff
            }
        }

        @keyframes tag-warning {
            0% {
                background-color: #ff9e00;
                border-color: #ff9e00
            }

            to {
                background-color: #fff
            }
        }
    }
}

/** 选择问题标签 **/
.selectQuestionTagModule {
    overflow-y:auto;
	-webkit-overflow-scrolling: touch;
    width: 100%;
	height: 100%; 
    margin: 16px 0px 8px 0px;
    .box{
        padding-bottom: 10px;
        .questionTagNavigation{
            font-size: 14px;
            margin: 8px;
            .nav {
                background: var(--van-gray-1);
                padding-left: 8px;
                padding-top: 8px;
                padding-right: 8px;
                
                .nav-item{
                    margin-right: 8px!important;
                    margin-bottom: 8px!important;
                    display: inline-block;
                    position: relative;
                    .nav-link {
                        border-radius: 3px;
                        border: 1px solid var(--van-blue);
                        color: var(--van-blue);
                        background-color: #fff;
                        height:30px;
                        line-height:30px;
                        padding-left:8px;
                        padding-right:8px;

                        display: -webkit-box;
                        overflow: hidden;
                        text-overflow: ellipsis;
                        line-clamp: 1;
                        -webkit-box-orient: vertical;
                        word-wrap:break-word;
                        word-break:break-all;

                    }
                }
                .selected{
                    position: relative;
                    transition: all 0.5s ease;
                    &:after {
                        content: '✔';
                        height: 0px;
                        width: 0px;
                        position: absolute;
                        bottom: -4px;
                        right: -4px;
                        color:#fff;
                        line-height: 8px;
                        border: 11px solid;
                        border-color: transparent var(--van-blue) var(--van-blue) transparent;
                        border-radius:3px 0px 0px 0px;
                        /**对号大小,设置小于12px的文字*/
                        display: inline-block;
                        font-size: 12px;
                        -webkit-text-size-adjust:none;
                        transform : scale(0.6,0.6);/*缩放指定dom，但必须是block级*/
                        
                    }
                }
                .active{
                    .nav-link{
                        color: var(--van-blue);
                        background-color: #E8F7FF;
                    }
                    
                }
            }
            .tab-content{
                margin: 8px;
                
            }
            .child-tag {
                display: inline-block;
                font-size: 14px;
                padding: 2px 8px;
                height: 28px;
                line-height: 28px;
                border-radius: 3px;
                background-color: #E8F7FF;
                color:var(--van-blue);
                margin-right: 8px;
                margin-bottom: 8px;
            }

            
            .selected{
                position: relative;
                transition: all 0.5s ease;
                &:after {
                    content: '✔';
                    height: 0px;
                    width: 0px;
                    position: absolute;
                    bottom: -2px;
                    right: -2px;
                    color: var(--van-blue);
                    line-height: 6px;
                    border: 10px solid;
                    border-color: transparent transparent transparent transparent;
                    //对号大小,设置小于12px的文字
                    display: inline-block;
                    font-size: 12px;
                    -webkit-text-size-adjust:none;
                    transform : scale(0.7,0.7);//缩放指定dom，但必须是block级
                    
                }
            } 
        }
    }
}


</style>