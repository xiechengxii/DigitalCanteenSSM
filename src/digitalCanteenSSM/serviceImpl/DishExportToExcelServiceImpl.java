package digitalCanteenSSM.serviceImpl;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Service;

import digitalCanteenSSM.po.CanteenItems;
import digitalCanteenSSM.po.RecordItems;
import digitalCanteenSSM.service.DishExportToExcelService;

@Service
public class DishExportToExcelServiceImpl implements DishExportToExcelService{

	@Override
	public void writeExcel(List<RecordItems> recordItemsList,List<CanteenItems> canteenList,HttpServletResponse res, String timeInFileName) throws IOException, ParseException {
		// TODO Auto-generated method stub
		// 1.创建一个workbook，对应一个Excel文件
        HSSFWorkbook workBook = new HSSFWorkbook();
        //设置日期格式
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String fileName = new String();
        //按食堂分sheet导出记录
        for(CanteenItems canteenItems:canteenList){
        	//设置每写入新的食堂表的表头行
        	int j = 0;
        	if(canteenList.size() > 1){
        		fileName = canteenItems.getCampusName()+"校区"+timeInFileName+"菜品记录";
        	}else{
        		fileName = canteenItems.getCantName()+"食堂"+timeInFileName+"菜品记录";
        	}
        	
        	// 2.在workbook中添加一个sheet，对应Excel中的一个sheet
            HSSFSheet sheet = workBook.createSheet(canteenItems.getCantName()+"记录表");
            // 3.在sheet中添加表头第0行，老版本poi对excel行数列数有限制short
            HSSFRow row = sheet.createRow((int) 0);
            // 4.创建单元格，设置值表头，设置表头居中
            HSSFCellStyle style = workBook.createCellStyle();
            // 居中格式
            style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
            // 设置表头
            HSSFCell cell = row.createCell(0);
            cell.setCellValue("食堂名称");
            cell.setCellStyle(style);
            
            cell = row.createCell(1);
            cell.setCellValue("记录日期");
            cell.setCellStyle(style);
            
            cell = row.createCell(2);
            cell.setCellValue("操作人");
            cell.setCellStyle(style);
            
            cell = row.createCell(3);
            cell.setCellValue("菜品名");
            cell.setCellStyle(style);
            
            cell = row.createCell(4);
            cell.setCellValue("菜品时间档");
            cell.setCellStyle(style);
            
            cell = row.createCell(5);
            cell.setCellValue("是否留样");
            cell.setCellStyle(style);
            
    		// 循环将数据写入Excel
            for (int i = 0; i < recordItemsList.size(); i++) {
            	RecordItems recordItems= (RecordItems)recordItemsList.get(i);
            	if(recordItems.getRecordCantID() == canteenItems.getCantID()){
            		// 创建单元格，设置值
            		row = sheet.createRow((int) j + 1);  
            		j++;
                    row.createCell(0).setCellValue(recordItems.getRecordCantName());
                    row.createCell(1).setCellValue(formatter.format(recordItems.getRecordDate()));
                    row.createCell(2).setCellValue(recordItems.getRecordMUserName());
                    row.createCell(3).setCellValue(recordItems.getDetailDishName());
                    row.createCell(4).setCellValue(recordItems.getDetailDishDate());
                    row.createCell(5).setCellValue(recordItems.getDetailDishKeep());
            	}
            }
        }       
        
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
