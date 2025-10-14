package cms.web.action.user;

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@RestController
@RequestMapping("/control/user/import")
public class UserImportController {

    @PostMapping("/upload")
    public String uploadExcel(@RequestParam("file") MultipartFile file) {
        try (Workbook workbook = new XSSFWorkbook(file.getInputStream())) {
            Sheet sheet = workbook.getSheetAt(0);
            // 解析逻辑
            return "成功导入" + (sheet.getLastRowNum()) + "条数据";
        } catch (IOException e) {
            return "导入失败：" + e.getMessage();
        }
    }

    @GetMapping("/template")
    public void downloadTemplate(HttpServletResponse response) throws IOException {
        Workbook workbook = new XSSFWorkbook();
        Sheet sheet = workbook.createSheet("用户模板");
        Row header = sheet.createRow(0);
        header.createCell(0).setCellValue("用户名");
        header.createCell(1).setCellValue("手机号");
        
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setHeader("Content-Disposition", "attachment; filename=user_template.xlsx");
        workbook.write(response.getOutputStream());
        workbook.close();
    }
}