package board.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.bean.CommentDTO;
import board.bean.ItemDTO;
import board.dao.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDAO boardDAO;
	@Autowired
	private HttpSession session;

	@Override
	public ItemDTO getItem(int item_seq) {
		return boardDAO.getItem(item_seq);
	}
	
	@Override
	public List<CommentDTO> getCommentList(int item_seq) {
		return boardDAO.getCommentList(item_seq);	
	}

	@Override
	public void itemComment(Map<String, Object> map) {
		boardDAO.itemComment(map);
	}

	@Override
	public void commentDelete(String comment_seq) {
		boardDAO.commentDelete(comment_seq);
	}

	@Override
	public CommentDTO getAComment(String comment_seq) {
		return boardDAO.getAComment(comment_seq);
	}

}
