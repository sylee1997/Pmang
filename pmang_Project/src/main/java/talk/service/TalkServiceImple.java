package talk.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.bean.ItemDTO;
import member.bean.SellerDTO;
import talk.bean.MessageDTO;
import talk.bean.TalkRoomDTO;
import talk.dao.TalkDAO;

@Service
public class TalkServiceImple implements TalkService {
	@Autowired
	private TalkDAO talkDAO;
	
	@Override
	public TalkRoomDTO isRoom(TalkRoomDTO talkRoomDTO) {
		return talkDAO.isRoom(talkRoomDTO);
	}
	
	@Override
	public void createRoom(TalkRoomDTO talkRoomDTO) {
		talkDAO.createRoom(talkRoomDTO);
	}

	@Override
	public void insertMessage(MessageDTO messageDTO) {
		talkDAO.insertMessage(messageDTO);
	}


	@Override
	public ItemDTO getItem(int item_seq) {
		return talkDAO.getItem(item_seq);
	}

	@Override
	public SellerDTO getSeller(String partner_userId) {
		return talkDAO.getSeller(partner_userId);
	}

	
	@Override
	public List<TalkRoomDTO> getRoomList(String userId) {
		return talkDAO.getRoomList(userId);
	}

	@Override
	public MessageDTO getLastMessage(int talkRoom_seq) {
		return talkDAO.getLastMessage(talkRoom_seq);
	}
	
}
