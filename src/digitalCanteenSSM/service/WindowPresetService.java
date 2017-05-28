package digitalCanteenSSM.service;

import java.util.List;

import digitalCanteenSSM.po.Window;
import digitalCanteenSSM.po.WindowItems;

public interface WindowPresetService {

	public List<WindowItems> findAllWindows() throws Exception;

	public WindowItems findWindowById(Integer wndID) throws Exception;
	
	public WindowItems findWindowByName(WindowItems windowItems) throws Exception;
	
	public List<WindowItems> findWindowsInCanteen(Integer cantID) throws Exception;
	
	public void updateWindow(WindowItems windowItems) throws Exception;
	
	public void deleteWindowById(Window window) throws Exception;
	
	public void insertWindow(Window window) throws Exception;
	
	public void updateWindowScore(Window window) throws Exception;
}
