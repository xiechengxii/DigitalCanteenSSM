package digitalCanteenSSM.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.github.miemiedev.mybatis.paginator.domain.Order;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import digitalCanteenSSM.po.CanteenItems;
import digitalCanteenSSM.po.MUser;
import digitalCanteenSSM.po.MUserItems;
import digitalCanteenSSM.po.Record;
import digitalCanteenSSM.service.MUserService;
import digitalCanteenSSM.service.RecordService;

@Controller 
public class MUserCanteenController {

	@Autowired
	private RecordService recordService;
	
	//食堂管理员首页
	@RequestMapping ("/muserCanteenHostPage")
	public ModelAndView muserCanteenHostPage(HttpSession session, HttpServletRequest request) throws Exception{		
		//本段代码运行时优先从request中读取的页码和单页内容数量，
		//如果请求从其它controller发出，并无这两个对象，
		//则使用的是默认的值
		String pageNum = request.getParameter("pageNum");
		String pageSize = request.getParameter("pageSize");
		int num = 1;
		int size = 10;
		if (pageNum != null && !"".equals(pageNum)) {
			num = Integer.parseInt(pageNum);
		}
		if (pageSize != null && !"".equals(pageSize)) {
			size = Integer.parseInt(pageSize);
		}
		
		//配置pagehelper的排序及分页
		String sortString = "id.desc";
		Order.formString(sortString);
		PageHelper.startPage(num, size);

		ModelAndView modelAndView = new ModelAndView();
		
		MUserItems muserItems = (MUserItems)session.getAttribute("muserItems");
		
		List<Record> dishRecordList = recordService.findRecordInCanteen(muserItems.getCantID());
		PageInfo<Record> pagehelper = new PageInfo<Record>(dishRecordList);

		modelAndView.addObject("muserItems",muserItems);
		modelAndView.addObject("pagehelper", pagehelper);
		modelAndView.setViewName("WEB-INF/jsp/muserCanteenHostPage.jsp");
		
		return modelAndView;
	}
}