package board.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.bean.ItemDTO;
import board.dao.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDAO boardDAO;
	/*
	 * @Autowired private HttpSession session;
	 */
	
	@Override
	public ItemDTO getItem(String item_seq) {
		return boardDAO.getItem(item_seq);
	}

}
