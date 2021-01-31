package board.dao;

import board.bean.ItemDTO;

public interface BoardDAO {

	public ItemDTO getItem(String item_seq);

}
