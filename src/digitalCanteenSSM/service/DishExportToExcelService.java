package digitalCanteenSSM.service;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import digitalCanteenSSM.po.DishItems;

public interface DishExportToExcelService {

	public void writeExcel(List<DishItems> dishItemsList, HttpServletResponse res)
			throws IOException, ParseException;
}
