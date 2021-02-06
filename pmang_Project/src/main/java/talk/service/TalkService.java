package talk.service;

import java.util.List;

import talk.bean.TalkRoomDTO;

public interface TalkService {

	public TalkRoomDTO isRoom(TalkRoomDTO talkRoomDTO);
	
	public void createRoom(TalkRoomDTO talkRoomDTO);
	
	
	
	
	public List<TalkRoomDTO> getRoomList(String userId);
}
