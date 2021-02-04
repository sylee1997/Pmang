package board.service;

import java.util.List;
import java.util.Map;

import board.bean.ItemDTO;

public interface BoardService {

	public List<ItemDTO> getItemBoardList(Map<String, String> map);

	public List<Object> getItemBoardCount(Map<String, String> map);

}
