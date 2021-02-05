package board.service;

import java.util.List;
import java.util.Map;

import board.bean.BoardPaging;
import board.bean.ItemDTO;

public interface BoardService {

	public List<ItemDTO> getItemBoardList(Map<String, String> map);

	public List<Object> getItemBoardCount(Map<String, String> map);

	public int getEntireItemNum(Map<String, String> map);

	public List<Object> getOrderbyItem(Map<String, String> map);

	public BoardPaging boardPaging(String pg, Map<String, String> map);

}
