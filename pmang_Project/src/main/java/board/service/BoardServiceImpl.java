package board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.bean.ItemDTO;
import board.dao.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDAO boardDAO;
	
	@Override
	public List<ItemDTO> getItemBoardList(Map<String, String> map) {
		
		return boardDAO.getItemBoardList(map);
	}

	@Override
	public List<Object> getItemBoardCount(Map<String, String> map) {
		return boardDAO.getItemBoardCount(map);
	}

}

