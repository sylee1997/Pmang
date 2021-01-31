package board.service;

import board.bean.ItemDTO;

public interface BoardService {

	public ItemDTO getItem(String item_seq);
}
