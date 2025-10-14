package cms.web.action.user;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.*;

import cms.bean.user.User;
import cms.service.user.UserService;
import cms.utils.SHA;
import cms.utils.UUIDUtil;
import cms.utils.Verification;
import org.apache.commons.lang3.StringUtils;

@RestController
@RequestMapping("/control/user/import")
public class UserImportController {

    @Autowired
    private UserService userService;
    
    @Autowired
    private UserManage userManage;

    @PostMapping("/verify")
    public String verifyExcel(@RequestParam("file") MultipartFile file) {
        // 初始化验证结果对象
        Map<String, Object> result = new HashMap<>();
        result.put("success", false);
        result.put("totalRows", 0);
        result.put("validRows", 0);
        result.put("invalidRows", 0);
        result.put("repeatRows", 0);
        
        try {
            // 验证文件
            if (file == null || file.isEmpty()) {
                result.put("message", "文件不能为空");
                return JSON.toJSONString(result);
            }
            
            String fileName = file.getOriginalFilename();
            if (!fileName.endsWith(".xlsx") && !fileName.endsWith(".xls")) {
                result.put("message", "请上传Excel格式的文件");
                return JSON.toJSONString(result);
            }
            
            // 解析Excel文件
            List<UserData> userDataList = parseExcelFile(file.getInputStream());
            result.put("totalRows", userDataList.size());
            
            // 验证数据有效性
            int validRows = 0;
            int invalidRows = 0;
            int repeatRows = 0;
            
            // 用于检查用户名和手机号的重复性
            Set<String> usernameSet = new HashSet<>();
            Set<String> mobileSet = new HashSet<>();
            
            // 验证数据有效性并检查重复项
            for (UserData userData : userDataList) {
                String username = userData.getUsername();
                String mobile = userData.getMobile();
                
                // 检查是否是重复行
                boolean isRepeat = false;
                
                if (usernameSet.contains(username)) {
                    isRepeat = true;
                } else if (!mobile.isEmpty() && mobileSet.contains(mobile)) {
                    isRepeat = true;
                }
                
                if (isRepeat) {
                    repeatRows++;
                    continue;
                }
                
                // 验证用户名
                if (StringUtils.isBlank(username) || !Verification.isNumericLettersUnderscore(username) || 
                    username.length() > 30) {
                    invalidRows++;
                    continue;
                }
                
                // 验证手机号（如果有）
                if (!mobile.isEmpty() && (!Verification.isPositiveInteger(StringUtils.removeStart(mobile, "+")) || 
                    mobile.length() > 18)) {
                    invalidRows++;
                    continue;
                }
                
                // 检查系统中是否已存在相同用户名或手机号
                if (userService.findUserByUserName(username) != null || 
                    userService.findUserByAccount(username) != null || 
                    userService.findUserByNickname(username) != null) {
                    invalidRows++;
                    continue;
                }
                
                if (!mobile.isEmpty()) {
                    String platformUserId = userManage.thirdPartyUserIdToPlatformUserId(mobile, 20);
                    User existingUser = userService.findUserByPlatformUserId(platformUserId);
                    if (existingUser != null) {
                        invalidRows++;
                        continue;
                    }
                }
                
                // 通过所有验证，添加到有效集合中
                usernameSet.add(username);
                mobileSet.add(mobile);
                validRows++;
            }
            
            result.put("validRows", validRows);
            result.put("invalidRows", invalidRows);
            result.put("repeatRows", repeatRows);
            result.put("success", true);
            result.put("message", "验证完成");
            
        } catch (Exception e) {
            result.put("message", "验证失败: " + e.getMessage());
        }
        
        return JSON.toJSONString(result);
    }

    @PostMapping("/upload")
    public String uploadExcel(@RequestParam("file") MultipartFile file) {
        // 初始化导入结果对象
        Map<String, Object> result = new HashMap<>();
        result.put("success", false);
        result.put("totalCount", 0);
        result.put("successCount", 0);
        result.put("failedCount", 0);
        result.put("errors", new ArrayList<Map<String, Object>>());
        
        try {
            // 验证文件
            if (file == null || file.isEmpty()) {
                result.put("message", "文件不能为空");
                return JSON.toJSONString(result);
            }
            
            String fileName = file.getOriginalFilename();
            if (!fileName.endsWith(".xlsx") && !fileName.endsWith(".xls")) {
                result.put("message", "请上传Excel格式的文件");
                return JSON.toJSONString(result);
            }
            
            // 解析Excel文件
            List<UserData> userDataList = parseExcelFile(file.getInputStream());
            result.put("totalCount", userDataList.size());
            
            // 验证数据并导入
            int successCount = 0;
            List<Map<String, Object>> errors = new ArrayList<>();
            
            for (int i = 0; i < userDataList.size(); i++) {
                UserData userData = userDataList.get(i);
                Map<String, Object> error = validateUserData(userData, i + 2); // 行号从2开始
                
                if (error != null) {
                    errors.add(error);
                } else {
                    // 验证通过，创建用户
                    User user = createUserFromData(userData);
                    if (user != null) {
                        try {
                            userService.saveUser(user, null, null);
                            successCount++;
                        } catch (Exception e) {
                            Map<String, Object> saveError = new HashMap<>();
                            saveError.put("row", i + 2);
                            saveError.put("username", userData.getUsername());
                            saveError.put("message", "保存失败: " + e.getMessage());
                            errors.add(saveError);
                        }
                    }
                }
            }
            
            result.put("successCount", successCount);
            result.put("failedCount", errors.size());
            result.put("errors", errors);
            result.put("success", true);
            result.put("message", "导入完成");
            
        } catch (Exception e) {
            result.put("message", "导入失败: " + e.getMessage());
        }
        
        return JSON.toJSONString(result);
    }
    
    private List<UserData> parseExcelFile(InputStream inputStream) throws IOException {
        List<UserData> userDataList = new ArrayList<>();
        
        try (Workbook workbook = new XSSFWorkbook(inputStream)) {
            Sheet sheet = workbook.getSheetAt(0);
            
            // 跳过表头行（第0行）
            for (int rowNum = 1; rowNum <= sheet.getLastRowNum(); rowNum++) {
                Row row = sheet.getRow(rowNum);
                if (row == null) continue;
                
                UserData userData = new UserData();
                
                // 获取单元格数据
                Cell usernameCell = row.getCell(0);
                Cell mobileCell = row.getCell(1);
                
                userData.setUsername(getCellValue(usernameCell));
                userData.setMobile(getCellValue(mobileCell));
                
                // 只处理至少有用户名的行
                if (StringUtils.isNotBlank(userData.getUsername())) {
                    userDataList.add(userData);
                }
            }
        }
        
        return userDataList;
    }
    
    private String getCellValue(Cell cell) {
        if (cell == null) return "";
        
        // 确保单元格被视为字符串类型，特别是对于用户名列
        try {
            // 使用Apache POI 4.0+的方式设置单元格类型
            if (cell.getCellType() != CellType.STRING) {
                cell.setCellType(CellType.STRING);
            }
        } catch (Exception e) {
            // 如果设置单元格类型失败，尝试其他方式获取值
            switch (cell.getCellType()) {
                case STRING:
                    return cell.getStringCellValue().trim();
                case NUMERIC:
                    // 对于数字，保留原始格式，不进行类型转换
                    // 特别是对于手机号等应该作为字符串处理的数据
                    return cell.toString().trim();
                case BOOLEAN:
                    return String.valueOf(cell.getBooleanCellValue());
                default:
                    return "";
            }
        }
        
        return cell.getStringCellValue().trim();
    }
    
    private Map<String, Object> validateUserData(UserData userData, int rowNum) {
        Map<String, Object> error = new HashMap<>();
        boolean hasError = false;
        
        // 验证用户名
        if (StringUtils.isBlank(userData.getUsername())) {
            error.put("usernameError", "用户名不能为空");
            hasError = true;
        } else if (userData.getUsername().length() > 30) {
            error.put("usernameError", "用户名不能超过30个字符");
            hasError = true;
        } else if (!Verification.isNumericLettersUnderscore(userData.getUsername())) {
            error.put("usernameError", "用户名只能由数字、字母或下划线组成");
            hasError = true;
        } else {
            // 检查用户名是否已存在
            User existingUser = userService.findUserByUserName(userData.getUsername());
            if (existingUser != null) {
                error.put("usernameError", "用户名已存在");
                hasError = true;
            }
            
            // 检查账号是否已存在
            existingUser = userService.findUserByAccount(userData.getUsername());
            if (existingUser != null) {
                error.put("usernameError", "账号已存在");
                hasError = true;
            }
            
            // 检查昵称是否已存在
            existingUser = userService.findUserByNickname(userData.getUsername());
            if (existingUser != null) {
                error.put("usernameError", "该用户名不能和其他用户昵称相同");
                hasError = true;
            }
        }
        
        // 验证手机号
        if (StringUtils.isNotBlank(userData.getMobile())) {
            if (userData.getMobile().length() > 18) {
                error.put("mobileError", "手机号超长");
                hasError = true;
            } else if (!Verification.isPositiveInteger(StringUtils.removeStart(userData.getMobile(), "+"))) {
                error.put("mobileError", "手机号格式不正确");
                hasError = true;
            } else {
                // 检查手机号是否已存在
                String platformUserId = userManage.thirdPartyUserIdToPlatformUserId(userData.getMobile(), 20);
                User existingUser = userService.findUserByPlatformUserId(platformUserId);
                if (existingUser != null) {
                    error.put("mobileError", "手机号已注册");
                    hasError = true;
                }
            }
        }
        
        if (hasError) {
            error.put("row", rowNum);
            error.put("username", userData.getUsername());
            return error;
        }
        
        return null; // 没有错误
    }
    
    private User createUserFromData(UserData userData) {
        try {
            User user = new User();
            
            // 设置基本信息
            user.setUserName(userData.getUsername());
            user.setAccount(userData.getUsername());
            user.setNickname(userData.getUsername());
            user.setMobile(userData.getMobile());
            user.setType(10); // 10:本地账号密码用户
            user.setState(1); // 1:启用
            user.setRegistrationDate(new Date());
            user.setUserVersion(0);
            user.setPoint(0L);
            user.setSecurityDigest(System.currentTimeMillis());
            
            // 生成盐值和密码（默认密码为123456）
            String defaultPassword = "123456";
            String salt = UUIDUtil.getUUID32();
            user.setSalt(salt);
            user.setPassword(SHA.sha256Hex(SHA.sha256Hex(defaultPassword) + "[" + salt + "]"));
            
            // 设置默认的密码提示问题和答案
            user.setIssue("默认密码提示问题");
            user.setAnswer(SHA.sha256Hex(SHA.sha256Hex("默认答案")));
            
            // 设置平台用户ID
            user.setPlatformUserId(userData.getUsername());
            
            return user;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @GetMapping("/template")
    public void downloadTemplate(HttpServletResponse response) throws IOException {
        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("用户模板");
        
        // 创建表头样式
        CellStyle headerStyle = workbook.createCellStyle();
        Font font = workbook.createFont();
        font.setBold(true);
        headerStyle.setFont(font);
        
        // 创建表头
        Row header = sheet.createRow(0);
        Cell usernameHeader = header.createCell(0);
        usernameHeader.setCellValue("用户名");
        usernameHeader.setCellStyle(headerStyle);
        
        Cell mobileHeader = header.createCell(1);
        mobileHeader.setCellValue("手机号（选填）");
        mobileHeader.setCellStyle(headerStyle);
        
        // 设置列宽
        sheet.setColumnWidth(0, 20 * 256);
        sheet.setColumnWidth(1, 20 * 256);
        
        // 设置响应头
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment; filename=user_template.xlsx");
        
        // 写入响应流
        workbook.write(response.getOutputStream());
        workbook.close();
    }
    
    // 内部类用于存储Excel中的用户数据
    private static class UserData {
        private String username;
        private String mobile;
        
        public String getUsername() {
            return username;
        }
        public void setUsername(String username) {
            this.username = username;
        }
        public String getMobile() {
            return mobile;
        }
        public void setMobile(String mobile) {
            this.mobile = mobile;
        }
    }
}