package talk.service;

import java.util.List;

import talk.bean.MessageDTO;
import talk.bean.TalkRoomDTO;

public interface TalkService {

	public TalkRoomDTO isRoom(TalkRoomDTO talkRoomDTO);
	
	public void createRoom(TalkRoomDTO talkRoomDTO);
	
	public void insertMessage(MessageDTO messageDTO);
	
	public List<TalkRoomDTO> getRoomList(String userId);

}
