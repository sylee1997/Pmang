package board.dao;

import java.util.List;
import java.util.Map;

import board.bean.ItemDTO;
import board.bean.ReviewDTO;
import board.bean.WishDTO;
import member.bean.SellerDTO;

public interface MystoreDAO {

	public void profileImgModify(SellerDTO sellerDTO);

	public SellerDTO getMystore(int userkey);

	public void mystoreHitUpdate(int userkey);

	public void mystoreModify(Map<String, String> map);

	public List<ItemDTO> getMystoreItemList(Map<String, Integer> map);

	public List<WishDTO> getMystoreWishList(Map<String, Integer> map);

	public void wishListDelete(Map<String, Object> map);

	public List<ReviewDTO> getMystoreReviewList(Map<String, Integer> map);

	public String getMystoreItemCnt(int userkey);

	public String getMystoreWishCnt(int userkey);

	public String getMystoreReviewCnt(int userkey);

	public List<ItemDTO> getMystoreItemPopularList(Map<String, Integer> map);

	public List<ItemDTO> getMystoreItemLowerPriceList(Map<String, Integer> map);

	public List<ItemDTO> getMystoreItemHighestPriceList(Map<String, Integer> map);

	public List<ItemDTO> getMystoreWishPopularList(Map<String, Integer> map);

	public List<ItemDTO> getMystoreWishHighestPriceList(Map<String, Integer> map);

	public List<ItemDTO> getMystoreWishLowerPriceList(Map<String, Integer> map);

}
