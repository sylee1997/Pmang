package board.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.bean.ReviewDTO;
import board.dao.MystoreDAO;
import member.bean.SellerDTO;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	private MystoreDAO mystoreDAO;
	
	@Override
	public void reviewWrite(ReviewDTO reviewdto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void profileImgModify(SellerDTO sellerDTO) {
		// TODO Auto-generated method stub
		mystoreDAO.profileImgModify(sellerDTO);
	}

	@Override
	public SellerDTO getMystore(int userkey) {
		
		
		
		return mystoreDAO.getMystore(userkey);
	}

	@Override
	public void mystoreHitUpdate(int userkey) {
		mystoreDAO.mystoreHitUpdate(userkey);
		
		
	}

	@Override
	public void mystoreModify(Map<String, String> map) {
		mystoreDAO.mystoreModify(map);
	}

}
