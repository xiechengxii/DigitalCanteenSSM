package digitalCanteenSSM.service;

import java.util.List;

import digitalCanteenSSM.po.Log;

public interface LogService {
	
	public void insertLog(Log log) throws Exception;
	
	public List<Log> findAllLog() throws Exception;
}