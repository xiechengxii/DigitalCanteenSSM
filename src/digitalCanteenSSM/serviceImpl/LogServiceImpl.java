package digitalCanteenSSM.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import digitalCanteenSSM.mapper.LogMapper;
import digitalCanteenSSM.po.Log;
import digitalCanteenSSM.service.LogService;

@Service
public class LogServiceImpl implements LogService{
	@Autowired
	private LogMapper logMapper;
	
	@Override
	public void insertLog(Log log) throws Exception{
		logMapper.insertLog(log);
	}
	
	@Override
	public List<Log> findAllLog() throws Exception{
		return logMapper.findAllLog();
	}
}
