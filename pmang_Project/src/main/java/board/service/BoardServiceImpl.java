package board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.bean.BoardPaging;
import board.bean.CommentDTO;
import board.bean.ItemDTO;
import board.bean.WishlistDTO;
import board.dao.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDAO;
	@Autowired
	private BoardPaging boardPaging;

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

	@Override
	public List<WishlistDTO> getWishlist(int item_seq) {
		return boardDAO.getWishlist(item_seq);
	}

	@Override
	public void pushLike(Map<String, Object> map) {
		boardDAO.pushLike(map);
	}

	@Override
	public void cancelLike(Map<String, Object> map) {
		boardDAO.cancelLike(map);
	}

	@Override
	public void reportUser(Map<String, Object> map) {
		boardDAO.reportUser(map);
	}

	@Override
	public void countReport(String userId) {
		boardDAO.countReport(userId);
	}

	@Override
	public String getUesrId(Map<String, Object> map) {
		return boardDAO.getUserId(map);
	}


	// ----------------------------ItemBoard------------------------------------------//
	@Override
	public void itemHitUpdate(int item_seq) {
		boardDAO.itemHitUpdate(item_seq);
	}

	@Override
	public List<ItemDTO> getItemBoardList(String pg, Map<String, Object> map) {
		// 1페이지당 20개씩
		int endNum = Integer.parseInt(pg) * 20;
		int startNum = endNum - 19;

		map.put("startNum", startNum);
		map.put("endNum", endNum);

		return boardDAO.getItemBoardList(map);
	}

	@Override
	public List<Object> getItemBoardCount(Map<String, Object> map) {
		return boardDAO.getItemBoardCount(map);
	}

	@Override
	public int getEntireItemNum(Map<String, Object> map) {
		return boardDAO.getEntireItemNum(map);
	}

	@Override
	public List<Object> getOrderbyItem(String pg, Map<String, Object> map) {

		// 1페이지당 20개씩
		int endNum = Integer.parseInt(pg) * 20;
		int startNum = endNum - 19;

		map.put("startNum", startNum);
		map.put("endNum", endNum);

		return boardDAO.getOrderbyItem(map);

	}

	@Override
	public BoardPaging boardPaging(String pg, Map<String, Object> map) {
		int totalA = boardDAO.getEntireItemNum(map);

		boardPaging.setCurrentPage(Integer.parseInt(pg));
		boardPaging.setPageBlock(5);
		boardPaging.setPageSize(20);
		boardPaging.setTotalA(totalA);
		boardPaging.makePagingHTML();
		return boardPaging;
	}

}
