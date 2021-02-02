package board.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import member.bean.SellerDTO;

@Transactional
@Repository
public class MystoreDAOMybatis implements MystoreDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void profileImgModify(SellerDTO sellerDTO) {
		sqlSession.update("mystoreSQL.profileImgModify", sellerDTO);

	}

	@Override
	public SellerDTO getMystore(int userkey) {
		
		return sqlSession.selectOne("mystoreSQL.getMystore",userkey);
	}

	@Override
	public void mystoreHitUpdate(int userkey) {
		sqlSession.update("mystoreSQL.mystoreHitUpdate",userkey);
		
	}

	@Override
	public void mystoreModify(Map<String, String> map) {
		sqlSession.update("mystoreSQL.mystoreModify",map);
	}
}
