package digitalCanteenSSM.mapper;

import java.util.List;

import digitalCanteenSSM.po.Log;

public interface LogMapper {
	
	public void insertLog(Log log) throws Exception;
	
	public List<Log> findAllLog() throws Exception;	
}
