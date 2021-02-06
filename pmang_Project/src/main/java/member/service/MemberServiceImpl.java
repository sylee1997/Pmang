package member.service;

import java.util.List;

import java.util.Map;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;


import member.bean.MemberDTO;
import member.bean.ZipcodeDTO;


import board.bean.ItemDTO;


import member.dao.MemberDAO;

import board.bean.ItemDTO;

@Service
public class MemberServiceImpl implements MemberService {



	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private JavaMailSender mailSender;

	// �궃�닔瑜� �씠�슜�븳 �궎 �깮�꽦
	private boolean lowerCheck;
	private int size;
	
	@Override
	public String login(Map<String, String> map, HttpSession session) {
		MemberDTO memberDTO = memberDAO.login(map);
		if(memberDTO == null) { // 濡쒓렇�씤 �빐�떦�븘�씠�뵒媛� �엳�떎 / �뾾�떎, 由ы꽩 �뒪�듃留곴컪�쓣 湲곕떎由ш퀬�엳湲곕븣臾몄뿉
			return "fail";
		}else {
			session.setAttribute("memUserName", memberDTO.getUserName());
			session.setAttribute("memUserId", map.get("userId"));
			session.setAttribute("memEmail", memberDTO.getEmail1()+"@"+memberDTO.getEmail2());
			
			return "success";
		}
		

		
	}

	@Override
	public int write(MemberDTO memberDTO) {
		return memberDAO.write(memberDTO);
	}
	@Override
	public String checkId(String userId) {
		MemberDTO memberDTO = memberDAO.checkId(userId);
		if(memberDTO == null)
			return "non_exist";
		else
			return "exist";
	}
	@Override
	public List<ZipcodeDTO> checkPostSearch(Map<String, String> map) {
		return memberDAO.checkPostSearch(map);
	}

	// �씠硫붿씪 �궃�닔 留뚮뱶�뒗 硫붿꽌�뱶
	private String init() {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;

		do {
			num = ran.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				sb.append((char) num);
			} else {
				continue;
			}

		} while (sb.length() < size);
		if (lowerCheck) {
			return sb.toString().toLowerCase();
		}
		return sb.toString();
	}



	public String getKey(boolean lowerCheck, int size) {
		this.lowerCheck = lowerCheck;
		this.size = size;
		return init();
	}
	@Override
	public void mailSendWithUserKey(String email1, String email2, String userId, HttpServletRequest request) {
		String email = email1+"@"+email2;
		String key = getKey(false, 20);
		memberDAO.GetKey(userId, key);
		MimeMessage mail = mailSender.createMimeMessage();
		String htmlStr = "<h2>�븞�뀞�븯�꽭�슂 MS :p �뵾留앸쭏耳�~ �엯�땲�떎!</h2><br><br>" 
				+ "<h3>" + userId + "�떂</h3>" + "<p>�씤利앺븯湲� 踰꾪듉�쓣 �늻瑜댁떆硫� 濡쒓렇�씤�쓣 �븯�떎 �닔 �엳�뒿�땲�떎 : " 
				+ "<a href='http://localhost:8080" + request.getContextPath() + "/member/regSuccess?userId="+ userId +"&user_key="+key+"'>�씤利앺븯湲�</a></p>"
				+ "(�샊�떆 �옒紐� �쟾�떖�맂 硫붿씪�씠�씪硫� �씠 �씠硫붿씪�쓣 臾댁떆�븯�뀛�룄 �맗�땲�떎)";
		try {
			mail.setSubject("[蹂몄씤�씤利�] MS :p �뵾留앸쭏耳볦쓽 �씤利앸찓�씪�엯�땲�떎", "utf-8");
			mail.setText(htmlStr, "utf-8", "html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(email));
			
			mailSender.send(mail);
		} catch (MessagingException e) {
			e.printStackTrace();
		}	
		
	}
	@Override
	public int regSuccess(String userId, String key) {
		
		int resultCnt = 0;
		
		resultCnt = memberDAO.regSuccess(userId, key);
		
		return resultCnt;
		
		
	}
	@Override
	public String kakaoLogin(MemberDTO memberDTO, HttpSession session) {
		// 移댁뭅�삤 �쉶�썝媛��엯, 濡쒓렇�씤
		
		int count = memberDAO.checkKakaoId(memberDTO.getKakaoId());

		//濡쒓렇�씤
		if(count > 0) {	
			session.setAttribute("memUserId", memberDTO.getUserName());
			session.setAttribute("memEmail", memberDTO.getEmail1()+"@"+memberDTO.getEmail2());
			return "loginSuccess";
		} else {
		//�쉶�썝媛��엯	
			int success = memberDAO.kakaoWrite(memberDTO);
			return "JoinSuccess";
		}
		
		
	}
		

	//-------------------------seller-----------------------------------//
	
	@Override
	public void sellerWrite(ItemDTO itemDTO) {
		memberDAO.sellerWrite(itemDTO);
	}


	@Override
	public List<ZipcodeDTO> searchlocation(String address) {
		return memberDAO.searchlocation(address);
	}


}
	

