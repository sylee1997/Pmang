package member.service;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import member.bean.MemberDTO;
import member.bean.ZipcodeDTO;

public interface MemberService {

	public String login(Map<String, String> map, HttpSession session);

	public int write(MemberDTO memberDTO);

	public String checkId(String userId);

	public List<ZipcodeDTO> checkPostSearch(Map<String, String> map);
	
	public void mailSendWithUserKey(String email1, String email2, String userId, HttpServletRequest request);

	public int regSuccess(String userId, String key);

	public String kakaoLogin(MemberDTO memberDTO, HttpSession session);
<<<<<<< HEAD
=======
	
	//-----------------------seller---------------------------//
	public void sellerWrite(ItemDTO itemDTO);


	public List<ZipcodeDTO> searchlocation(String address);


>>>>>>> d5fa777e772d693d7bee3e7a0711d1c4ece5e026
}
