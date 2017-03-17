package digitalCanteenSSM.service;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import digitalCanteenSSM.po.RecordItems;

public interface DishExportToExcelService {

	public void writeExcel(List<RecordItems> recordItemsList,HttpServletResponse res)
			throws IOException, ParseException;
}
