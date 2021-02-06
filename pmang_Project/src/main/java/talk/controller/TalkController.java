package talk.controller;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import board.bean.ItemDTO;
import member.bean.SellerDTO;
import talk.service.TalkService;

@Controller
@RequestMapping(value="talk")
public class TalkController {
	
	@Autowired
	private TalkService talkService;
	
	@RequestMapping(value="talkRoom",method=RequestMethod.GET)
	public ModelAndView talkRoom(HttpSession session, @RequestParam Map<String,String> map) {
		
		int item_seq = (Integer) session.getAttribute("item_seq");//세션에 저장되어있는 item_seq
		String userId = (String) session.getAttribute("userId");//세션에 로그인되어있는 아이디
		
		String partner_userId = talkService.getPartnerUserId(item_seq);
		
		//marketName,pf_Photo -> seller table
		SellerDTO sellerDTO = talkService.getSellerInfoSearch(partner_userId);
		//상품이미지 img1(대표사진 1개만),item_price,item_Subject
		ItemDTO itemDTO = talkService.getItemInfoSearch(partner_userId);
		
		Map<String,Object> sellerItem = new HashMap<String,Object>();
		sellerItem.put("marketName", sellerDTO.getMarketname());
		sellerItem.put("pf_Photo", sellerDTO.getPf_photo());
		sellerItem.put("img1", itemDTO.getImg1());
		sellerItem.put("item_price", itemDTO.getItem_price());
		sellerItem.put("item_Subject", itemDTO.getItem_subject());
		sellerItem.put("partner_userId", partner_userId);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("sellerItem",sellerItem);
		mav.setViewName("/talk/talkRoom");
		
		return mav;
	}
	
	
	
	@RequestMapping(value="roomList",method=RequestMethod.GET)
	public String roomList(HttpSession session) { //톡 리스트로 넘어올때, 둘고와야할 데이터.
		/* session ID 를 들고, DB에 갔다와야함. */
		//임시 세션 저장.
		session.setAttribute("memId", "hong");
		//
		//리스트 봅아내기
		String userId = (String) session.getAttribute("userId");
		//List<TalkRoomDTO> list = talkService.getRoomList(userId);
		
		return "/talk/talkRoomList";
	}
}
