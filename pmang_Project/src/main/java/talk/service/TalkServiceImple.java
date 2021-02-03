package talk.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import talk.bean.TalkRoomDTO;
import talk.dao.TalkDAO;

@Service
public class TalkServiceImple implements TalkService {
	@Autowired
	private TalkDAO talkDAO;
	
	@Override
	public List<TalkRoomDTO> getRoomList(String userId) {

		return talkDAO.getRoomList(userId);
	}

}
