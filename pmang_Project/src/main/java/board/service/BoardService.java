package board.service;

import java.util.Map;

import board.bean.ReviewDTO;
import member.bean.SellerDTO;

public interface BoardService {
	public void reviewWrite(ReviewDTO reviewdto);

	public void profileImgModify(SellerDTO sellerDTO);

	public SellerDTO getMystore(int userkey);

	public void mystoreHitUpdate(int userkey);

	public void mystoreModify(Map<String, String> map);
}
