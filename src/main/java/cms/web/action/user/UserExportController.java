package cms.web.action.user;

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

import cms.bean.user.User;
import cms.service.user.UserService;
import cms.bean.QueryResult;
import cms.utils.UUIDUtil;

@RestController
@RequestMapping("/control/user/export")
public class UserExportController {

    @Autowired
    private UserService userService;

    @GetMapping
    public void exportExcel(HttpServletResponse response, @RequestParam(required = false) Boolean visible, 
                           @RequestParam(required = false) String userIds) throws IOException {
        // 创建工作簿
        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("用户数据");
        
        // 创建表头样式
        CellStyle headerStyle = workbook.createCellStyle();
        Font font = workbook.createFont();
        font.setBold(true);
        headerStyle.setFont(font);
        
        // 创建数据样式
        CellStyle dataStyle = workbook.createCellStyle();
        
        // 创建表头
        Row header = sheet.createRow(0);
        String[] headers = {"用户名", "账号", "昵称", "手机号", "邮箱", "注册日期", "积分", "状态", "类型", "等级"};
        for (int i = 0; i < headers.length; i++) {
            Cell cell = header.createCell(i);
            cell.setCellValue(headers[i]);
            cell.setCellStyle(headerStyle);
            sheet.setColumnWidth(i, 20 * 256);
        }
        
        List<User> userList = new ArrayList<>();
        
        // 检查是否有提供userIds参数
        if (userIds != null && !userIds.isEmpty()) {
            // 只导出选中的用户
            String[] ids = userIds.split(",");
            for (String id : ids) {
                try {
                    Long userId = Long.parseLong(id);
                    User user = userService.findUserById(userId);
                    if (user != null) {
                        userList.add(user);
                    }
                } catch (NumberFormatException e) {
                    // 忽略格式不正确的ID
                    continue;
                }
            }
        } else {
            // 查询所有符合条件的用户
            List<Object> paramValue = new ArrayList<>();
            String param = "";
            
            if(visible != null && visible == false){//回收站
                param = " o.state>? ";
                paramValue.add(2);
            }else{//正常页面
                param = " o.state<=? ";
                paramValue.add(2);
            }
            
            // 查询所有符合条件的用户（不设置分页）
            userList = getAllUsersByCondition(param, paramValue);
        }
        
        // 填充数据
        if (userList != null && !userList.isEmpty()) {
            for (int i = 0; i < userList.size(); i++) {
                User user = userList.get(i);
                Row row = sheet.createRow(i + 1);
                
                // 填充各列数据
                row.createCell(0).setCellValue(user.getUserName() != null ? user.getUserName() : "");
                row.createCell(1).setCellValue(user.getAccount() != null ? user.getAccount() : "");
                row.createCell(2).setCellValue(user.getNickname() != null ? user.getNickname() : "");
                row.createCell(3).setCellValue(user.getMobile() != null ? user.getMobile() : "");
                row.createCell(4).setCellValue(user.getEmail() != null ? user.getEmail() : "");
                
                // 格式化注册日期
                if (user.getRegistrationDate() != null) {
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                    row.createCell(5).setCellValue(sdf.format(user.getRegistrationDate()));
                } else {
                    row.createCell(5).setCellValue("");
                }
                
                // 积分
                row.createCell(6).setCellValue(user.getPoint() != null ? user.getPoint() : 0);
                
                // 状态描述
                String stateDesc = getUserStateDesc(user.getState());
                row.createCell(7).setCellValue(stateDesc);
                
                // 用户类型描述
                String typeDesc = getUserTypeDesc(user.getType());
                row.createCell(8).setCellValue(typeDesc);
                
                // 等级名称
                row.createCell(9).setCellValue(user.getGradeName() != null ? user.getGradeName() : "");
            }
        }
        
        // 设置响应头
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        String fileName = "用户数据_" + UUIDUtil.getUUID32().substring(0, 8) + ".xlsx";
        response.setHeader("Content-Disposition", "attachment; filename=" + fileName);
        
        // 写入响应流
        workbook.write(response.getOutputStream());
        workbook.close();
    }
    
    /**
     * 获取所有符合条件的用户数据
     * 由于没有直接的获取所有用户的方法，这里分批获取
     */
    private List<User> getAllUsersByCondition(String param, List<Object> paramValue) {
        List<User> allUsers = new ArrayList<>();
        int batchSize = 1000; // 每批获取1000条
        int firstIndex = 0;
        
        while (true) {
            // 使用现有的findUserByCondition方法，但每次获取一定数量
            QueryResult<User> qr = userService.findUserByCondition(param, paramValue, firstIndex, batchSize, false);
            List<User> batchUsers = qr.getResultlist();
            
            if (batchUsers == null || batchUsers.isEmpty()) {
                break; // 没有更多数据了
            }
            
            allUsers.addAll(batchUsers);
            firstIndex += batchSize;
            
            // 如果获取的数量少于batchSize，说明已经是最后一批
            if (batchUsers.size() < batchSize) {
                break;
            }
        }
        
        return allUsers;
    }
    
    /**
     * 获取用户状态描述
     */
    private String getUserStateDesc(Integer state) {
        if (state == null) {
            return "未知";
        }
        switch (state) {
            case 1: return "启用";
            case 2: return "禁用";
            case 11: return "逻辑删除-启用";
            case 12: return "逻辑删除-禁用";
            default: return "未知状态(" + state + ")";
        }
    }
    
    /**
     * 获取用户类型描述
     */
    private String getUserTypeDesc(Integer type) {
        if (type == null) {
            return "未知";
        }
        switch (type) {
            case 10: return "账号密码用户";
            case 20: return "手机号注册";
            case 30: return "微信";
            case 40: return "QQ";
            case 50: return "微博";
            default: return "其他类型(" + type + ")";
        }
    }
}