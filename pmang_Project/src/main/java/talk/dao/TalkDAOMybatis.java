package talk.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import board.bean.ItemDTO;
import member.bean.SellerDTO;
import talk.bean.MessageDTO;
import talk.bean.TalkRoomDTO;

@Repository
@Transactional
public class TalkDAOMybatis implements TalkDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public TalkRoomDTO isRoom(TalkRoomDTO talkRoomDTO) {
		return sqlSession.selectOne("talkSQL.isRoom", talkRoomDTO);
	}
	
	@Override
	public void createRoom(TalkRoomDTO talkRoomDTO) {
		sqlSession.insert("talkSQL.createRoom",talkRoomDTO);
	}
	
	@Override
	public void insertMessage(MessageDTO messageDTO) {
		sqlSession.insert("talkSQL.insertMessage",messageDTO);
	}

	@Override
	public ItemDTO getItem(int item_seq) {
		return sqlSession.selectOne("talkSQL.getItem",item_seq);
	}
	
	@Override
	public SellerDTO getSeller(String partner_userId) {
		try {
			return sqlSession.selectOne("talkSQL.getSeller", partner_userId);         
		} catch (Exception e) {
			return null;
		}
	}



	@Override
	public List<TalkRoomDTO> getRoomList(String userId) {
		return sqlSession.selectList("talkSQL.getRoomList", userId);
	}

	@Override
	public MessageDTO getLastMessage(String userId, int talkRoom_seq) { //마지막 메세지
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("talkRoom_seq", talkRoom_seq);
		try {
			return sqlSession.selectOne("talkSQL.getLastMessage", map);			
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public List<MessageDTO> getMessage(Map<String, String> userMap) {
		return sqlSession.selectList("talkSQL.getMessage", userMap);
	}

	@Override
	public String getReceiver_read_time(String sender_user_id, String receiver_user_id) {
		// receiver_user의 on/off_line 확인
		
		// receiver_user가 sender_user에게 send한 메세지를 조회해야함
		// off_line: send한 메세지가 없는 경우 ,send한 메세지의 read_time이 null값이 아닌 경우
		// on_line: send한 메세지의 read_time이 null값인 경우
		// 
		// send한 메세지의 read_time
		Map<String, String> map = new HashMap<String, String>();
		map.put("sender_user_id", sender_user_id);
		map.put("receiver_user_id", receiver_user_id);
		
		try {
			return sqlSession.selectOne("talkSQL.getReceiver_read_time", map);
		} catch (Exception e) {
			return "안읽음";
		}
		
	}
	
	@Override
	public int getUnread_count(int talkRoom_seq) {
		//TODO
		return 0;
	}
	
	@Override
	public void setOpen(Object userId, Object talkRoom_seq) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("talkRoom_seq", talkRoom_seq);
		
		sqlSession.update("talkSQL.setOpen", map);
	}

	@Override
	public void setClose(Object userId, Object talkRoom_seq) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("talkRoom_seq", talkRoom_seq);
		
		sqlSession.update("talkSQL.setClose", map);
	}

	@Override
	public void getOut(String userId, String partner_userId) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("partner_userId", partner_userId);
		sqlSession.delete("talkSQL.getOut", map);
	}

}
