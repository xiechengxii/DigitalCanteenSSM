package digitalCanteenSSM.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import digitalCanteenSSM.mapper.WindowPresetMapper;
import digitalCanteenSSM.po.Window;
import digitalCanteenSSM.po.WindowItems;
import digitalCanteenSSM.service.WindowPresetService;

@Service
public class WindowPresetServiceImpl implements WindowPresetService{

	@Autowired
	private WindowPresetMapper windowPresetMapper;
	
	@Override
	public List<WindowItems> findAllWindows()  throws Exception{
		
		return windowPresetMapper.findAllWindows();
	}

	@Override
	public WindowItems findWindowById(Integer wndID) throws Exception {
		
		return windowPresetMapper.findWindowById(wndID);
	}

	@Override
	public void updateWindow(WindowItems windowItems) throws Exception {
		
		windowPresetMapper.updateWindow(windowItems);
	}
	
	@Override
	public void deleteWindowById(Window window)  throws Exception{
		
		windowPresetMapper.deleteWindowById(window);
	}

	@Override
	public WindowItems findWindowByName(WindowItems windowItems) throws Exception {
		
		return windowPresetMapper.findWindowByName(windowItems);
	}

	@Override
	public List<WindowItems> findWindowsInCanteen(Integer cantID) throws Exception{
		
		return windowPresetMapper.findWindowsInCanteen(cantID);
	}
	
	@Override
	public void insertWindow(Window window)  throws Exception{
			
		windowPresetMapper.insertWindow(window);
	}

	@Override
	public void updateWindowScore(Window window) throws Exception {

		windowPresetMapper.updateWindowScore(window);	
	}


}
