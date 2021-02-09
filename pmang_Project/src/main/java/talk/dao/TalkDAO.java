package talk.dao;

import java.util.List;
import java.util.Map;

import board.bean.ItemDTO;
import member.bean.SellerDTO;
import talk.bean.MessageDTO;
import talk.bean.TalkRoomDTO;

public interface TalkDAO {

	public TalkRoomDTO isRoom(TalkRoomDTO talkRoomDTO);
	
	public void createRoom(TalkRoomDTO talkRoomDTO);
	
	public void insertMessage(MessageDTO messageDTO);
	
	public ItemDTO getItem(int item_seq);
	
	public SellerDTO getSeller(String partner_userId);
	
	public List<TalkRoomDTO> getRoomList(String userId);

	public MessageDTO getLastMessage(int talkRoom_seq);

}
