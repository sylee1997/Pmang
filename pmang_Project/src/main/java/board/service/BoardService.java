package board.service;

import java.util.List;
import java.util.Map;

import board.bean.BoardPaging;
import board.bean.CommentDTO;
import board.bean.ItemDTO;

import board.bean.ReviewDTO;
import board.bean.WishDTO;
import member.bean.SellerDTO;

public interface BoardService {

	public ItemDTO getItem(int item_seq);

	public List<CommentDTO> getCommentList(int item_seq);

	public void itemComment(Map<String, Object> map);

	public void commentDelete(String comment_seq);

	public CommentDTO getAComment(String comment_seq);

	public List<ItemDTO> getItemBoardList(Map<String, String> map);

	public List<Object> getItemBoardCount(Map<String, String> map);

	public int getEntireItemNum(Map<String, String> map);

	public List<Object> getOrderbyItem(Map<String, String> map);

	public BoardPaging boardPaging(String pg, Map<String, String> map);

	public void reviewWrite(ReviewDTO reviewDTO);

	public void profileImgModify(SellerDTO sellerDTO);

	public SellerDTO getMystore(int userkey);

	public void mystoreHitUpdate(int userkey);

	public void mystoreModify(Map<String, String> map);

	public List<ItemDTO> getMystoreItemList(String pg, int userkey);

	public List<WishDTO> getMystoreWishList(String pg, int userkey);

	public void wishListDelete(Map<String, Object> map);

	public List<ReviewDTO> getMystoreReviewList(String pg, int userkey);

	public String getMystoreItemCnt(int userkey);

	public String getMystoreWishCnt(int userkey);

	// public MystoreTab1Paging mystoreTab1Paging(String pg,int userkey);

	// public MystoreTab2Paging mystoreTab2Paging(String pg, int userkey);

	public String getMystoreReviewCnt(int userkey);

	public List<ItemDTO> getMystoreItemPopularList(String pg, int userkey);

	public List<ItemDTO> getMystoreItemLowerPriceList(String pg, int userkey);

	public List<ItemDTO> getMystoreItemHighestPriceList(String pg, int userkey);

	public List<ItemDTO> getMystoreWishPopularList(String pg, int userkey);

	public List<ItemDTO> getMystoreWishHighestPriceList(String pg, int userkey);

	public List<ItemDTO> getMystoreWishLowerPriceList(String pg, int userkey);

}
