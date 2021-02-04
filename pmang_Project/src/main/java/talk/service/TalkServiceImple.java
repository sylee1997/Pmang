package talk.service;

<<<<<<< HEAD
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import talk.bean.TalkRoomDTO;
import talk.dao.TalkDAO;

public class TalkServiceImple implements TalkService {
	@Autowired
	private TalkDAO talkDAO;
	
	@Override
	public Object isRoom(TalkRoomDTO talkRoomDTO) {
		return  talkDAO.getRoom(talkRoomDTO);
	}
	@Override
	public List<TalkRoomDTO> getRoomList(String user_id) {
		return talkDAO.getRoomList(user_id);
	}
	@Override
	public void createRoom(TalkRoomDTO talkRoomDTO) {
		talkDAO.createRoom(talkRoomDTO);
	}

=======
public class TalkServiceImple implements TalkService {
>>>>>>> branch 'temp' of https://github.com/sylee1997/Pmang.git

}
