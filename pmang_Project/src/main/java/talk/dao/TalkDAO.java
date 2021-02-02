package talk.dao;

import java.util.List;

import talk.bean.TalkRoomDTO;

public interface TalkDAO {

	List<TalkRoomDTO> getRoomList(String user_id);

}
