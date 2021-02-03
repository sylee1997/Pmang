package talk.service;

import java.util.List;

import talk.bean.TalkRoomDTO;

public interface TalkService {

	List<TalkRoomDTO> getRoomList(String userId);

}
