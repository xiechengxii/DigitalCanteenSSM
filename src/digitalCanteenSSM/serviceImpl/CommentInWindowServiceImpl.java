package digitalCanteenSSM.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import digitalCanteenSSM.mapper.CommentInWindowMapper;
import digitalCanteenSSM.po.Comment;
import digitalCanteenSSM.po.CommentItems;
import digitalCanteenSSM.service.CommentInWindowService;

@Service
public class CommentInWindowServiceImpl implements CommentInWindowService {

	@Autowired
	private CommentInWindowMapper commentMapper;
	
	@Override
	public List<CommentItems> findAllCommentsInWindow(Integer wndID) throws Exception {
		
		return commentMapper.findAllCommentsInWindow(wndID);
	}

	@Override
	public List<CommentItems> findCommentsByUser(Integer userID)
			throws Exception {
		
		return commentMapper.findCommentsByUser(userID);
	}

	
	@Override
	public void InsertCommentInWindow(Comment comment) throws Exception {
		commentMapper.InsertCommentInWindow(comment);
	}

	@Override
	public void deleteCommentById(Integer cmtID) throws Exception {
		commentMapper.deleteCommentById(cmtID);
	}

	@Override
	public CommentItems findCommentByID(Integer cmtID) throws Exception {
		
		return commentMapper.findCommentByID(cmtID);
	}

	@Override
	public void updateCommentGoodNum(Comment comment) throws Exception {

		commentMapper.updateCommentGoodNum(comment);
	}

	
}
