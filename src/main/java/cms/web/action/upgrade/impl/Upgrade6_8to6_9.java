package cms.web.action.upgrade.impl;

import java.util.Date;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import cms.bean.upgrade.UpgradeLog;
import cms.bean.upgrade.UpgradeSystem;
import cms.service.upgrade.UpgradeService;
import cms.utils.JsonUtils;
import cms.utils.SpringConfigTool;
import cms.web.action.upgrade.UpgradeManage;
/**
 * 6.8升级到6.9版本执行程序
 *
 */
public class Upgrade6_8to6_9 {
	private static final Logger logger = LogManager.getLogger(Upgrade6_8to6_9.class);
	
	
	/**
	 * 运行
	 * @param upgradeId 升级Id
	 */
    public static void run(String upgradeId){
    	UpgradeService upgradeService = (UpgradeService)SpringConfigTool.getContext().getBean("upgradeServiceBean");
    	UpgradeManage upgradeManage = (UpgradeManage)SpringConfigTool.getContext().getBean("upgradeManage");
    	
    	for(int i =0; i< 100; i++){
    		upgradeManage.taskRunMark_delete();
			upgradeManage.taskRunMark_add(1L);
    		UpgradeSystem upgradeSystem = upgradeService.findUpgradeSystemById(upgradeId);
    		if(upgradeSystem == null || upgradeSystem.getRunningStatus().equals(9999)){
    			break;
    		}
    		if(upgradeSystem.getRunningStatus()>=40 && upgradeSystem.getRunningStatus()<200){
    			
    		
    			insertSQL_forum(upgradeService);
				upgradeService.addLog(upgradeId, JsonUtils.toJSONString(new UpgradeLog(new Date(),"表forum插入SQL成功",1))+",");
				
				insertSQL_layout(upgradeService);
				upgradeService.addLog(upgradeId, JsonUtils.toJSONString(new UpgradeLog(new Date(),"表layout插入SQL成功",1))+",");
				
				updateSQL_systemsetting(upgradeService);
    			upgradeService.addLog(upgradeId, JsonUtils.toJSONString(new UpgradeLog(new Date(),"表systemsetting修改SQL成功",1))+",");
    			
    			//更改运行状态
				upgradeService.updateRunningStatus(upgradeId ,200,JsonUtils.toJSONString(new UpgradeLog(new Date(),"升级流程结束",1))+",");

    		}
    		
    		
    		if(upgradeSystem.getRunningStatus()>=200 && upgradeSystem.getRunningStatus()<9999){
    			//更改运行状态
				upgradeService.updateRunningStatus(upgradeId ,9999,JsonUtils.toJSONString(new UpgradeLog(new Date(),"升级完成",1))+",");

    		}
    		
    		
    		
    		
    	}
    	upgradeManage.taskRunMark_delete();
    }
    
    
    /**
   	 * 插入升级SQL
   	 * @param upgradeService
   	 */
    private static void insertSQL_forum(UpgradeService upgradeService){
       	String sql = "INSERT INTO `forum` (`id`,`dirName`,`displayType`,`formValue`,`forumChildType`,`forumType`,`invokeMethod`,`layoutFile`,`layoutId`,`layoutType`,`module`,`name`,`queryMode`,`referenceCode`) VALUES (NULL,'api','page','{\"topicEssence_id\":\"197193e6a23946daa78eea1647f4a760\",\"topicEssence_sort\":1,\"topicEssence_maxResult\":30,\"topicEssence_pageCount\":null}','话题精华列表','话题',1,NULL,'0a765767a02f4893b3a5e0b957a91755',4,'topicRelated_topicEssence_page_default','话题精华列表',0,'topicRelated_topicEssence_1');";
       	upgradeService.insertNativeSQL(sql);
       	
       	
       	
    }
   	
   /**
  	 * 插入升级SQL
  	 * @param upgradeService
  	 */
    private static void insertSQL_layout(UpgradeService upgradeService){
    	String sql = "INSERT INTO `layout` (`id`,`dirName`,`forumData`,`layoutFile`,`name`,`referenceCode`,`returnData`,`sort`,`type`,`accessRequireLogin`) VALUES ('0a765767a02f4893b3a5e0b957a91755','api',-1,NULL,'话题精华列表','queryTopicEssenceList',1,2900,4,b'0');";
        upgradeService.insertNativeSQL(sql);
    }  
    
    /**
	 * 修改systemsetting表字段
	 * @param upgradeService
	 */
    private static void updateSQL_systemsetting(UpgradeService upgradeService){
    	String updateSQL = "UPDATE systemsetting SET topicMaxVoteOptions=0,questionMaxVoteOptions=0;";
    	upgradeService.insertNativeSQL(updateSQL);
    }
    
}
