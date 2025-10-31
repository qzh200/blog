<!--问答列表-->
<template>
    <div class="main">
        <div class="main-container">
            <van-sticky>
                <div class="headModule">
                    <div class="container">
                        <div class="left-layout">
                            <div class="tagIcon" @click="displayAllTag();"><Icon name="menu-alt" :size="convertViewportWidth('18px')" class="icon"/></div>
                            <!--全部-->
					        <div class="tagName" @click="displayAllTag();">{{state.questionTagName == '' ?  t('askList.10') : state.questionTagName}}</div>
                        </div>
                        <div class="right-layout">
                            <!--提问题-->
                            <van-button plain round type="primary" @click="router.push({path: '/addQuestion'})">{{t('askList.20')}}</van-button>
                        </div>
                    </div>
                </div>
            </van-sticky>
            <van-popup v-model:show="state.popup_allTag" safe-area-inset-top safe-area-inset-bottom :close-on-popstate="true" position="left" closeable close-icon="close" class="custom-left-popupModule" :style="{ width: '55%',height: '100%'  }">
                <div ref="tagScrollbarRef" class="scroll">
                    <van-sidebar v-model="state.tag_sidebar_active" @change="onChangeTag" class="tag-sidebar">
                        <van-sidebar-item class="sidebar-item">
                            <template #title>
                                <div class="tag-item">
                                    <div class="svg-container">
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"><path d="M19 21H5C4.44772 21 4 20.5523 4 20V11L1 11L11.3273 1.6115C11.7087 1.26475 12.2913 1.26475 12.6727 1.6115L23 11L20 11V20C20 20.5523 19.5523 21 19 21ZM6 19H18V9.15745L12 3.7029L6 9.15745V19ZM8 15H16V17H8V15Z"></path></svg>
                                    </div>
                                    <!-- 全部 -->
                                    <div class="name">{{t('askList.10')}}</div>
                                    <div class="allowRoleView"></div>
                                </div>
                            </template>
                        </van-sidebar-item>
                        <div :ref="'tag_'+tag.id"  v-for="(tag,index) in state.tagList" :key="tag.id">
                            <van-sidebar-item class="sidebar-item" :disabled="tag.childNodeNumber >0">
                                <template #title>
                                    <div class="tag-item" :class="{'showTagArrow':state.showTagArrow == true && tag.childTag.length >0}">
                                        <div class="image-container" v-if="tag.image != null && tag.image != ''">
                                            <van-image width="16px" height="16px" :src="tag.image" lazy-load :show-loading="false" fit="cover"></van-image>
                                        </div>
                                        <div v-else class="svg-container">
                                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"><path d="M7.78428 14L8.2047 10H4V8H8.41491L8.94043 3H10.9514L10.4259 8H14.4149L14.9404 3H16.9514L16.4259 8H20V10H16.2157L15.7953 14H20V16H15.5851L15.0596 21H13.0486L13.5741 16H9.58509L9.05957 21H7.04855L7.57407 16H4V14H7.78428ZM9.7953 14H13.7843L14.2047 10H10.2157L9.7953 14Z"></path></svg>
                                        </div>
                                        <div class="name">{{tag.name}}</div>
                                    </div>
                                    <div class="arrow" :class="state.isExpandTagMap.get(tag.id) == true ? 'expand' :''" @click="onToggleTag(tag.id,$event)" v-if="state.showTagArrow && tag.childTag.length >0"><van-icon class="arrow-icon" name="arrow-down" :size="convertViewportWidth('12px')"/></div>
                                
                                </template>
                            </van-sidebar-item>
                            <div :ref="'allChildTag_'+tag.id">
                                <div :ref="'childTag_'+childTag.id" class="childTag" :class="state.isExpandTagMap.get(tag.id) == true ? 'expand' :''"  :style="{'max-height': state.isExpandTagMap.get(tag.id) == true ? state.childTagAutoHeightMap.get(tag.id)+'px':0}" v-for="(childTag,index2) in tag.childTag" :key="childTag.id">
                                    <van-sidebar-item class="sidebar-item">
                                        <template #title>
                                            <div class="tag-item">
                                                <div class="childName">{{childTag.name}}</div>
                                            </div>
                                        </template>
                                    </van-sidebar-item>
                                </div>
                            </div>
                        </div>
                    </van-sidebar>
                </div>
            </van-popup>

            <div class="navTabModule">
                <van-tabs v-model:active="state.filterCondition" :shrink="true" @click-tab="onClickNavTab">
                    <van-tab :title="t('askList.30')" :name="10"></van-tab><!--title="最新"-->
                    <van-tab :title="t('askList.40')" :name="20"></van-tab><!--title="未解决"-->
                    <van-tab :title="t('askList.50')" :name="30"></van-tab><!--title="已解决"-->
                    <van-tab :title="t('askList.60')" :name="40"></van-tab><!--title="积分悬赏"-->
                    <van-tab :title="t('askList.70')" :name="50"></van-tab><!--title="现金悬赏"-->
                </van-tabs>
            </div>
            <!-- success-text="刷新成功" -->
            <van-pull-refresh v-model="state.isRefreshing" :success-text="t('common.130')" pull-distance="200" @refresh="onRefresh" style="min-height: 50vh;">
                <div class="askListModule" >
                    <!--error-text="请求失败，点击重新加载" finished-text="没有更多了"-->
                    <van-list v-model:loading="state.isLoading" :finished="state.isFinished" v-model:error="state.isError" :error-text="t('common.140')" :finished-text="t('common.150')" @load="onLoad">
                        <!-- 删除加载中提示 -->
                        <template #loading>
                            
                        </template>
                        <div v-for="(question,index) in state.questionList" :key="question.id" class="item">
                            <div class="top-container">
                                <div class="left-layout">
                                    <router-link v-if="question.account != null && question.account != ''" tag="a" :to="{path:'/user/control/home',query: {userName: question.userName}}">
                                        <span class="avatarImg">
                                            <img v-if="question.avatarName != null" :src="question.avatarPath+'100x100/'+question.avatarName" class="img">
                                        
                                            <img v-if="question.avatarName == null" :src="question.avatar" class="img"/>
                                        </span>
                                    </router-link>
                                    <template v-if="question.account == null || question.account == ''">
                                        <span class="avatarImg">
                                            <img v-if="question.avatarName == null" :src="question.avatar" class="img"/>
                                        </span>
                                    </template>
                                </div>
                                <div class="middle-layout">
                                    <div class="userInfo">
                                        
                                        
                                        <span v-if="question.nickname == null || question.nickname == ''" class="account">{{question.account}}</span>
                                        <span v-if="question.nickname != null && question.nickname != ''" class="account">{{question.nickname}}</span>
                                        <span class="userRoleName" v-for="roleName in question.userRoleNameList">{{roleName}}</span>
                                        <!--官方人员-->
                                        <span class="staff" v-if="question.isStaff">{{t('askList.100')}}</span>
                                        <!--已注销-->
                                        <div v-if="question.account == null || question.account == ''" class="cancelAccount">{{t('askList.170')}}</div>
                                        <span class="time">{{question.postTime}}</span>
                                    </div>
                                </div>
                                <div class="right-layout">
                                    <span class="topTag">
                                        <!--置顶-->
                                        <span class="top" v-if="question.sort >0">{{t('askList.180')}}</span>
                                    </span>
                                    <span class="solve">
                                        <!--解决-->
                                        <span class="adoption" v-if="Long.fromString(question.adoptionAnswerId).gt(0)">{{t('askList.120')}}</span>
                                    </span>
                                </div>
                            </div>
                            <div class="middle-container">
                                <!--此用户账号已注销-->
                                <div class="cancelAccount" v-if="question.account == null || question.account == ''">{{t('askList.110')}}</div>
                                <div class="topic-layout">
                                    <router-link tag="span" class="title" :to="{path: '/question', query: {questionId: question.id}}" >{{question.title}}</router-link>
                                    <span class="vote" v-if="question.voteThemeId != null && question.voteThemeId != ''"><Icon name="vote" :size="convertViewportWidth('20px')" /></span>
                                
                                </div>
                                <div class="summary van-multi-ellipsis--l2">
                                    <router-link tag="span" :to="{path: '/question', query: {questionId: question.id}}" >{{question.summary}}</router-link>
                                </div>
                                
                            </div>
                            <div class="middle-lower-container"  v-if="parseFloat(question.amount) > 0 || Long.fromString(question.point).gt(0)">
                                <div class="reward" >
                                    <span class="rewardInfo" >
                                        <!--
                                        悬赏<span v-if="parseFloat(question.amount) >0">金额<span class="symbol">¥</span><span class="amount">{{question.amount}}</span>元</span>
                                            
                                        <span v-if="Long.fromString(question.point).gt(0)"><span class="point">{{question.point}}</span>积分</span>-->

                                        <!-- 仅含有金额 -->
                                        <template v-if="parseFloat(question.amount) >0 && Long.fromString(question.point).lte(0)">
                                            <i18n-t keypath="askList.140" scope="global">
                                                <template #p1>
                                                    <span class="symbol">¥</span><span class="amount">{{question.amount}}</span>
                                                </template>
                                            </i18n-t>
                                        </template>
                                        <!-- 仅含有积分 -->
                                        <template v-if="parseFloat(question.amount) <=0 && Long.fromString(question.point).gt(0)">
                                            <i18n-t keypath="askList.150" scope="global">
                                                <template #p1>
                                                    <span class="point">{{question.point}}</span>
                                                </template>
                                            </i18n-t>
                                        </template>

                                        <!-- 含有金额和积分 -->
                                        <template v-if="parseFloat(question.amount) >0 && Long.fromString(question.point).gt(0)">
                                            <i18n-t keypath="askList.160" scope="global">
                                                <template #p1>
                                                    <span class="symbol">¥</span><span class="amount">{{question.amount}}</span>
                                                </template>
                                                <template #p2>
                                                    <span class="point">{{question.point}}</span>
                                                </template>
                                            </i18n-t>
                                        </template>
                                    </span>
                                </div>
                            </div>
                            <div class="bottom-container">
                                <div class="left-layout">
                                    <div class="tagName-box">
                                        <div class="tagName" v-for="questionTagAssociation in question.questionTagAssociationList">{{questionTagAssociation.questionTagName}}</div>
                                    </div>
                                </div>
                                <div class="right-layout">
                                    <div class="statistics">
                                        <Icon name="info-alt" :size="convertViewportWidth('14px')" class="icon"/><span class="commentTotal">{{question.answerTotal}}</span>
				            	        <Icon name="view" :size="convertViewportWidth('14px')" class="icon"/><span class="viewTotal">{{question.viewTotal}}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </van-list>
                    <div class="item" v-if="state.isSkeleton">
                        <van-skeleton :row="3" :loading="state.isSkeleton" class="skeleton"/>
                    </div>
                </div>
            </van-pull-refresh>
        </div>
    </div>
    <!-- 底部导航栏-->
    <BottomTabbar/>
</template>
<script lang="ts" setup>
    import { onMounted, getCurrentInstance, ComponentInternalInstance, reactive, watchEffect, onActivated, nextTick, ref, } from 'vue'
    import { AxiosResponse } from 'axios'
    import pinia from '@/store/store'
    import {useStore} from '@/store'
    import { storeToRefs } from 'pinia';
    import { convertViewportWidth } from '@/utils/px-to-viewport';
    import { onBeforeRouteUpdate } from 'vue-router';
    import { useRouter } from 'vue-router'
    import { PageView, Question, QuestionTag, } from '@/types';
    import { letterAvatar } from '@/utils/letterAvatar';
    import Long from "long";
    import { useI18n } from 'vue-i18n';
    let { t } = useI18n();
    
    const store = useStore(pinia);
    const router = useRouter();
    const { proxy } = getCurrentInstance() as ComponentInternalInstance;
    const tagScrollbarRef = ref();

    const {title:store_title,keywords:store_keywords,description:store_description,systemUser:store_systemUser} = storeToRefs(store)
 
 
    const state = reactive({
        showTagArrow: true,//显示标签箭头
        defaultExpandTag: true,//默认展开标签
        isExpandTagMap : new Map<string,boolean>(),//是否展开标签 key:标签Id value: 是否展开
        childTagAutoHeightMap : new Map<string,number>(),//子标签高度 key:标签Id value: 高度

        popup_allTag :false,
        tag_sidebar_active:0,//Sidebar 侧边导航
        questionTagId :'',//标签Id
		questionTagName :'',//标签名称
        tagList:[] as Array<QuestionTag>,//标签 
        filterCondition:10,//过滤条件

        questionList:[] as Array<Question>,
        totalrecord : 0, //总记录数
		currentpage : 0, //当前页码
        totalpage : 1, //总页数
        maxresult: 12, //每页显示记录数  
        
        isRefreshing:false,//是否处于下拉加载中状态
        isError:false,//是否列表数据加载失败
        isLoading:false,//是否处于加载中状态
        isFinished:false,//是否加载完毕
        isSkeleton:true,//是否显示骨架屏
        isShowPage:false,//是否显示分页

    });


    //下拉刷新时触发
    const onRefresh = () => {
        state.isRefreshing = false;

        //重置
        state.showTagArrow = true;//显示标签箭头
        state.defaultExpandTag = true;//默认展开标签
        state.isExpandTagMap.clear();//是否展开标签 key:标签Id value: 是否展开
        state.childTagAutoHeightMap.clear();//子标签高度 key:标签Id value: 高度

        state.popup_allTag = false;
        state.tag_sidebar_active = 0;//Sidebar 侧边导航
        state.questionTagId ='';//标签Id
		state.questionTagName ='';//标签名称
        state.tagList.length =0;//标签 
        state.filterCondition =10;//过滤条件

        state.questionList.length = 0;
        state.totalrecord = 0; //总记录数
		state.currentpage = 0; //当前页码
        state.totalpage = 1; //总页数
        state.maxresult = 12; //每页显示记录数   
        
        state.isError = false;//是否列表数据加载失败
        state.isFinished = false; 

        state.isLoading = true;//手动触发查询数据需将'加载状态结束'设为true
        init();
        queryQuestionList(state.questionTagId,state.filterCondition,state.currentpage+1);
    };
    //加载列表
    const onLoad = () => {
        queryQuestionList(state.questionTagId,state.filterCondition,state.currentpage+1);
    }

    //显示所有标签选择
    const displayAllTag = () => {
        state.popup_allTag = true;
        if(state.questionTagId == ''){
            state.tag_sidebar_active = 0;
        }else{
            if(state.tagList != null && state.tagList.length >0){
                let count =0;
                for(let i=0; i<state.tagList.length; i++ ){
                    let questionTag = state.tagList[i];
                    count++;
                    if(questionTag.id == state.questionTagId){
                        state.tag_sidebar_active = (count);
                        break;
                    }
                    if (questionTag.childTag != null && questionTag.childTag.length > 0) {
                        for (let j = 0; j < questionTag.childTag.length; j++) {
                            let childQuestionTag = questionTag.childTag[j];
                            count++;
                            if(state.questionTagId == childQuestionTag.id){
                                state.tag_sidebar_active = (count);
                                break;
                            }
                        }
                        
                    }
                }
            }
        }

        nextTick(()=>{
            let flag = false;//是否选中一级标签
            if(state.tagList != null && state.tagList.length >0){
                for(let i:number=0; i<state.tagList.length; i++){
                    let tag = state.tagList[i];
                    
                    state.isExpandTagMap.set(tag.id,state.defaultExpandTag);

                    nextTick(()=>{

                        let offsetHeight = 0;
                        let tagRefValue =  (proxy?.$refs['tag_'+tag.id] as any);
                        if(tagRefValue != undefined && tagRefValue[0]){
                            offsetHeight = tagRefValue[0].offsetHeight;
                        }

                        //克隆节点获取高度
                        let childTagRefValue =  (proxy?.$refs['allChildTag_'+tag.id] as any);
                        if(childTagRefValue != undefined && childTagRefValue[0]){
                            const clone = childTagRefValue[0].cloneNode(true);
                            clone.style.position = 'absolute';
                            clone.style.top = '-9999px';
                            document.body.appendChild(clone);

                            // 遍历所有子元素
                            Array.from(clone.children).forEach((child:any) => {
                                child.removeAttribute('style');//删除style="max-height: 0px;"
                            });
                            offsetHeight += clone.offsetHeight;
                            document.body.removeChild(clone);
                        }
                        state.childTagAutoHeightMap.set(tag.id,offsetHeight);
                    })
                    if(state.questionTagId != '' && tag.id == state.questionTagId){
                        flag = true;
                    }
                }

                //如果选中的是子标签
                if(!flag){
                    A:for(let i:number=0; i<state.tagList.length; i++){
                        let tag = state.tagList[i];
                        for(let j:number=0; j<tag.childTag.length; j++){
                            let childTag = tag.childTag[j];
                            if(childTag.id == state.questionTagId){
                                nextTick(()=>{
                                    state.isExpandTagMap.set(tag.id,true);//展开标签
                                })
                                break A;
                            }
                        }
                    }
                }

                //滚动到选中标签位置
                nextTick(()=>{
                    setTimeout(function(){
                        scrollToSelectedTag();
                    }, 400);
                })
            }
        })
    }

    //展开收缩标签
    const onToggleTag = (tagId:string,event:Event | null) => {
        
        let isExpand = state.isExpandTagMap.get(tagId);
        if(isExpand){
            state.isExpandTagMap.set(tagId,false);
        }else{
            state.isExpandTagMap.set(tagId,true);
        }
        if(event != null){
            event.stopPropagation(); 
        }
    }

    //滚动到选中标签位置
    const scrollToSelectedTag = () => {
        if(state.questionTagId != ''){
            //可视高度
            let clientHeight = tagScrollbarRef.value.clientHeight;
            //标签距顶部高度
            let offsetTop = 0;


           
            A:for(let i:number=0; i<state.tagList.length; i++){
                let tag = state.tagList[i];

                if(tag.id == state.questionTagId){//选择的标签为一级标签
                    let offsetTopRefValue =  (proxy?.$refs['tag_'+state.questionTagId] as any);
                    
                    if(offsetTopRefValue != undefined && offsetTopRefValue[0]){
                        offsetTop =offsetTopRefValue[0].offsetTop;
                    }
                    break A;
                }
                for(let j:number=0; j<tag.childTag.length; j++){//选择的标签为二级标签
                    let childTag = tag.childTag[j];
                    if(childTag.id == state.questionTagId){

                        let childTagRefValue =  (proxy?.$refs['childTag_'+childTag.id] as any);
                        if(childTagRefValue != undefined && childTagRefValue[0]){
                            offsetTop += childTagRefValue[0].offsetTop;//二级标签距顶部高度
                        }


                        break A;
                    }
                }
            }
            if(offsetTop > clientHeight){
                tagScrollbarRef.value.scrollTo({
                    top: offsetTop,
                    behavior: 'smooth'
                })
            }
        }
    }

    //查询所有问题标签
    const queryTagList = () => {
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
           

            if (data != null && data.length > 0) {
                let count =0;
                for (let i= 0; i < data.length; i++) {
                    let questionTag = data[i];
                    count++;
                    if(state.questionTagId == questionTag.id){
                        state.tag_sidebar_active = (count);
                        state.questionTagName = questionTag.name;
                        break;
                    }
                    if (questionTag.childTag != null && questionTag.childTag.length > 0) {
                        for (let j = 0; j < questionTag.childTag.length; j++) {
                            count++;
                            let childQuestionTag = questionTag.childTag[j];
                            if(state.questionTagId == childQuestionTag.id){
                                state.tag_sidebar_active = (count);
                                state.questionTagName = childQuestionTag.name;
                                break;
                            }
                        }
                        
                    }
                }
            }

            state.tagList = data;
        })
        .catch((error: any) =>{
            console.log(error);
        });
    }

    //侧边导航选中标签
    const onChangeTag = (index:number) => {
        if(index == 0){
            state.popup_allTag = false;
            router.push({path: '/askList'});
            return;
        }
        if(state.tagList != null && state.tagList.length >0){
            let count =0;
            for(let i=0; i<state.tagList.length; i++ ){
                let questionTag = state.tagList[i];
                count++;
                if(index == count){
                  
                    
                    if (questionTag.childNodeNumber == 0) {
                        state.popup_allTag = false;
                        router.push({path: '/askList', query:{ questionTagId : questionTag.id}})
                    }

                    break;
                }
                if (questionTag.childTag != null && questionTag.childTag.length > 0) {
                    for (let j = 0; j < questionTag.childTag.length; j++) {
                        count++;
                        let childQuestionTag = questionTag.childTag[j];
                        if(index == count){
                            state.popup_allTag = false;
                            router.push({path: '/askList', query:{ questionTagId : childQuestionTag.id}})
                            break;
                        }
                    }
                    
                }
            }
        }
    }

    
     //标签导航
     const onClickNavTab = ( {name} :any) => {
        setTimeout(function () {//让底部方块滑完再跳转
            if(name == 10){//最新
                router.push({path: '/askList'});
            }else if(name == 20){
                router.push({path: '/askList', query: {filterCondition: 20}});
            }else if(name == 30){
                router.push({path: '/askList', query: {filterCondition: 30}});
            }else if(name == 40){
                router.push({path: '/askList', query: {filterCondition: 40}});
            }else if(name == 50){
                router.push({path: '/askList', query: {filterCondition: 50}});
            }
        }, 300);
        
     }

    //查询问题列表
    const queryQuestionList = (questionTagId:string,filterCondition:number,page: number) => {
        let param = {} as any
        if(questionTagId){
			param.questionTagId = questionTagId
		}
        if(filterCondition){
			param.filterCondition = filterCondition
		}
        if(page){
            param.page = page
        }
        
        proxy?.$axios({
            url: '/queryQuestionList',
            method: 'get',
            params:  param,
            showLoading: false,//是否显示加载图标
            loadingMask:false,// 是否显示遮罩层
            showErrorMessage:false,// 是否显示错误提示
        })
        .then((response: AxiosResponse) => {
            return response?.data
        })
        .then((data: PageView<Question>) => {
            state.isSkeleton = false;//关闭骨架屏
           

            if(data.records != null && data.records.length >0){
                for(let i:number=0; i<data.records.length; i++){
                    let question = data.records[i];
                    if(question.nickname != null && question.nickname !=''){
                        question.avatar = letterAvatar(question.nickname, 40);
                    }else{
                        question.avatar = letterAvatar(question.account, 40);
                    }
                    
                }
                state.questionList.push.apply(state.questionList,data.records)
            }


            
            state.totalrecord = parseInt(data.totalrecord);//服务器返回的long类型已转为String类型
            state.currentpage = data.currentpage;
            state.totalpage = parseInt(data.totalpage);//服务器返回的long类型已转为String类型
            state.maxresult = data.maxresult;

            state.isShowPage = true;//显示分页栏
            if(state.totalpage == 0 || state.totalpage == page){//如果没有内容或是最后一页，则不再加载
                state.isFinished = true;
            }
            state.isLoading = false;//加载状态结束
            
        })
        .catch((error: any) =>{
            state.isError = true;
            state.isLoading = false;//加载状态结束
            console.log(error);
        });
    }

    
    //导航守卫
    onBeforeRouteUpdate((to, from, next) => {
        if(to.name == 'askList'){
            if(to.query.questionTagId != undefined){
                state.questionTagId = to.query.questionTagId as string
            }
            if(to.query.filterCondition != undefined){
                state.filterCondition = parseInt(to.query.filterCondition as string)
            }
            //删除缓存
            store.setCacheNumber(to.name)
           // init();
        }
        next();
    });

    //html页元信息
    watchEffect(() => {
        let tagId = state.questionTagId;
        let titleValue = store_title.value//监听网站标题

       
        if(tagId == ''){
            document.title = t('askList.130')+' - ' + (titleValue != null && titleValue != '' ? titleValue : '');//问答
        }
        if(state.tagList != null && state.tagList.length >0){
            for(let i=0; i<state.tagList.length; i++ ){
                let questionTag = state.tagList[i];
                if(questionTag.id == tagId){
                    document.title = questionTag.name;
                    (document.getElementsByName('description')[0] as any).content  = questionTag.name;
                    break;
                }
                if (questionTag.childTag != null && questionTag.childTag.length > 0) {
                    for (let j = 0; j < questionTag.childTag.length; j++) {
                        let childQuestionTag = questionTag.childTag[j];
                        if(tagId == childQuestionTag.id){
                            document.title = childQuestionTag.name;
                            (document.getElementsByName('description')[0] as any).content  = childQuestionTag.name;
                            break;
                        }
                    }
                    
                }
            }
        }
       
        
    }, {
        flush: 'post'//在组件更新后触发，第一次运行需要组件渲染完成才执行
    })

    onMounted(() => {
        state.questionTagId = router.currentRoute.value.query.questionTagId != undefined ? router.currentRoute.value.query.questionTagId as string :'';
        state.filterCondition = router.currentRoute.value.query.filterCondition != undefined ? parseInt(router.currentRoute.value.query.filterCondition as string) :10;

        init();
    }) 

    //初始化
    const init = () => {
        queryTagList();

        //设置缓存
        store.setCacheComponents(String(router.currentRoute.value.name))
    }

    //进入keep-alive组件时触发
    onActivated(()=>{
        
    })
</script>
<style scoped lang="scss">
.headModule{
    background: #fff;
    box-shadow: 0 2px 12px rgba(100, 101, 102, .12);
    padding: 8px;
    .container{
        display: flex;
        align-items: center;
        margin-top: 4px;
        margin-bottom: 4px;
        .left-layout{
            flex: 1;
            display: flex;
            margin-right: 12px;
            overflow:hidden;
            position: relative;
            .tagIcon{
                margin-left: 8px;
                font-size: 18px; 
                color:var(--van-blue);
                padding:4px 0;
                margin-top: 3px;
            }
            .tagName{
                margin-left:12px;
               
                font-size: 16px; 
                color:var(--van-blue);
                border-bottom:2px solid var(--van-blue);
                padding:4px 0;
                white-space:nowrap;
            }
            &::before {
                content: " ";
                position: absolute;
                width: 16px;
                height: 100%;
                right:0;
                top: 0px;
                background-image: linear-gradient(90deg,rgba(255,255,255,0) 0%,#fff 100%);
            }
            
        }
        
        .right-layout{
            margin-right: 8px;
            :deep(.van-button){
                height: 36px;
            }
        }
    }
   
}

.tag-sidebar{
    width: auto;
    margin-right: 10px;
    overflow:hidden;//让栏目触摸可以滑动
    .childTag{
        overflow:hidden;
        transition: max-height 0.3s ease-out;

    }
    .childTag.expand{
        transition: max-height 0.3s ease-in;
    }
    :deep(.sidebar-item){
        position: relative;
        .tag-item{
            display:flex;
            .image-container{
                flex: 1;
                margin-right: 10px;
                position: relative;
                top: 4px;
                .van-image{
                    img{
                        border-radius:4px;
                    }
                }
            }
            .svg-container{
                flex: 1;
                margin-right: 10px;
                position: relative;
                top: 3px;
                svg {
                    fill: var(--van-gray-8);
                    transition: fill .3s;
                    width: 16px;
                    height: 16px;
                }
            }
            .name{
                line-height: 24px;
                font-size: 16px;
                color: var(--van-gray-8);
            }
            .childName{
                line-height: 24px;
                margin-left: 26px;
                font-size: 16px;
                color: var(--van-gray-8);
            }
        }

        .showTagArrow{
            padding-right: 20px;
        }
        .van-badge__wrapper{
            position: static;
        }
        .arrow{
            position: absolute;
            right: 0px;
            top: 0px;
            width: 100%;
            height: 100%;
            display: flex;
            justify-content: flex-end;
            align-items: flex-start;
            cursor:pointer;
            .arrow-icon{
                width: 26px;
                height: 52px;
                display: flex;
                align-items: center;
                justify-content: center;
                border-radius: 4px;
                color: var(--van-gray-7);
                transform: none;
                transition: transform 0.3s;
            }
        }
        
        .arrow.expand{
            .arrow-icon{
                 transition: transform 0.3s;
                transform: rotateZ(180deg);
            }
           
        }
        .allowRoleView{
            line-height: 28px;
            color: var(--van-gray-6);
            .space{
                margin-right: 6px;
            }
        }
    }

    
    :deep(.van-sidebar-item){
        padding: 15px 12px;
    }
    :deep(.van-sidebar-item--select){
        &:before{
            background-color: var(--van-blue);
        }
        
    }
}

.navTabModule{
    :deep(.van-tabs__nav){
        background: transparent;
    }
    :deep(.van-tab--shrink){
        padding-right: 12px; 
        padding-left: 12px; 
    }
    :deep(.van-tabs__line){
        background: var(--van-blue);
    }
    :deep(.van-tab--active) {
        color: var(--van-blue);
    }
}

.askListModule{
    margin: var(--van-cell-group-inset-padding) var(--van-cell-group-inset-padding) 58px var(--van-cell-group-inset-padding);
   
    .item{
        padding: 12px 12px 12px 12px;
        margin-bottom: 8px;
        border-radius: var(--van-border-radius-lg);
        background: #fff;
        position: relative;
        .top-container{
            display: flex;
            .left-layout{
                .avatarImg{
                    img {
                        width: 40px;
                        height: 40px;
                        border-radius:40px;
                        vertical-align: middle;
                    }
                }
            }
            .middle-layout{
                flex: 1;
                margin-left: 10px;
                margin-right: 10px;
                .userInfo{
                    display: flex; 
                    align-items: center;
                    flex-wrap: wrap;
                    .cancelAccount{
                        display: inline-block;
                        vertical-align: middle;
                        padding: 4px 4px;
                        font-size: 12px;
                        line-height: 12px;
                        -webkit-border-radius: 2px;
                        -moz-border-radius: 2px;
                        border-radius: 2px;
                        color: var(--van-gray-5);
                        background-color: var(--van-gray-1);
                        position: relative;
                        left: -5px;
                        margin-top: 2px;
                        margin-bottom: 2px;
                    }
                    .account{
                        color: var(--van-gray-7);
                        margin-right: 5px;
                        position: relative;
                        top: -2px;
                    }  
                    .userRoleName{
                        display: inline-block;
                        white-space:nowrap;
                        vertical-align: middle;
                        padding: 3px 4px;
                        margin-right: 5px;
                        margin-bottom: 5px;
                        font-size: 12px;
                        line-height: 12px;
                        -webkit-border-radius: 2px;
                        -moz-border-radius: 2px;
                        border-radius: 2px;
                        color:#e2b46e;
                        background-color:#f8e7c4;
                        position: relative;
                        top: 1px;
                    }
                    .staff{
                        display: inline-block;
                        white-space:nowrap;
                        vertical-align: middle;
                        padding: 3px 4px;
                        margin-right: 5px;
                        margin-bottom: 5px;
                        font-size: 12px;
                        line-height: 12px;
                        -webkit-border-radius: 2px;
                        -moz-border-radius: 2px;
                        border-radius: 2px;
                        color:#4CD263;
                        background-color:#cafcc7;
                        position: relative;
                        top: 1px;
                    }
                    .time{
                        width:100%;
                        color: var(--van-gray-6);
                        font-size: 12px;
                        margin-top: 3px;
                    }
                }
                
            }
            .right-layout{
                .topTag{
                    
                    .top{
                        margin-left:5px;
                        white-space:nowrap;
                        color:#fff;
                        background-color:#5aa4ff;
                        border-radius:4px;
                        padding:1px 5px;
                        font-size: 12px;
                    }
                }
                .solve{
                    .adoption{
                        margin-left:5px;
                        white-space:nowrap;
                        color:#fff;
                        background-color:#52c41a;
                        border-radius:4px;
                        padding:1px 5px;
                        font-size: 12px;
                    }	
                }
            }
        }
        .middle-container{
            margin-top: 10px;
            .cancelAccount{
                display: inline-block;
                vertical-align: middle;
                padding: 6px 6px;
                font-size: 14px;
                line-height: 14px;
                -webkit-border-radius: 2px;
                -moz-border-radius: 2px;
                border-radius: 2px;
                color: var(--van-gray-5);
                background-color: var(--van-gray-1);
                margin-bottom: 6px;
            }
            .topic-layout {
                font-size:0;/*父级元素设置font-size:0; 解决 display：inline-block两个元素之间的默认空格 */
                .title{
                    color: var(--van-gray-8);
                    font-size: 18px;
                    line-height: 32px;
                    word-wrap : break-word;word-break : break-all;
                }
                .vote{
                    font-size: 22px;
                    position:relative;
                    top:4px;
                    color: #52c41a;
                    margin-left: 3px;
                }
            }
            .summary{
                margin-top: 6px;
                a{
                    font-size: 15px;
                    line-height: 28px;
                    font-weight:normal;
                    text-decoration:none;
                    color: var(--van-gray-7);
                    word-wrap : break-word;word-break : break-all;
                }
            }
        }
        .middle-lower-container{
            display: flex;
            justify-content: flex-end;
            margin-top: 8px;
            .reward{
                background: #fcf3e6;
                border-radius:3px;
                padding: 2px 0px;
               .rewardInfo{
                    padding: 1px 5px;
                    color: #e2b46d;
                    font-size: 14px;
                    .symbol{
                        font-family:Arial;
                        font-weight:normal; 
                        vertical-align: middle; 
                        display:inline-block;
                        margin-left: 5px;
                        color: #cca558;
                        font-size: 13px;
                    }
                    .amount{
                        margin-left: 1px;
                        color: #cca558; 
                        margin-right: 5px;
                        font-weight: 600;
                        font-size: 16px;
                        position: relative;
                        top: 1px;
                    }
                    .point{
                        color: #cca558; 
                        margin-left: 3px;
                        margin-right: 5px;
                        font-weight: 600;
                        font-size: 16px;
                        position: relative;
                        top: 1px;
                    }
                }
            }
        }
        .bottom-container{
            margin-top: 15px;
            display: flex;
            .left-layout{
                flex: 1;
                margin-right: 10px;
                overflow:hidden;
                position: relative;
                .tagName-box{
                    display: flex;
                    overflow-x: auto;
                    .tagName{
                        background-color: var(--van-gray-1);
                        font-size: 14px;
                        line-height: 14px;
                        display: inline-block;
                        padding: 6px 6px 6px 6px;
                        -moz-border-radius: 2px;
                        -webkit-border-radius: 2px;
                        border-radius: 2px;
                        text-decoration: none;
                        color: var(--van-gray-6);
                        white-space:nowrap;
                        margin-right: 6px;
                    }
                    &::-webkit-scrollbar {
                        display: none;
                    }
                }
                &::before {
                    content: " ";
                    position: absolute;
                    width: 16px;
                    height: 100%;
                    right:0;
                    top: 0px;
                    background-image: linear-gradient(90deg,rgba(255,255,255,0) 0%,#fff 100%);
                }
                
            }
            .right-layout{
                color: var(--van-gray-6);
                font-size: 14px;
                margin-top: 3px;
                .statistics{
                    .icon{
                        position: relative;
                        top: 2px;
                    }
                    .commentTotal{
                        margin-left: 2px;
                        margin-right: 12px;
                    }
                    .viewTotal{
                        margin-left: 2px;
                    }
                }
                
            }
        }
    }
}
</style>