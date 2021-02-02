package member.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


import board.bean.ItemDTO;

@Transactional
@Repository
public class MemberDAOMybatis implements MemberDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void sellerWrite(ItemDTO itemDTO) {
		
		sqlSession.insert("memberSQL.sellerWrite", itemDTO);
	}
	

}
