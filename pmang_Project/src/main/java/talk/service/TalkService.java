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
	
	public SellerDTO getSellerInfoSearch(String item_seq);

	public ItemDTO getItemInfoSearch(String partner_userId);
	
	public String getPartnerUserId(int item_seq);

	
	//방리스트
	public List<TalkRoomDTO> getRoomList(String userId);

	//영은추가
	public SellerDTO getSeller(String partner_userId); //판매자

	public ItemDTO getItem(int item_seq); //item

	public MessageDTO getLastMessage(int talkRoom_seq); //마지막 메세지

}
