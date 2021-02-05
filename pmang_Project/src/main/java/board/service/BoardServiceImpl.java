package board.service;


import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import board.bean.BoardPaging;
import board.bean.CommentDTO;
import board.bean.ItemDTO;
import board.dao.BoardDAO;

import board.bean.ReviewDTO;
import board.bean.WishDTO;
import board.dao.MystoreDAO;
import board.dao.ReviewDAO;
import member.bean.SellerDTO;

@Service
public class BoardServiceImpl implements BoardService {

	
	@Autowired
	private BoardDAO boardDAO;
	@Autowired
	private BoardPaging boardPaging;
	@Autowired
	private HttpSession session;
	
	@Autowired
	private MystoreDAO mystoreDAO;
	@Autowired
	private ReviewDAO reviewDAO;

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
	public List<ItemDTO> getItemBoardList(Map<String, String> map) {
		
		return boardDAO.getItemBoardList(map);
	}

	@Override
	public List<Object> getItemBoardCount(Map<String, String> map) {
		return boardDAO.getItemBoardCount(map);
	}

	@Override
	public int getEntireItemNum(Map<String, String> map) {
		return boardDAO.getEntireItemNum(map);
	}

	@Override
	public List<Object> getOrderbyItem(Map<String, String> map) {
		return boardDAO.getOrderbyItem(map);
	}

	@Override
	public BoardPaging boardPaging(String pg, Map<String, String> map) {
		int totalA = boardDAO.getEntireItemNum(map);
		
		boardPaging.setCurrentPage(Integer.parseInt(pg));
		boardPaging.setPageBlock(5);
		boardPaging.setPageSize(25);
		boardPaging.setTotalA(totalA);
		boardPaging.makePagingHTML();
		return boardPaging;
	}

	@Override
	public void reviewWrite(ReviewDTO reviewDTO) {
		reviewDAO.reviewWrite(reviewDTO);
	}

	@Override
	public void profileImgModify(SellerDTO sellerDTO) {
		// TODO Auto-generated method stub
		mystoreDAO.profileImgModify(sellerDTO);
	}

	@Override
	public SellerDTO getMystore(int userkey) {

		return mystoreDAO.getMystore(userkey);
	}

	@Override
	public void mystoreHitUpdate(int userkey) {
		mystoreDAO.mystoreHitUpdate(userkey);

	}

	@Override
	public void mystoreModify(Map<String, String> map) {
		mystoreDAO.mystoreModify(map);
	}

	@Override
	public List<ItemDTO> getMystoreItemList(String pg, int userkey) {
		// 한페이지당 25개씩
		int endNum = Integer.parseInt(pg) * 25;
		int startNum = endNum - 24;

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("userkey", userkey);
		// 나중에 넣어줘야함..<String,Object>로 바꾸던가
		// map.put("userkey", session.getAttribute("userkey"));

		List<ItemDTO> list = mystoreDAO.getMystoreItemList(map);
		return list;
	}

	@Override
	public List<WishDTO> getMystoreWishList(String pg, int userkey) {
		// 한페이지당 6개씩
		int endNum = Integer.parseInt(pg) * 6;
		int startNum = endNum - 5;

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("userkey", userkey);

		List<WishDTO> list = mystoreDAO.getMystoreWishList(map);
		// System.out.println(list);
		return list;
	}

	@Override
	public void wishListDelete(Map<String, Object> map) {

		mystoreDAO.wishListDelete(map);
	}

	@Override
	public List<ReviewDTO> getMystoreReviewList(String pg, int userkey) {
		// 한페이지당 3개씩
		int endNum = Integer.parseInt(pg) * 3;
		int startNum = endNum - 2;

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("userkey", userkey);

		List<ReviewDTO> list = mystoreDAO.getMystoreReviewList(map);
		System.out.println(list);
		return list;

	}

	@Override
	public String getMystoreItemCnt(int userkey) {

		return mystoreDAO.getMystoreItemCnt(userkey);
	}

	@Override
	public String getMystoreWishCnt(int userkey) {
		// TODO Auto-generated method stub
		return mystoreDAO.getMystoreWishCnt(userkey);
	}

	@Override
	public String getMystoreReviewCnt(int userkey) {
		// TODO Auto-generated method stub
		return mystoreDAO.getMystoreReviewCnt(userkey);
	}

	@Override
	public List<ItemDTO> getMystoreItemPopularList(String pg, int userkey) {
		// 한페이지당 25개씩
		int endNum = Integer.parseInt(pg) * 25;
		int startNum = endNum - 24;

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("userkey", userkey);
		// 나중에 넣어줘야함..<String,Object>로 바꾸던가
		// map.put("userkey", session.getAttribute("userkey"));

		List<ItemDTO> list = mystoreDAO.getMystoreItemPopularList(map);
		return list;
	}

	@Override
	public List<ItemDTO> getMystoreItemLowerPriceList(String pg, int userkey) {
		// 한페이지당 25개씩
		int endNum = Integer.parseInt(pg) * 25;
		int startNum = endNum - 24;

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("userkey", userkey);
		// 나중에 넣어줘야함..<String,Object>로 바꾸던가
		// map.put("userkey", session.getAttribute("userkey"));

		List<ItemDTO> list = mystoreDAO.getMystoreItemLowerPriceList(map);
		return list;
	}

	@Override
	public List<ItemDTO> getMystoreItemHighestPriceList(String pg, int userkey) {
		// 한페이지당 25개씩
		int endNum = Integer.parseInt(pg) * 25;
		int startNum = endNum - 24;

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("userkey", userkey);
		// 나중에 넣어줘야함..<String,Object>로 바꾸던가
		// map.put("userkey", session.getAttribute("userkey"));

		List<ItemDTO> list = mystoreDAO.getMystoreItemHighestPriceList(map);
		return list;
	}

	@Override
	public List<ItemDTO> getMystoreWishPopularList(String pg, int userkey) {
		// 한페이지당 6개씩
		int endNum = Integer.parseInt(pg) * 6;
		int startNum = endNum - 5;

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("userkey", userkey);
		// 나중에 넣어줘야함..<String,Object>로 바꾸던가
		// map.put("userkey", session.getAttribute("userkey"));

		List<ItemDTO> list = mystoreDAO.getMystoreWishPopularList(map);
		return list;
	}

	@Override
	public List<ItemDTO> getMystoreWishHighestPriceList(String pg, int userkey) {
		// 한페이지당 6개씩
		int endNum = Integer.parseInt(pg) * 6;
		int startNum = endNum - 5;

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("userkey", userkey);
		// 나중에 넣어줘야함..<String,Object>로 바꾸던가
		// map.put("userkey", session.getAttribute("userkey"));

		List<ItemDTO> list = mystoreDAO.getMystoreWishHighestPriceList(map);
		return list;
	}

	@Override
	public List<ItemDTO> getMystoreWishLowerPriceList(String pg, int userkey) {
		// 한페이지당 6개씩
		int endNum = Integer.parseInt(pg) * 6;
		int startNum = endNum - 5;

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("userkey", userkey);
		// 나중에 넣어줘야함..<String,Object>로 바꾸던가
		// map.put("userkey", session.getAttribute("userkey"));

		List<ItemDTO> list = mystoreDAO.getMystoreWishLowerPriceList(map);
		return list;
	}

}

