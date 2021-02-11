package talk.dao;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections4.map.HashedMap;
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
	public SellerDTO getSellerInfoSearch(String partner_userId) {
		return sqlSession.selectOne("talkSQL.getSellerInfoSearch",partner_userId);
	}

	@Override
	public ItemDTO getItemInfoSearch(String partner_userId) {
		return sqlSession.selectOne("talkSQL.getItemInfoSearch",partner_userId);
	}
	
	@Override
	public String getPartnerUserId(int item_seq) {
		return sqlSession.selectOne("talkSQL.getPartnerUserId", item_seq);
	}

	
	//방리스트
	@Override
	public List<TalkRoomDTO> getRoomList(String userId) {
		return sqlSession.selectList("talkSQL.getRoomList", userId);
	}

	//영은
	@Override
	public ItemDTO getItem(int item_seq) { //아이템
		return sqlSession.selectOne("talkSQL.getItem", item_seq);
	}

	@Override
	public SellerDTO getSeller(String partner_userId) { //판매자
		return sqlSession.selectOne("talkSQL.getSeller", partner_userId);
	}

	@Override
	public MessageDTO getLastMessage(int talkRoom_seq) { //마지막 메세지
		return sqlSession.selectOne("talkSQL.getLastMessage", talkRoom_seq);
	}
}
