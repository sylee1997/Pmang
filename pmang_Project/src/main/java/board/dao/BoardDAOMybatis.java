package board.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import board.bean.ItemDTO;
@Repository
@Transactional
public class BoardDAOMybatis implements BoardDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ItemDTO getItem(String item_seq) {
		return sqlSession.selectOne("boardSQL.getItem", item_seq);  
	}

}
