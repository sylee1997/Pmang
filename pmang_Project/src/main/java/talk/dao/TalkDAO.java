package talk.dao;

import java.util.List;

import talk.bean.TalkRoomDTO;

public interface TalkDAO {
	
	public Object getRoom(TalkRoomDTO talkRoomDTO);

	public List<TalkRoomDTO> getRoomList(String user_id);

	public void createRoom(TalkRoomDTO talkRoomDTO);

}
