package digitalCanteenSSM.exception;

/**
 * 自定义系统异常类
 */
public class ExceptionResultInfo extends Exception {
	
	// 系统统一使用的结果类，包括了 提示信息类型和信息内容
	private ResultInfo resultInfo;

	public ExceptionResultInfo(ResultInfo resultInfo2) {
		super(resultInfo2.getMessage());
		this.resultInfo = resultInfo2;
	}

	public ResultInfo getResultInfo() {
		return resultInfo;
	}

	public void setResultInfo(ResultInfo resultInfo) {
		this.resultInfo = resultInfo;
	}
}
