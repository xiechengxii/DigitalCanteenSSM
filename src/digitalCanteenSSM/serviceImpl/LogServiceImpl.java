package digitalCanteenSSM.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import digitalCanteenSSM.mapper.LogMapper;
import digitalCanteenSSM.po.Log;
import digitalCanteenSSM.service.LogService;

public class LogServiceImpl implements LogService{
	@Autowired
	private LogMapper logMapper;
	
	@Override
	public void insert(Log log) throws Exception{
		logMapper.insert(log);
	}
	
	@Override
	public List<Log> findAllLog() throws Exception{
		return logMapper.findAllLog();
	}
}
