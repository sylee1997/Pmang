package board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import board.bean.ItemDTO;

@Transactional
@Repository
public class BoardDAOMybatis implements BoardDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<ItemDTO> getItemBoardList(Map<String, String> map) {
		return sqlSession.selectList("boardSQL.getItemBoardList", map);
	}

	@Override
	public List<Object> getItemBoardCount(Map<String, String> map) {
		System.out.println(map.get("category1"));
		System.out.println(map.get("category2"));
		if(map.get("category2") == null) {
			return sqlSession.selectList("boardSQL.getItemBoardCount1", map);
		}else {
			return sqlSession.selectList("boardSQL.getItemBoardCount2", map);
		}
		
	}
	
	@Override
	public int getEntireItemNum(Map<String, String> map) {
		return sqlSession.selectOne("boardSQL.getEntireItemNum", map);

	}

	@Override
	public List<Object> getOrderbyItem(Map<String, String> map) {
		return sqlSession.selectList("boardSQL.getOrderbyItem", map);
	}

}
