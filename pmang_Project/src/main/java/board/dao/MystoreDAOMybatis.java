package board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import board.bean.ItemDTO;
import board.bean.ReviewDTO;
import board.bean.WishDTO;
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

	@Override
	public List<ItemDTO> getMystoreItemList(Map<String, Integer> map) {
		return sqlSession.selectList("mystoreSQL.getMystoreItemList",map);
	}

	@Override
	public List<WishDTO> getMystoreWishList(Map<String, Integer> map) {
		return sqlSession.selectList("mystoreSQL.getMystoreWishList",map);
		
	}

	@Override
	public void wishListDelete(Map<String, Object> map) {
		sqlSession.delete("mystoreSQL.wishListDelete",map);
	}

	@Override
	public List<ReviewDTO> getMystoreReviewList(Map<String, Integer> map) {
		return sqlSession.selectList("mystoreSQL.getMystoreReviewList",map);
	}

	@Override
	public String getMystoreItemCnt(int userkey) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mystoreSQL.getMystoreItemCnt",userkey);
	}

	@Override
	public String getMystoreWishCnt(int userkey) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mystoreSQL.getMystoreWishCnt",userkey);
	}

	@Override
	public String getMystoreReviewCnt(int userkey) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mystoreSQL.getMystoreReviewCnt",userkey);
	}

	@Override
	public List<ItemDTO> getMystoreItemPopularList(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mystoreSQL.getMystoreItemPopularList",map);
	}

	@Override
	public List<ItemDTO> getMystoreItemLowerPriceList(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mystoreSQL.getMystoreItemlowerPriceList",map);
	}

	@Override
	public List<ItemDTO> getMystoreItemHighestPriceList(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mystoreSQL.getMystoreItemHighestPriceList",map);
	}

	@Override
	public List<ItemDTO> getMystoreWishPopularList(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mystoreSQL.getMystoreWishPopularList",map);
	}

	@Override
	public List<ItemDTO> getMystoreWishHighestPriceList(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mystoreSQL.getMystoreWishHighestPriceList",map);
	}

	@Override
	public List<ItemDTO> getMystoreWishLowerPriceList(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("mystoreSQL.getMystoreWishLowerPriceList",map);
	}
}
