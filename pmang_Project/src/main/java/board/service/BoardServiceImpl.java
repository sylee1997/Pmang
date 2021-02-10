package board.service;


import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.bean.AdminDTO;
import board.bean.BoardPaging;
import board.bean.CommentDTO;
import board.bean.ItemDTO;
import board.bean.ReportDTO;
import board.dao.BoardDAO;

import board.bean.ReviewDTO;
import board.bean.WishDTO;
import board.dao.MystoreDAO;

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
		boardDAO.reviewWrite(reviewDTO);
	}

	@Override
	public void profileImgModify(SellerDTO sellerDTO) {
		// TODO Auto-generated method stub
		mystoreDAO.profileImgModify(sellerDTO);
	}

	@Override
	public SellerDTO getMystore(String userid) {

		return mystoreDAO.getMystore(userid);
	}

	@Override
	public void mystoreHitUpdate(String userid) {
		mystoreDAO.mystoreHitUpdate(userid);

	}

	@Override
	public void mystoreModify(Map<String, String> map) {
		mystoreDAO.mystoreModify(map);
	}

	@Override
	public List<ItemDTO> getMystoreItemList(String pg, String userid) {
		// 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 25占쏙옙占쏙옙
		int endNum = Integer.parseInt(pg) * 25;
		int startNum = endNum - 24;

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("userid", userid);
		// 占쏙옙占쌩울옙 占쌍억옙占쏙옙占쏙옙占�..<String,Object>占쏙옙 占쌕꾸댐옙占쏙옙
		// map.put("userid", session.getAttribute("userid"));

		List<ItemDTO> list = mystoreDAO.getMystoreItemList(map);
		return list;
	}

	@Override
	public List<WishDTO> getMystoreWishList(String pg, String userid) {
		// 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 6占쏙옙占쏙옙
		int endNum = Integer.parseInt(pg) * 6;
		int startNum = endNum - 5;

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("userid", userid);

		List<WishDTO> list = mystoreDAO.getMystoreWishList(map);
		// System.out.println(list);
		return list;
	}

	@Override
	public void wishListDelete(Map<String, Object> map) {

		mystoreDAO.wishListDelete(map);
	}

	@Override
	public List<ReviewDTO> getMystoreReviewList(String pg, String userid) {
		// 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 3占쏙옙占쏙옙
		int endNum = Integer.parseInt(pg) * 3;
		int startNum = endNum - 2;

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("userid", userid+"");
		//System.out.println(userid);
		List<ReviewDTO> list = mystoreDAO.getMystoreReviewList(map);
		//System.out.println(list);
		return list;

	}

	@Override
	public String getMystoreItemCnt(String userid) {

		return mystoreDAO.getMystoreItemCnt(userid);
	}

	@Override
	public String getMystoreWishCnt(String userid) {
		// TODO Auto-generated method stub
		return mystoreDAO.getMystoreWishCnt(userid);
	}

	@Override
	public String getMystoreReviewCnt(String userid) {
		// TODO Auto-generated method stub
		return mystoreDAO.getMystoreReviewCnt(userid);
	}

	@Override
	public List<ItemDTO> getMystoreItemPopularList(String pg, String userid) {
		// 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 25占쏙옙占쏙옙
		int endNum = Integer.parseInt(pg) * 25;
		int startNum = endNum - 24;

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("userid", userid);
		// 占쏙옙占쌩울옙 占쌍억옙占쏙옙占쏙옙占�..<String,Object>占쏙옙 占쌕꾸댐옙占쏙옙
		// map.put("userid", session.getAttribute("userid"));

		List<ItemDTO> list = mystoreDAO.getMystoreItemPopularList(map);
		return list;
	}

	@Override
	public List<ItemDTO> getMystoreItemLowerPriceList(String pg, String userid) {
		// 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 25占쏙옙占쏙옙
		int endNum = Integer.parseInt(pg) * 25;
		int startNum = endNum - 24;

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("userid", userid);
		// 占쏙옙占쌩울옙 占쌍억옙占쏙옙占쏙옙占�..<String,Object>占쏙옙 占쌕꾸댐옙占쏙옙
		// map.put("userid", session.getAttribute("userid"));

		List<ItemDTO> list = mystoreDAO.getMystoreItemLowerPriceList(map);
		return list;
	}

	@Override
	public List<ItemDTO> getMystoreItemHighestPriceList(String pg, String userid) {
		// 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 25占쏙옙占쏙옙
		int endNum = Integer.parseInt(pg) * 25;
		int startNum = endNum - 24;

		Map<String,Object> map = new HashMap<String, Object>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("userid", userid);
		// 占쏙옙占쌩울옙 占쌍억옙占쏙옙占쏙옙占�..<String,Object>占쏙옙 占쌕꾸댐옙占쏙옙
		// map.put("userid", session.getAttribute("userid"));

		List<ItemDTO> list = mystoreDAO.getMystoreItemHighestPriceList(map);
		return list;
	}

	@Override
	public List<ItemDTO> getMystoreWishPopularList(String pg, String userid) {
		// 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 6占쏙옙占쏙옙
		int endNum = Integer.parseInt(pg) * 6;
		int startNum = endNum - 5;

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("userid", userid);
		// 占쏙옙占쌩울옙 占쌍억옙占쏙옙占쏙옙占�..<String,Object>占쏙옙 占쌕꾸댐옙占쏙옙
		// map.put("userid", session.getAttribute("userid"));

		List<ItemDTO> list = mystoreDAO.getMystoreWishPopularList(map);
		return list;
	}

	@Override
	public List<ItemDTO> getMystoreWishHighestPriceList(String pg, String userid) {
		// 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 6占쏙옙占쏙옙
		int endNum = Integer.parseInt(pg) * 6;
		int startNum = endNum - 5;

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("userid", userid);
		// 占쏙옙占쌩울옙 占쌍억옙占쏙옙占쏙옙占�..<String,Object>占쏙옙 占쌕꾸댐옙占쏙옙
		// map.put("userid", session.getAttribute("userid"));

		List<ItemDTO> list = mystoreDAO.getMystoreWishHighestPriceList(map);
		return list;
	}

	@Override
	public List<ItemDTO> getMystoreWishLowerPriceList(String pg, String userid) {
		// 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 6占쏙옙占쏙옙
		int endNum = Integer.parseInt(pg) * 6;
		int startNum = endNum - 5;

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("userid", userid);
		// 占쏙옙占쌩울옙 占쌍억옙占쏙옙占쏙옙占�..<String,Object>占쏙옙 占쌕꾸댐옙占쏙옙
		// map.put("userid", session.getAttribute("userid"));

		List<ItemDTO> list = mystoreDAO.getMystoreWishLowerPriceList(map);
		return list;
	}

	@Override
	public AdminDTO getAdmin() {
		int userCount=mystoreDAO.getUserCnt();
		int itemCount=mystoreDAO.getItemCnt();
		
		AdminDTO adminDTO=new AdminDTO();
		adminDTO.setItemCount(itemCount);
		adminDTO.setUserCount(userCount);
		
		return adminDTO;
	}

	@Override
	public List<ReportDTO> getReportList() {
		
		
		
		return mystoreDAO.getReportList();
	}

	

	@Override
	public List<ReportDTO> getReport(String userid) {
		// TODO Auto-generated method stub
		return mystoreDAO.getReport(userid);
	}

	@Override
	public List<String> getReportTarget() {
		// TODO Auto-generated method stub
		return mystoreDAO.getReportTarget();
	}

	@Override
	public void noticeWrite(Map<String, String> map) {
		mystoreDAO.noticeWrite(map);
	}


}

