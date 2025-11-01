package cms.web.action.filePackage;

import java.io.File;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.ConcurrentSkipListSet;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

import cms.bean.ZipPack;
import cms.utils.FileUtil;
import cms.utils.PathUtil;
import cms.utils.UUIDUtil;
import cms.utils.ZipUtil;

/**
 * 打包管理
 *
 */
@Component("filePackageManage")
public class FilePackageManage {
	
	@Value("${spring.datasource.url}")
	private String datasourceUrl;
	
	@Value("${spring.datasource.username}")
	private String datasourceUsername;
	
	@Value("${spring.datasource.password}")
	private String datasourcePassword;
	
	/**
	 * 文件打包
	 * @param compressList 要压缩的文件/目录列表
	 * @param exportDatabase 是否导出数据库
	 */
	@Async
	public void filePack(ConcurrentSkipListSet<String> compressList, boolean exportDatabase){
		SimpleDateFormat dateformat=new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
		
		//压缩文件名称
		String zipName = dateformat.format(new Date())+"_"+UUIDUtil.getUUID22()+".zip";
		
		System.out.println("========== 开始打包 ==========");
		System.out.println("选中的文件/目录数量: " + compressList.size());
		System.out.println("是否导出数据库: " + exportDatabase);
		
		// 根据参数决定是否导出数据库
		String exportDirName = null;
		if(exportDatabase) {
			System.out.println("开始导出数据库...");
			exportDirName = exportDatabase();
			System.out.println("数据库导出完成，目录名: " + exportDirName);
		} else {
			System.out.println("未勾选导出数据库，跳过数据库导出");
		}
		
		if(compressList.size() == 0) {
			// 如果没有选择文件，只打包数据库
			if(exportDirName != null && !exportDirName.isEmpty()) {
				System.out.println("----------");
				System.out.println("只打包数据库（没有选择文件）");
				
				List<ZipPack> zipPackList = new ArrayList<ZipPack>();
				String exportDirPath = PathUtil.defaultExternalDirectory() + File.separator + 
						"WEB-INF" + File.separator + "data" + File.separator + 
						"database_temp" + File.separator + exportDirName;
				File exportDir = new File(exportDirPath);
				
				System.out.println("数据库导出目录: " + exportDirPath);
				System.out.println("目录是否存在: " + exportDir.exists());
				System.out.println("是否为目录: " + exportDir.isDirectory());
				
				if(exportDir.exists() && exportDir.isDirectory()) {
					File[] files = exportDir.listFiles();
					System.out.println("目录中文件数量: " + (files != null ? files.length : 0));
					if(files != null) {
						for(File f : files) {
							System.out.println("  - " + f.getName() + " (" + f.length() + " 字节)");
						}
					}
					
					ZipPack dbZipPack = new ZipPack();
					dbZipPack.setSource(exportDirPath);
					dbZipPack.setEntryPath(new File(PathUtil.defaultExternalDirectory()).getName() + File.separator + "database" + File.separator);
					dbZipPack.setDirectory(true);
					zipPackList.add(dbZipPack);
					
					System.out.println("已添加到压缩列表，EntryPath: " + dbZipPack.getEntryPath());
					
					// 压缩文件
					String zipOutputPath = PathUtil.defaultExternalDirectory()+File.separator+"WEB-INF"+File.separator+"data"+ File.separator+"filePackage"+ File.separator+zipName;
					System.out.println("开始压缩，输出到: " + zipOutputPath);
					
					ZipUtil.pack(zipPackList, 
							zipOutputPath,
							PathUtil.defaultExternalDirectory()+File.separator+"WEB-INF"+File.separator+"data"+ File.separator+"filePackage"+ File.separator
							);
					
					System.out.println("压缩完成");
					
					// 删除临时目录
					System.out.println("删除临时目录: " + exportDirPath);
					deleteDirectory(exportDir);
				} else {
					System.out.println("警告：目录不存在或不是有效目录！");
				}
			}
			return;
		}
		
		if(compressList.size() ==1){//如果只有一个目录
			System.out.println("----------");
			System.out.println("打包单个目录");
			
			for(String id : compressList){
				if("|".equals(id)){//如果压缩根目录
					System.out.println("压缩根目录");
					//压缩文件
					ZipUtil.pack(PathUtil.defaultExternalDirectory()+File.separator, 
							PathUtil.defaultExternalDirectory()+File.separator+"WEB-INF"+File.separator+"data"+ File.separator+"filePackage"+ File.separator+zipName,
							PathUtil.defaultExternalDirectory()+File.separator+"WEB-INF"+File.separator+"data"+ File.separator+"filePackage"+ File.separator,
							new File(PathUtil.defaultExternalDirectory()).getName()
							);//第一个参数：待压缩目录  第二个参数：输出文件  第三个参数：排除目录 第四个参数：压缩内文件逻辑路径
				
				}else{
					List<ZipPack> zipPackList = new ArrayList<ZipPack>();
					
					
					String path = PathUtil.defaultExternalDirectory()+File.separator+FileUtil.toRelativePath(FileUtil.toSystemPath(id));
					File file = new File(PathUtil.defaultExternalDirectory()+File.separator+FileUtil.toRelativePath(FileUtil.toSystemPath(id)));
					System.out.println("待打包路径: " + path);
					 // 判断此文件是否是一个文件夹
	                if (file.isDirectory()) {	
	                	System.out.println("是目录");
	                	ZipPack zipPack = new ZipPack();
	                	zipPack.setSource(path);
	                	zipPack.setEntryPath(new File(PathUtil.defaultExternalDirectory()).getName()+ File.separator+FileUtil.toRelativePath(FileUtil.toSystemPath(id)));
	                	zipPack.setDirectory(true);
	                	zipPackList.add(zipPack);
	                }else{
	                	System.out.println("是文件");
	                	//删除文件名
	                	String _id = StringUtils.substringBeforeLast(id, "/");//从右往左截取到相等的字符
	                	if(id.length() == _id.length()){//如果没有目录，则删除文件名
	                		_id = "";
	                	}
	                	
	                	ZipPack zipPack = new ZipPack();
	                	zipPack.setSource(path);
	                	zipPack.setEntryPath(new File(PathUtil.defaultExternalDirectory()).getName()+ File.separator+(_id != null && !"".equals(_id) ? FileUtil.toRelativePath(FileUtil.toSystemPath(_id)) : ""));
	                	zipPack.setDirectory(false);
	                	zipPackList.add(zipPack);
	                }
	              
	              // 添加数据库备份目录到压缩包
	              if(exportDirName != null && !exportDirName.isEmpty()) {
	            	  System.out.println("添加数据库备份...");
	            	  String exportDirPath = PathUtil.defaultExternalDirectory() + File.separator + 
	            			  "WEB-INF" + File.separator + "data" + File.separator + 
	            			  "database_temp" + File.separator + exportDirName;
	            	  File exportDir = new File(exportDirPath);
	            	  
	            	  System.out.println("数据库目录: " + exportDirPath);
	            	  System.out.println("目录是否存在: " + exportDir.exists());
	            	  System.out.println("是否为目录: " + exportDir.isDirectory());
	            	  
	            	  if(exportDir.exists() && exportDir.isDirectory()) {
	            		  File[] files = exportDir.listFiles();
	            		  System.out.println("目录中文件数量: " + (files != null ? files.length : 0));
	            		  if(files != null) {
	            			  for(File f : files) {
	            				  System.out.println("  - " + f.getName() + " (" + f.length() + " 字节)");
	            			  }
	            		  }
	            		  
	            		  ZipPack dbZipPack = new ZipPack();
	            		  dbZipPack.setSource(exportDirPath);
	            		  dbZipPack.setEntryPath(new File(PathUtil.defaultExternalDirectory()).getName() + File.separator + "database" + File.separator);
	            		  dbZipPack.setDirectory(true);
	            		  zipPackList.add(dbZipPack);
	            		  System.out.println("已添加数据库目录到压缩列表");
	            	  } else {
	            		  System.out.println("警告：数据库目录不存在！");
	            	  }
	              }
	              
	              System.out.println("准备压缩，共 " + zipPackList.size() + " 个条目");
						
	              //压缩文件
					ZipUtil.pack(zipPackList, 
							PathUtil.defaultExternalDirectory()+File.separator+"WEB-INF"+File.separator+"data"+ File.separator+"filePackage"+ File.separator+zipName,
							PathUtil.defaultExternalDirectory()+File.separator+"WEB-INF"+File.separator+"data"+ File.separator+"filePackage"+ File.separator
							);//第一个参数：待压缩目录集合  第二个参数：输出文件  第三个参数：排除目录
					
					System.out.println("压缩完成");
							
					// 删除临时目录
					if(exportDirName != null && !exportDirName.isEmpty()) {
						String exportDirPath = PathUtil.defaultExternalDirectory() + File.separator + 
								"WEB-INF" + File.separator + "data" + File.separator + 
								"database_temp" + File.separator + exportDirName;
						File exportDir = new File(exportDirPath);
						if(exportDir.exists()) {
							System.out.println("删除临时目录: " + exportDirPath);
							deleteDirectory(exportDir);
						}
					}
				}
			}
		}
		
		
		if(compressList.size() >1){//如果有多个目录
			System.out.println("----------");
			System.out.println("打包多个目录");
			
			List<ZipPack> zipPackList = new ArrayList<ZipPack>();
			
			for(String id : compressList){
				String path = PathUtil.defaultExternalDirectory()+File.separator+FileUtil.toRelativePath(FileUtil.toSystemPath(id));
				File file = new File(PathUtil.defaultExternalDirectory()+File.separator+FileUtil.toRelativePath(FileUtil.toSystemPath(id)));
				 // 判断此文件是否是一个文件夹
                if (file.isDirectory()) {	
                	ZipPack zipPack = new ZipPack();
                	zipPack.setSource(path);
                	zipPack.setEntryPath(new File(PathUtil.defaultExternalDirectory()).getName()+ File.separator+FileUtil.toRelativePath(FileUtil.toSystemPath(id)));
                	zipPack.setDirectory(true);
                	zipPackList.add(zipPack);
                	System.out.println("添加目录: " + path);
                }else{
                	//删除文件名
                	String _id = StringUtils.substringBeforeLast(id, "/");//从右往左截取到相等的字符
                	if(id.length() == _id.length()){//如果没有目录，则删除文件名
                		_id = "";
                	}
                	
                	ZipPack zipPack = new ZipPack();
                	zipPack.setSource(path);
                	zipPack.setEntryPath(new File(PathUtil.defaultExternalDirectory()).getName()+ File.separator+(_id != null && !"".equals(_id) ? FileUtil.toRelativePath(FileUtil.toSystemPath(_id)) : ""));
                	zipPack.setDirectory(false);
                	zipPackList.add(zipPack);
                	System.out.println("添加文件: " + path);
                }
				
				
			}
			
			// 添加数据库备份目录到压缩包
			if(exportDirName != null && !exportDirName.isEmpty()) {
				System.out.println("添加数据库备份...");
				String exportDirPath = PathUtil.defaultExternalDirectory() + File.separator + 
						"WEB-INF" + File.separator + "data" + File.separator + 
						"database_temp" + File.separator + exportDirName;
				File exportDir = new File(exportDirPath);
				
				System.out.println("数据库目录: " + exportDirPath);
				System.out.println("目录是否存在: " + exportDir.exists());
				System.out.println("是否为目录: " + exportDir.isDirectory());
				
				if(exportDir.exists() && exportDir.isDirectory()) {
					File[] files = exportDir.listFiles();
					System.out.println("目录中文件数量: " + (files != null ? files.length : 0));
					if(files != null) {
						for(File f : files) {
							System.out.println("  - " + f.getName() + " (" + f.length() + " 字节)");
						}
					}
					
					ZipPack dbZipPack = new ZipPack();
					dbZipPack.setSource(exportDirPath);
					dbZipPack.setEntryPath(new File(PathUtil.defaultExternalDirectory()).getName() + File.separator + "database" + File.separator);
					dbZipPack.setDirectory(true);
					zipPackList.add(dbZipPack);
					System.out.println("已添加数据库目录到压缩列表");
				} else {
					System.out.println("警告：数据库目录不存在！");
				}
			}
			
			System.out.println("准备压缩，共 " + zipPackList.size() + " 个条目");
			
			//压缩文件
			ZipUtil.pack(zipPackList, 
					PathUtil.defaultExternalDirectory()+File.separator+"WEB-INF"+File.separator+"data"+ File.separator+"filePackage"+ File.separator+zipName,
					PathUtil.defaultExternalDirectory()+File.separator+"WEB-INF"+File.separator+"data"+ File.separator+"filePackage"+ File.separator
					);//第一个参数：待压缩目录集合  第二个参数：输出文件  第三个参数：排除目录
			
			System.out.println("压缩完成");
			
			// 删除临时目录
			if(exportDirName != null && !exportDirName.isEmpty()) {
				String exportDirPath = PathUtil.defaultExternalDirectory() + File.separator + 
						"WEB-INF" + File.separator + "data" + File.separator + 
						"database_temp" + File.separator + exportDirName;
				File exportDir = new File(exportDirPath);
				if(exportDir.exists()) {
					System.out.println("删除临时目录: " + exportDirPath);
					deleteDirectory(exportDir);
				}
			}
		}
	}
	
	/**
	 * 递归删除目录
	 */
	private void deleteDirectory(File directory) {
		if (directory.exists()) {
			File[] files = directory.listFiles();
			if (files != null) {
				for (File file : files) {
					if (file.isDirectory()) {
						deleteDirectory(file);
					} else {
						file.delete();
					}
				}
			}
			directory.delete();
		}
	}
	
	/**
	 * 导出数据库到CSV文件（每个表一个文件）
	 * @return 数据库导出目录名
	 */
	private String exportDatabase() {
		Connection conn = null;
		try {
			SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
			String exportDirName = "database_backup_" + dateformat.format(new Date());
			// 修改：将数据库导出到database_temp目录，避免被filePackage的excludeDirectory排除
			String exportDirPath = PathUtil.defaultExternalDirectory() + File.separator + 
								   "WEB-INF" + File.separator + "data" + File.separator + 
								   "database_temp" + File.separator + exportDirName;
			
			// 创建导出目录
			File exportDir = new File(exportDirPath);
			if(!exportDir.exists()) {
				exportDir.mkdirs();
			}
			
			// 建立数据库连接
			conn = DriverManager.getConnection(datasourceUrl, datasourceUsername, datasourcePassword);
			DatabaseMetaData metaData = conn.getMetaData();
			
			// 获取数据库名称
			String databaseName = conn.getCatalog();
			System.out.println("开始导出数据库: " + databaseName);
			
			// 获取所有表
			ResultSet tables = metaData.getTables(databaseName, null, "%", new String[]{"TABLE"});
			List<String> tableNames = new ArrayList<>();
			while (tables.next()) {
				String tableName = tables.getString("TABLE_NAME");
				tableNames.add(tableName);
			}
			tables.close();
			
			System.out.println("发现 " + tableNames.size() + " 个表");
			
			// 创建数据库信息文件
			createDatabaseInfoFile(exportDirPath, databaseName, tableNames.size());
			
			// 导出每个表到单独的CSV文件
			for (String tableName : tableNames) {
				System.out.println("正在导出表: " + tableName);
				exportTableToCSV(conn, exportDirPath, tableName);
			}
			
			System.out.println("数据库导出成功，共导出 " + tableNames.size() + " 个表");
			System.out.println("导出目录: " + exportDirPath);
			
			return exportDirName;
			
		} catch (Exception e) {
			System.err.println("导出数据库时出错: " + e.getMessage());
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (conn != null && !conn.isClosed()) {
					conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 创建数据库信息文件
	 */
	private void createDatabaseInfoFile(String exportDirPath, String databaseName, int tableCount) {
		PrintWriter writer = null;
		try {
			File infoFile = new File(exportDirPath + File.separator + "README.txt");
			writer = new PrintWriter(new FileWriter(infoFile, false), true);
			
			writer.println("===========================================");
			writer.println("        数据库备份信息");
			writer.println("===========================================");
			writer.println();
			writer.println("数据库名称: " + databaseName);
			writer.println("备份时间: " + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
			writer.println("表总数: " + tableCount);
			writer.println("格式: CSV (逗号分隔值)");
			writer.println();
			writer.println("说明:");
			writer.println("- 每个表对应一个 CSV 文件");
			writer.println("- 文件命名格式: 表名.csv");
			writer.println("- 第一行为列名");
			writer.println("- 数据使用逗号分隔");
			writer.println("- 字符串字段使用双引号包围");
			writer.println();
			writer.println("===========================================");
			
		} catch (Exception e) {
			System.err.println("创建数据库信息文件失败: " + e.getMessage());
		} finally {
			if (writer != null) {
				writer.close();
			}
		}
	}
	
	/**
	 * 导出单个表到CSV文件
	 */
	private void exportTableToCSV(Connection conn, String exportDirPath, String tableName) {
		Statement stmt = null;
		ResultSet rs = null;
		PrintWriter writer = null;
		
		try {
			// 创建CSV文件
			File csvFile = new File(exportDirPath + File.separator + tableName + ".csv");
			writer = new PrintWriter(new FileWriter(csvFile, false), true);
			
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT * FROM `" + tableName + "`");
			ResultSetMetaData metaData = rs.getMetaData();
			int columnCount = metaData.getColumnCount();
			
			// 写入表头（列名）
			StringBuilder header = new StringBuilder();
			for (int i = 1; i <= columnCount; i++) {
				if (i > 1) {
					header.append(",");
				}
				header.append("\"").append(metaData.getColumnName(i)).append("\"");
			}
			writer.println(header.toString());
			
			// 写入数据行
			int rowCount = 0;
			while (rs.next()) {
				StringBuilder row = new StringBuilder();
				for (int i = 1; i <= columnCount; i++) {
					if (i > 1) {
						row.append(",");
					}
					
					Object value = rs.getObject(i);
					if (value == null) {
						row.append("NULL");
					} else if (value instanceof Number) {
						row.append(value);
					} else {
						// 字符串和其他类型用双引号包围，并转义内部的双引号
						String strValue = value.toString()
								.replace("\"", "\"\"")  // CSV 标准：双引号转义为两个双引号
								.replace("\n", "\\n")    // 换行符转义
								.replace("\r", "\\r");   // 回车符转义
						row.append("\"").append(strValue).append("\"");
					}
				}
				writer.println(row.toString());
				rowCount++;
			}
			
			//System.out.println("  表 " + tableName + " 导出完成，共 " + rowCount + " 行数据");
			
		} catch (Exception e) {
			System.err.println("导出表 " + tableName + " 失败: " + e.getMessage());
			e.printStackTrace();
		} finally {
			try {
				if (writer != null) writer.close();
				if (rs != null) rs.close();
				if (stmt != null) stmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
