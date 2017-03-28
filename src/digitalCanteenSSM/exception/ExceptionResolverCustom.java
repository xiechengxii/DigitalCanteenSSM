package digitalCanteenSSM.exception;

import java.io.IOException;
import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.http.HttpOutputMessage;
import org.springframework.http.MediaType;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.HttpMessageNotWritableException;
import org.springframework.http.server.ServletServerHttpResponse;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

public class ExceptionResolverCustom implements HandlerExceptionResolver {
	// json转换器
	private HttpMessageConverter<ExceptionResultInfo> jsonMessageConverter;

	// 前端控制器调用此方法执行异常处理
	@Override
	public ModelAndView resolveException(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex) {

		ex.printStackTrace();
		
		//返回Json数据		
		HandlerMethod handlerMethod = (HandlerMethod) handler;
		Method method = handlerMethod.getMethod();
		ResponseBody responseBody = AnnotationUtils.findAnnotation(method,ResponseBody.class);
		if (responseBody != null) {

			return this.resolveJsonException(request, response, handlerMethod,ex);

		}
		
		//返回JSP页面
		ExceptionResultInfo exceptionResultInfo = resolveExceptionCustom(ex);
		request.setAttribute("exceptionResultInfo",exceptionResultInfo.getResultInfo());

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("exceptionResultInfo",exceptionResultInfo.getResultInfo());
		modelAndView.setViewName("/WEB-INF/jsp/publicjsp/error.jsp");
		return modelAndView;
	}

	// 异常信息解析方法  Jsp
	private ExceptionResultInfo resolveExceptionCustom(Exception ex) {
		ResultInfo resultInfo = null;
		if (ex instanceof ExceptionResultInfo) {
			// 抛出的是系统自定义异常
			resultInfo = ((ExceptionResultInfo) ex).getResultInfo();
		} else {
			// 重新构造“未知错误”异常
			resultInfo = new ResultInfo();
			resultInfo.setType(ResultInfo.TYPE_RESULT_FAIL);
			resultInfo.setMessage("未知错误！");
		}

		return new ExceptionResultInfo(resultInfo);

	}

	// 将异常信息转json输出
	private ModelAndView resolveJsonException(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex) {

		// 解析异常
		ExceptionResultInfo exceptionResultInfo = resolveExceptionCustom(ex);
		
		HttpOutputMessage outputMessage = new ServletServerHttpResponse(response);
		
		try {
			//将exceptionResultInfo对象转成json输出
			jsonMessageConverter.write(exceptionResultInfo, MediaType.APPLICATION_JSON, outputMessage);
		} catch (HttpMessageNotWritableException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		return new ModelAndView();

	}

	public HttpMessageConverter<ExceptionResultInfo> getJsonMessageConverter() {
		return jsonMessageConverter;
	}

	public void setJsonMessageConverter(
			HttpMessageConverter<ExceptionResultInfo> jsonMessageConverter) {
		this.jsonMessageConverter = jsonMessageConverter;
	}
}
