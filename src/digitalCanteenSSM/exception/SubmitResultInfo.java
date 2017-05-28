package digitalCanteenSSM.exception;

/**
 * 系统提交结果结果类型
 */
public class SubmitResultInfo {

	public SubmitResultInfo(ResultInfo resultInfo2){
		this.resultInfo = resultInfo2;
	}
	
	//操作结果信息
	private ResultInfo resultInfo;
	
	public ResultInfo getResultInfo() {
		return resultInfo;
	}

	public void setResultInfo(ResultInfo resultInfo) {
		this.resultInfo = resultInfo;
	}
}
