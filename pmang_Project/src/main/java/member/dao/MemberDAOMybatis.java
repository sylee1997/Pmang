package member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import board.bean.ItemDTO;
import member.bean.ZipcodeDTO;

@Transactional
@Repository
public class MemberDAOMybatis implements MemberDAO {
	@Autowired
	private SqlSession sqlSession;
	@Override
	public void sellerWrite(ItemDTO itemDTO) {
		
		sqlSession.insert("memberSQL.sellerWrite", itemDTO);
	}
	
	@Override
	public List<ZipcodeDTO> searchlocation(String address) {
		List<ZipcodeDTO> list = sqlSession.selectList("memberSQL.searchlocation", address);
		System.out.println(list);
		return sqlSession.selectList("memberSQL.searchlocation", address);
	}
	
}
