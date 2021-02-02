package member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import board.bean.ItemDTO;

import member.dao.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {



	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public void sellerWrite(ItemDTO itemDTO) {
		memberDAO.sellerWrite(itemDTO);
	}
	

}
