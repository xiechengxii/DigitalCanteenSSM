package digitalCanteenSSM.service;

import java.util.List;

import digitalCanteenSSM.po.Comment;
import digitalCanteenSSM.po.CommentItems;

public interface CommentInWindowService {

	public List<CommentItems> findAllCommentsInWindow(Integer wndID) throws Exception;
	
	public List<CommentItems> findCommentsByUser(Integer userID) throws Exception;
	
	public CommentItems findCommentByID(Integer cmtID) throws Exception;
	
	public void InsertCommentInWindow(Comment comment) throws Exception;
	
	public void updateCommentGoodNum(Comment comment) throws Exception;
	
	public void deleteCommentById(Integer cmtID) throws Exception;
}
