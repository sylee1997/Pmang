package board.service;

import java.util.List;
import java.util.Map;

import board.bean.AdminDTO;
import board.bean.BoardPaging;
import board.bean.CommentDTO;
import board.bean.ItemDTO;
import board.bean.ReportDTO;

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

	public SellerDTO getMystore(String userid);

	public void mystoreHitUpdate(String userid);

	public void mystoreModify(Map<String, String> map);

	public List<ItemDTO> getMystoreItemList(String pg, String userid);

	public List<WishDTO> getMystoreWishList(String pg, String userid);

	public void wishListDelete(Map<String, Object> map);

	public List<ReviewDTO> getMystoreReviewList(String pg, String userid);

	public String getMystoreItemCnt(String userid);

	public String getMystoreWishCnt(String userid);


	public String getMystoreReviewCnt(String userid);

	public List<ItemDTO> getMystoreItemPopularList(String pg, String userid);

	public List<ItemDTO> getMystoreItemLowerPriceList(String pg, String userid);

	public List<ItemDTO> getMystoreItemHighestPriceList(String pg, String userid);

	public List<ItemDTO> getMystoreWishPopularList(String pg, String userid);

	public List<ItemDTO> getMystoreWishHighestPriceList(String pg, String userid);

	public List<ItemDTO> getMystoreWishLowerPriceList(String pg, String userid);

	public AdminDTO getAdmin();

	public List<ReportDTO> getReportList();

	

	public List<ReportDTO> getReport(String userid);

	public List<String> getReportTarget();

	public void noticeWrite(Map<String, String> map);

}
