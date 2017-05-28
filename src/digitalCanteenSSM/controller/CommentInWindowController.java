package digitalCanteenSSM.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import digitalCanteenSSM.po.Comment;
import digitalCanteenSSM.po.CommentItems;
import digitalCanteenSSM.po.Window;
import digitalCanteenSSM.service.CampusPresetService;
import digitalCanteenSSM.service.CanteenPresetService;
import digitalCanteenSSM.service.CommentInWindowService;
import digitalCanteenSSM.service.WindowPresetService;

@Controller 
public class CommentInWindowController {
	
	@Autowired
	private CommentInWindowService commentService;
	@Autowired
	private CampusPresetService campusPresetService;
	@Autowired
	private CanteenPresetService canteenPresetService;
	@Autowired
	private WindowPresetService windowPresetService;
	
	//查找一个档口下的所有评论
	@RequestMapping("/findAllCommentInWindow")
	public ModelAndView findAllCommentInWindow(Integer wndID) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		//wndID
		wndID = 3;
		List<CommentItems> commentItemsList = commentService.findAllCommentsInWindow(wndID);
		modelAndView.addObject("commentItemsList",commentItemsList);
		modelAndView.addObject("windowItems",windowPresetService.findWindowById(wndID));
		modelAndView.setViewName("/WEB-INF/jsp/commentInWindow.jsp");
		
		return modelAndView;
	}
	
	//后台管理员选择要查询评论的窗口
	@RequestMapping("/commentSelectWindow")
	public ModelAndView commentSelectWindow() throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("campusList", campusPresetService.findAllCampuses());
		modelAndView.addObject("canteenItemsList",canteenPresetService.findAllCanteens());
		modelAndView.addObject("windowItemsList",windowPresetService.findAllWindows());
		
		modelAndView.setViewName("/WEB-INF/jsp/commentMUserInquire.jsp");
		return modelAndView;
	}
		
	//后台管理员查询一个档口下的评论
	@RequestMapping("/commentMUserInquire")
	public ModelAndView commentMUserInquire(Integer wndID) throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		
		modelAndView.addObject("campusList", campusPresetService.findAllCampuses());
		modelAndView.addObject("canteenItemsList",canteenPresetService.findAllCanteens());
		modelAndView.addObject("windowItemsList",windowPresetService.findAllWindows());
		
		List<CommentItems> commentItemsList = commentService.findAllCommentsInWindow(wndID);
		modelAndView.addObject("commentItemsList",commentItemsList);
		modelAndView.addObject("windowItems",windowPresetService.findWindowById(wndID));
		
		modelAndView.setViewName("/WEB-INF/jsp/commentMUserInquire.jsp");
		return modelAndView;
	}
	
	//转向添加评论页
	@RequestMapping("/addCommentInWindow")
	public ModelAndView addCommentInWindow(Integer wndID) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		//userID
		int userID = 2;
		
		modelAndView.addObject("windowItems",windowPresetService.findWindowById(wndID));
		modelAndView.addObject("userItems",userID);
		modelAndView.setViewName("/WEB-INF/jsp/commentAdd.jsp");
		
		return modelAndView;
	}
		
	//插入评论
	@RequestMapping("/insertCommentInWindow")
	public ModelAndView insertCommentInWindow(Comment comment) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		Date date = new Date();
		comment.setCmtDate(date);		
		Window window = windowPresetService.findWindowById(comment.getCmtWndID());
		float score = window.getWndScore();
		List<CommentItems> commentItemsList = commentService.findAllCommentsInWindow(comment.getCmtWndID());
		window.setWndScore((score*commentItemsList.size()+comment.getCmtScore())/(commentItemsList.size()+1));
		
		windowPresetService.updateWindowScore(window);
		commentService.InsertCommentInWindow(comment);
		modelAndView.setViewName("findAllCommentInWindow.action");
		
		return modelAndView;
	}
	
	//点赞数
	@RequestMapping("/updateCmtGoodNum")
	public ModelAndView updateCmtGoodNum(Integer cmtID,Integer cmtGood) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		
		cmtGood=1;
		Comment comment = commentService.findCommentByID(cmtID);
		int cmtGoodNum = comment.getCmtGoodNum();
		cmtGoodNum += cmtGood;
		comment.setCmtGoodNum(cmtGoodNum);
		commentService.updateCommentGoodNum(comment);
		
		modelAndView.setViewName("findAllCommentInWindow.action");
		return modelAndView;
	}
	
	//删除评论
	@RequestMapping("/deleteCommentById")
	public ModelAndView deleteCommentById(Integer cmtID,Integer wndID) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		commentService.deleteCommentById(cmtID);
		modelAndView.addObject("campusList", campusPresetService.findAllCampuses());
		modelAndView.addObject("canteenItemsList",canteenPresetService.findAllCanteens());
		modelAndView.addObject("windowItemsList",windowPresetService.findAllWindows());
		
		modelAndView.addObject("commentItemsList",commentService.findAllCommentsInWindow(wndID));
		modelAndView.addObject("windowItems",windowPresetService.findWindowById(wndID));
		
		modelAndView.setViewName("/WEB-INF/jsp/commentMUserInquire.jsp");
		
		return modelAndView;
	}
}
