package talk.dao;

import java.util.List;

import talk.bean.TalkRoomDTO;

public interface TalkDAO {

	public TalkRoomDTO isRoom(TalkRoomDTO talkRoomDTO);
	
	public void createRoom(TalkRoomDTO talkRoomDTO);
	
	public List<TalkRoomDTO> getRoomList(String userId);

}
