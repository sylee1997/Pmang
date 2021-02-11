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
	public SellerDTO getSellerInfoSearch(String partner_userId) {
		return talkDAO.getSellerInfoSearch(partner_userId);
	}

	@Override
	public ItemDTO getItemInfoSearch(String partner_userId) {
		return talkDAO.getItemInfoSearch(partner_userId);
	}
	
	@Override
	public String getPartnerUserId(int item_seq) {
		return talkDAO.getPartnerUserId(item_seq);
	}
	
	//방리스트
	@Override
	public List<TalkRoomDTO> getRoomList(String userId) {	
		return talkDAO.getRoomList(userId);
	}


	//영은
	@Override
	public ItemDTO getItem(int item_seq) { //item
		return talkDAO.getItem(item_seq);
	}
	
	@Override
	public SellerDTO getSeller(String partner_userId) { //판매자
		return talkDAO.getSeller(partner_userId);
	}

	@Override
	public MessageDTO getLastMessage(int talkRoom_seq) { //마지막 메세지
		return talkDAO.getLastMessage(talkRoom_seq);
	}

	
}
