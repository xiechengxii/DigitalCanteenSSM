package digitalCanteenSSM.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.github.miemiedev.mybatis.paginator.domain.Order;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import digitalCanteenSSM.po.DishPreset;
import digitalCanteenSSM.service.DishPresetService;

@Controller
public class DishPresetController {

	@Autowired
	private DishPresetService dishPresetService;
	
	//菜品预置页面
	//添加预置菜品按钮与已添加预置菜品显示
	@RequestMapping ("/dishPreset")
	public String dishPreset() throws Exception{
		
		return "forward:findAllDishPreset.action";
	}
	
	//查找所有预置菜品
	//返回菜品预置页面显示
	@RequestMapping ("/findAllDishPreset")
	public ModelAndView findAllDishPreset(HttpServletRequest request) throws Exception{
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
		
		List<DishPreset> dishPresetList = dishPresetService.findAllDishPreset();
		PageInfo<DishPreset> pagehelper = new PageInfo<DishPreset>(dishPresetList);
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("pagehelper", pagehelper);
		modelAndView.setViewName("/WEB-INF/jsp/m_dishPreset.jsp");
		
		return modelAndView;
	}
	
	//通过预置菜品ID查找预置菜品信息
	@RequestMapping ("/findDishPresetById")
	public DishPreset findDishPresetById(int dishPresetID) throws Exception{
		
		return dishPresetService.findDishPresetById(dishPresetID);
	}
	
	//修改预置菜品：跳转到dishPresetModify.jsp显示具体修改信息
	@RequestMapping ("/modifyDishPreset")	
	public ModelAndView modifyDishPreset(int dishPresetID) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("dishPreset",findDishPresetById(dishPresetID));	
		modelAndView.setViewName("/WEB-INF/jsp/m_dishPresetModify.jsp");
		
		return modelAndView;
	}
	
	//修改预置菜品：修改之后保存并跳转到预置菜品页面
	@RequestMapping ("/modifyDishPresetSave")	
	public String modifyDishPresetSave(DishPreset dishPreset) throws Exception{
		
		dishPresetService.updateDishPreset(dishPreset);
		
		return "forward:dishPreset.action";
	}
		
	//通过预置菜品ID删除校区信息
	@RequestMapping("/deleteDishPresetById")
	public String deleteDishPresetById(Integer dishPresetID) throws Exception{
		
		dishPresetService.deleteDishPresetById(dishPresetID);
		
		return "forward:dishPreset.action";
	}
	
	//通过Name找预置菜品
	public DishPreset findDishPresetByName(String dishPresetName) throws Exception{
		
		return dishPresetService.findDishPresetByName(dishPresetName);
	}
	
	//添加新的预置菜品
	@RequestMapping("/insetDishPreset")
	public String insetDishPreset(DishPreset dishPreset) throws Exception{
		
		if(findDishPresetByName(dishPreset.getDishPresetName()) == null){
			dishPresetService.insertDishPreset(dishPreset);
		}	
		
		return "forward:dishPreset.action";
	}
		
}
