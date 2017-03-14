package digitalCanteenSSM.serviceImpl;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import digitalCanteenSSM.po.DishItems;
import digitalCanteenSSM.service.DishExportToExcelService;

@Service
public class DishExportToExcelServiceImpl implements DishExportToExcelService{

	@Override
	public void writeExcel(List<DishItems> dishItemsList,HttpServletResponse res) throws IOException, ParseException {
		// TODO Auto-generated method stub
		// 1.创建一个workbook，对应一个Excel文件
        HSSFWorkbook workBook = new HSSFWorkbook();
        // 2.在workbook中添加一个sheet，对应Excel中的一个sheet
        HSSFSheet sheet = workBook.createSheet("菜品表");
        // 3.在sheet中添加表头第0行，老版本poi对excel行数列数有限制short
        HSSFRow row = sheet.createRow((int) 0);
        // 4.创建单元格，设置值表头，设置表头居中
        HSSFCellStyle style = workBook.createCellStyle();
        // 居中格式
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
        //设置日期格式
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        short df=workBook.createDataFormat().getFormat("yyyy-mm-dd hh:mm"); 
        style.setDataFormat(df); 
        // 设置表头
        HSSFCell cell = row.createCell(0);
        cell.setCellValue("校区名称");
        cell.setCellStyle(style);
        
        cell = row.createCell(1);
        cell.setCellValue("食堂名称");
        cell.setCellStyle(style);
        
        cell = row.createCell(2);
        cell.setCellValue("档口名称");
        cell.setCellStyle(style);
        
        cell = row.createCell(3);
        cell.setCellValue("菜品类型");
        cell.setCellStyle(style);
        
        cell = row.createCell(4);
        cell.setCellValue("菜品名称");
        cell.setCellStyle(style);
        
        cell = row.createCell(5);
        cell.setCellValue("菜品图片");
        cell.setCellStyle(style);
        
        cell = row.createCell(6);
        cell.setCellValue("菜品价格");
        cell.setCellStyle(style);
        
        cell = row.createCell(7);
        cell.setCellValue("菜品销售时间");
        cell.setCellStyle(style);
        
        cell = row.createCell(8);
        cell.setCellValue("菜品销售状态");
        cell.setCellStyle(style);
        
        cell = row.createCell(9);
        cell.setCellValue("菜品录入日期");
        cell.setCellStyle(style);
        
        cell = row.createCell(10);
        cell.setCellValue("菜品录入状态");
        cell.setCellStyle(style);
        
        cell = row.createCell(11);
        cell.setCellValue("菜品推荐");
        cell.setCellStyle(style);
        
        cell = row.createCell(12);
        cell.setCellValue("菜品留样");
        cell.setCellStyle(style);
        
        cell = row.createCell(13);
        cell.setCellValue("菜品合格");
        cell.setCellStyle(style);
		// 循环将数据写入Excel
        for (int i = 0; i < dishItemsList.size(); i++) {
            row = sheet.createRow((int) i + 1);
            DishItems dishItems= (DishItems)dishItemsList.get(i);
            // 创建单元格，设置值
            row.createCell(0).setCellValue(dishItems.getCampusName());
            row.createCell(1).setCellValue(dishItems.getCantName());
            row.createCell(2).setCellValue(dishItems.getWndName());
            row.createCell(3).setCellValue(dishItems.getDishTypeName());
            row.createCell(4).setCellValue(dishItems.getDishName());
            row.createCell(5).setCellValue(dishItems.getDishPhoto());
            row.createCell(6).setCellValue(dishItems.getDishPrice());
            row.createCell(7).setCellValue(dishItems.getDishDate());
            row.createCell(8).setCellValue(dishItems.getDishSale());
            row.createCell(9).setCellValue(formatter.format(dishItems.getDishInDate()));
            row.createCell(10).setCellValue(dishItems.getDishInState());
            row.createCell(11).setCellValue(dishItems.getDishRecmd());
            row.createCell(12).setCellValue(dishItems.getDishKeep());
            row.createCell(13).setCellValue(dishItems.getDishQuality());
        }
        
        String fileName = "菜品表";
        ByteArrayOutputStream os = new ByteArrayOutputStream();
        workBook.write(os);
        byte[] content = os.toByteArray();
        InputStream is = new ByteArrayInputStream(content);
        // 设置response参数，可以打开下载页面
        res.reset();
        res.setContentType("application/vnd.ms-excel;charset=utf-8");
        res.setHeader("Content-Disposition", "attachment;filename="
                + new String((fileName + ".xls").getBytes(), "iso-8859-1"));
        ServletOutputStream out = res.getOutputStream();
        BufferedInputStream bis = null;
        BufferedOutputStream bos = null;

        try {
            bis = new BufferedInputStream(is);
            bos = new BufferedOutputStream(out);
            byte[] buff = new byte[2048];
            int bytesRead;
            // Simple read/write loop.
            while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
                bos.write(buff, 0, bytesRead);
            }
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        } finally {
            if (bis != null)
                bis.close();
            if (bos != null)
                bos.close();
        }
	}


}
