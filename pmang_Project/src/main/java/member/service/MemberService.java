package member.service;

import java.util.List;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import member.bean.MemberDTO;


import board.bean.ItemDTO;

import member.bean.ZipcodeDTO;

public interface MemberService {

	public String login(Map<String, String> map, HttpSession session);

	public int write(MemberDTO memberDTO);

	public String checkId(String userId);

	public List<ZipcodeDTO> checkPostSearch(Map<String, String> map);
	
	public void mailSendWithUserKey(String email1, String email2, String userId, HttpServletRequest request);

	public int regSuccess(String userId, String key);

	public String kakaoLogin(MemberDTO memberDTO, HttpSession session);

	public List<ZipcodeDTO> searchlocation(String address);

}
