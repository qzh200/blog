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
            
            // 用于检查重复性
            Set<String> usernameSet = new HashSet<>();
            Set<String> nicknameSet = new HashSet<>();
            Set<String> emailSet = new HashSet<>();
            Set<String> mobileSet = new HashSet<>();
            
            // 验证数据有效性并检查重复项
            for (UserData userData : userDataList) {
                String username = userData.getUsername();
                String nickname = userData.getNickname();
                String email = userData.getEmail();
                String mobile = userData.getMobile();
                
                // 检查是否是重复行（基于用户名、邮箱、手机号的组合）
            boolean isRepeat = false;
            
            if (usernameSet.contains(username)) {
                isRepeat = true;
            } else if (StringUtils.isNotBlank(email) && emailSet.contains(email)) {
                isRepeat = true;
            } else if (StringUtils.isNotBlank(mobile) && mobileSet.contains(mobile)) {
                isRepeat = true;
            }
                
                if (isRepeat) {
                    repeatRows++;
                    continue;
                }
                
                // 执行详细验证
                Map<String, Object> validationResult = validateUserData(userData, 0);
                if (validationResult != null) {
                    invalidRows++;
                    continue;
                }
                
                // 通过所有验证，添加到有效集合中
                if (StringUtils.isNotBlank(username)) usernameSet.add(username);
                // 移除昵称添加到查重集合的逻辑
                if (StringUtils.isNotBlank(email)) emailSet.add(email);
                if (StringUtils.isNotBlank(mobile)) mobileSet.add(mobile);
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
                userData.setUsername(getCellValue(getCell(row, 0)));
                userData.setNickname(getCellValue(getCell(row, 1)));
                userData.setLevel(getCellValue(getCell(row, 2)));
                userData.setEmail(getCellValue(getCell(row, 3)));
                userData.setBalance(getCellValue(getCell(row, 4)));
                userData.setPoint(getCellValue(getCell(row, 5)));
                userData.setRemark(getCellValue(getCell(row, 6)));
                userData.setRole(getCellValue(getCell(row, 7)));
                userData.setMobile(getCellValue(getCell(row, 8)));
                
                // 只处理至少有用户名的行
                if (StringUtils.isNotBlank(userData.getUsername())) {
                    userDataList.add(userData);
                }
            }
        }
        
        return userDataList;
    }
    
    private Cell getCell(Row row, int cellIndex) {
        Cell cell = row.getCell(cellIndex);
        if (cell == null) {
            cell = row.createCell(cellIndex);
        }
        return cell;
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
        }
        
        // 验证昵称（必填）
        if (StringUtils.isBlank(userData.getNickname())) {
            error.put("nicknameError", "昵称不能为空");
            hasError = true;
        } else if (userData.getNickname().length() > 50) {
            error.put("nicknameError", "昵称不能超过50个字符");
            hasError = true;
        }
        
        // 验证等级（如果有）
        if (StringUtils.isNotBlank(userData.getLevel())) {
            try {
                int level = Integer.parseInt(userData.getLevel());
                if (level < 0) {
                    error.put("levelError", "等级不能为负数");
                    hasError = true;
                }
            } catch (NumberFormatException e) {
                error.put("levelError", "等级必须是数字");
                hasError = true;
            }
        }
        
        // 验证Email（如果有）
        if (StringUtils.isNotBlank(userData.getEmail())) {
            if (!Verification.isEmail(userData.getEmail())) {
                error.put("emailError", "邮箱格式不正确");
                hasError = true;
            } else {
                // 检查邮箱是否已存在
                // 使用findUserByAccount方法查询邮箱（假设邮箱作为账号存储）
                User existingUser = userService.findUserByAccount(userData.getEmail());
                if (existingUser != null) {
                    error.put("emailError", "邮箱已注册");
                    hasError = true;
                }
            }
        }
        
        // 验证预存款（如果有）
        if (StringUtils.isNotBlank(userData.getBalance())) {
            try {
                double balance = Double.parseDouble(userData.getBalance());
                if (balance < 0) {
                    error.put("balanceError", "预存款不能为负数");
                    hasError = true;
                }
            } catch (NumberFormatException e) {
                error.put("balanceError", "预存款必须是数字");
                hasError = true;
            }
        }
        
        // 验证积分（如果有）
        if (StringUtils.isNotBlank(userData.getPoint())) {
            try {
                long point = Long.parseLong(userData.getPoint());
                if (point < 0) {
                    error.put("pointError", "积分不能为负数");
                    hasError = true;
                }
            } catch (NumberFormatException e) {
                error.put("pointError", "积分必须是数字");
                hasError = true;
            }
        }
        
        // 验证备注（如果有）
        if (StringUtils.isNotBlank(userData.getRemark()) && userData.getRemark().length() > 200) {
            error.put("remarkError", "备注不能超过200个字符");
            hasError = true;
        }
        
        // 验证手机号（如果有）
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
            user.setNickname(userData.getNickname()); // 使用导入的昵称
            user.setMobile(userData.getMobile());
            
            // 设置Email
            if (StringUtils.isNotBlank(userData.getEmail())) {
                user.setEmail(userData.getEmail());
            }
            
            // 设置等级（默认0）
            int level = 0;
            if (StringUtils.isNotBlank(userData.getLevel())) {
                level = Integer.parseInt(userData.getLevel());
            }
            user.setUserVersion(level);
            
            // 设置积分（默认0）
            long point = 0L;
            if (StringUtils.isNotBlank(userData.getPoint())) {
                point = Long.parseLong(userData.getPoint());
            }
            user.setPoint(point);
            
            // 设置预存款（如果有需要的话，可以扩展User类添加此字段）
            // 这里假设User类有balance字段，如果没有，可能需要调整
            try {
                if (StringUtils.isNotBlank(userData.getBalance())) {
                    double balance = Double.parseDouble(userData.getBalance());
                    // 如果User类有balance字段，可以设置
                    // user.setBalance(balance);
                }
            } catch (Exception e) {
                // 忽略预存款设置错误，使用默认值0
            }
            
            // 设置备注（默认无）
            String remark = "无";
            if (StringUtils.isNotBlank(userData.getRemark())) {
                remark = userData.getRemark();
            }
            // 这里假设User类有remark字段，如果没有，可能需要调整
            // user.setRemark(remark);
            
            // 设置角色（需要根据实际系统的角色处理逻辑来实现）
            // 这里仅作示例，如果系统有专门的角色管理，需要调用相应的服务
            if (StringUtils.isNotBlank(userData.getRole())) {
                // 例如：roleService.assignRoleToUser(user.getId(), userData.getRole());
                // 但由于此时用户ID还未生成，可能需要在用户保存后处理角色分配
            }
            
            // 设置其他默认信息
            user.setType(10); // 10:本地账号密码用户
            user.setState(1); // 1:启用
            user.setRegistrationDate(new Date());
            user.setSecurityDigest(System.currentTimeMillis());
            
            // 生成盐值和密码（默认密码为123456）
            String defaultPassword = "1234567";
            String salt = UUIDUtil.getUUID32();
            user.setSalt(salt);
            user.setPassword(SHA.sha256Hex(SHA.sha256Hex(defaultPassword) + "[" + salt + "]"));
            
            // 设置默认的密码提示问题和答案
            user.setIssue("默认密码是1234567");
            user.setAnswer(SHA.sha256Hex(SHA.sha256Hex("1234567")));
            
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
        
        // 设置表头内容
        header.createCell(0).setCellValue("用户名（必填）");
        header.createCell(1).setCellValue("昵称（必填）");
        header.createCell(2).setCellValue("等级（不写默认0）");
        header.createCell(3).setCellValue("Email地址（不写默认空）");
        header.createCell(4).setCellValue("预存款（不写默认0）");
        header.createCell(5).setCellValue("积分（不写默认0）");
        header.createCell(6).setCellValue("备注（不写默认无）");
        header.createCell(7).setCellValue("角色（不写默认无）");
        header.createCell(8).setCellValue("手机号（选填）");
        
        // 应用表头样式
        for (int i = 0; i <= 8; i++) {
            header.getCell(i).setCellStyle(headerStyle);
        }
        
        // 设置列宽
        sheet.setColumnWidth(0, 20 * 256);  // 用户名
        sheet.setColumnWidth(1, 20 * 256);  // 昵称
        sheet.setColumnWidth(2, 15 * 256);  // 等级
        sheet.setColumnWidth(3, 30 * 256);  // Email
        sheet.setColumnWidth(4, 15 * 256);  // 预存款
        sheet.setColumnWidth(5, 15 * 256);  // 积分
        sheet.setColumnWidth(6, 30 * 256);  // 备注
        sheet.setColumnWidth(7, 20 * 256);  // 角色
        sheet.setColumnWidth(8, 20 * 256);  // 手机号
        
        // 创建示例数据行
        Row exampleRow = sheet.createRow(1);
        exampleRow.createCell(0).setCellValue("user123");
        exampleRow.createCell(1).setCellValue("测试用户");
        exampleRow.createCell(2).setCellValue("1");
        exampleRow.createCell(3).setCellValue("test@example.com");
        exampleRow.createCell(4).setCellValue("100.00");
        exampleRow.createCell(5).setCellValue("500");
        exampleRow.createCell(6).setCellValue("批量导入测试用户");
        exampleRow.createCell(7).setCellValue("普通用户");
        exampleRow.createCell(8).setCellValue("13800138000");
        
        // 设置响应头
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment; filename=user_template.xlsx");
        
        // 写入响应流
        workbook.write(response.getOutputStream());
        workbook.close();
    }
    
    // 内部类用于存储Excel中的用户数据
    private static class UserData {
        private String username;        // 用户名
        private String nickname;        // 昵称
        private String level;           // 等级
        private String email;           // Email地址
        private String balance;         // 预存款
        private String point;           // 积分
        private String remark;          // 备注
        private String role;            // 角色
        private String mobile;          // 手机号
        
        public String getUsername() {
            return username;
        }
        public void setUsername(String username) {
            this.username = username;
        }
        public String getNickname() {
            return nickname;
        }
        public void setNickname(String nickname) {
            this.nickname = nickname;
        }
        public String getLevel() {
            return level;
        }
        public void setLevel(String level) {
            this.level = level;
        }
        public String getEmail() {
            return email;
        }
        public void setEmail(String email) {
            this.email = email;
        }
        public String getBalance() {
            return balance;
        }
        public void setBalance(String balance) {
            this.balance = balance;
        }
        public String getPoint() {
            return point;
        }
        public void setPoint(String point) {
            this.point = point;
        }
        public String getRemark() {
            return remark;
        }
        public void setRemark(String remark) {
            this.remark = remark;
        }
        public String getRole() {
            return role;
        }
        public void setRole(String role) {
            this.role = role;
        }
        public String getMobile() {
            return mobile;
        }
        public void setMobile(String mobile) {
            this.mobile = mobile;
        }
    }
}