package board.dao;

import java.util.List;
import java.util.Map;

import board.bean.CommentDTO;
import board.bean.ItemDTO;
import board.bean.ReportDTO;
import board.bean.ReviewDTO;

public interface BoardDAO {


	public ItemDTO getItem(int item_seq);

	public List<CommentDTO> getCommentList(int item_seq);

	public void itemComment(Map<String, Object> map);

	public void commentDelete(String comment_seq);

	public CommentDTO getAComment(String comment_seq);

	public List<ItemDTO> getItemBoardList(Map<String, String> map);

	public List<Object> getItemBoardCount(Map<String, String> map);

	public int getEntireItemNum(Map<String, String> map);

	public List<Object> getOrderbyItem(Map<String, String> map);

	public void reviewWrite(ReviewDTO reviewDTO);

	


}

