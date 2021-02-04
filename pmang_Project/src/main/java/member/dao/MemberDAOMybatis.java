package member.dao;

<<<<<<< HEAD
import java.util.HashMap;
import java.util.List;
import java.util.Map;
=======
import java.util.List;
>>>>>>> refs/heads/main

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

<<<<<<< HEAD
import member.bean.MemberDTO;
=======
import board.bean.ItemDTO;
>>>>>>> refs/heads/main
import member.bean.ZipcodeDTO;

@Repository
@Transactional
public class MemberDAOMybatis implements MemberDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public MemberDTO login(Map<String, String> map) {
		return sqlSession.selectOne("memberSQL.login", map);
	}

	@Override
	public int write(MemberDTO memberDTO) {
		return sqlSession.insert("memberSQL.write", memberDTO);
	}

	@Override
	public MemberDTO checkId(String userId) {
		return sqlSession.selectOne("memberSQL.checkId", userId);
	}

	@Override
	public List<ZipcodeDTO> checkPostSearch(Map<String, String> map) {
		return sqlSession.selectList("memberSQL.checkPostSearch", map);
	}

	@Override
	public int GetKey(String userId, String user_key) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("user_key", user_key);
		return sqlSession.update("memberSQL.GetKey", map);
		
	}

	@Override
	public int regSuccess(String userId, String user_key) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("user_key", user_key); System.out.println(user_key);
		return sqlSession.update("memberSQL.regSuccess", map);
	}

	
	@Override
	public int checkKakaoId(String kakaoId) {
		return sqlSession.selectOne("memberSQL.checkKakaoId", kakaoId);
	}
	
	@Override
	public int kakaoWrite(MemberDTO memberDTO) {
		return sqlSession.insert("memberSQL.kakaoWrite", memberDTO);
	}

	
	@Override
	public List<ZipcodeDTO> searchlocation(String address) {
		List<ZipcodeDTO> list = sqlSession.selectList("memberSQL.searchlocation", address);
		System.out.println(list);
		return sqlSession.selectList("memberSQL.searchlocation", address);
	}
	
}
