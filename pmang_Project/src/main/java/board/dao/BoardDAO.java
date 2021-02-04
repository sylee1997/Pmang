package board.dao;

import java.util.List;
import java.util.Map;

import board.bean.ItemDTO;

public interface BoardDAO {

	public List<ItemDTO> getItemBoardList(Map<String, String> map);

	public List<Object> getItemBoardCount(Map<String, String> map);

}
