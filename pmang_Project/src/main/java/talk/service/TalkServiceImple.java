package talk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import talk.bean.TalkRoomDTO;
import talk.dao.TalkDAO;

public class TalkServiceImple implements TalkService {
	@Autowired
	private TalkDAO talkDAO;
	
	@Override
	public List<TalkRoomDTO> getRoomList(String user_id) {

		return talkDAO.getRoomList(user_id);
	}

}
