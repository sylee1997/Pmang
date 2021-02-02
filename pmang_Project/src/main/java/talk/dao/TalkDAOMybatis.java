package talk.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import talk.bean.TalkRoomDTO;

public class TalkDAOMybatis implements TalkDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<TalkRoomDTO> getRoomList(String user_id) {
		return sqlSession.selectList("talkSQL.getRoomList", user_id);
	}

}
