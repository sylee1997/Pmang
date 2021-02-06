package talk.service;

import java.util.List;
import java.util.Map;

import board.bean.ItemDTO;
import member.bean.SellerDTO;
import talk.bean.MessageDTO;
import talk.bean.TalkRoomDTO;

public interface TalkService {

	public TalkRoomDTO isRoom(TalkRoomDTO talkRoomDTO);
	
	public void createRoom(TalkRoomDTO talkRoomDTO);
	
	public void insertMessage(MessageDTO messageDTO);
	
	public SellerDTO getSellerInfoSearch(String partner_userId);

	public ItemDTO getItemInfoSearch(String partner_userId);
	
	public String getPartnerUserId(int item_seq);

	public List<TalkRoomDTO> getRoomList(String userId);

}
