package board.dao;

import java.util.Map;

import member.bean.SellerDTO;

public interface MystoreDAO {

	public void profileImgModify(SellerDTO sellerDTO);

	public SellerDTO getMystore(int userkey);

	public void mystoreHitUpdate(int userkey);

	public void mystoreModify(Map<String, String> map);

}
