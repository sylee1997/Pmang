package board.dao;

import java.util.List;
import java.util.Map;

import board.bean.CommentDTO;
import board.bean.ItemDTO;
import board.bean.WishlistDTO;

public interface BoardDAO {

	public ItemDTO getItem(int item_seq);

	public List<CommentDTO> getCommentList(int item_seq);

	public void itemComment(Map<String, Object> map);

	public void commentDelete(String comment_seq);

	public CommentDTO getAComment(String comment_seq);

	public List<WishlistDTO> getWishlist(int item_seq);

	public void pushLike(Map<String, Object> map);

	public void cancelLike(Map<String, Object> map);

	public void reportUser(Map<String, Object> map);

	public void countReport(String userId);

	public String getUserId(Map<String, Object> map);

	// -------------------------------itemBoard----------------------------------------//

	public List<ItemDTO> getItemBoardList(Map<String, Object> map);

	public List<Object> getItemBoardCount(Map<String, Object> map);

	public void itemHitUpdate(int item_seq);

	public int getEntireItemNum(Map<String, Object> map);

	public List<Object> getOrderbyItem(Map<String, Object> map);

}
