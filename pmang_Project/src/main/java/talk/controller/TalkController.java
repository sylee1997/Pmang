package talk.controller;


import java.util.HashMap;
import java.util.List;
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
import talk.bean.TalkRoomDTO;
import talk.service.TalkService;

@Controller
@RequestMapping(value="talk")
public class TalkController {
	
	@Autowired
	private TalkService talkService;
	
	@RequestMapping(value="talkRoom",method=RequestMethod.GET)
		public ModelAndView talkRoom(@RequestParam String item_seq, HttpSession session) {
	      
			System.out.println("아이템 seq : "+item_seq);
			session.setAttribute("userId","hong");
	      
			//판매글 제목, 가격, 상점명, 상대방아이디 - 아이템
			ItemDTO itemDTO = talkService.getItem(Integer.parseInt(item_seq));
	      
			//상대방 아이디로 프로필사진 가져오기 - 판매자
			String partner_userId = itemDTO.getUserId();
			SellerDTO sellerDTO = talkService.getSeller(partner_userId);
	      
			Map<String,Object> sellerItem = new HashMap<String,Object>();
			sellerItem.put("marketName", sellerDTO.getMarketname());
			sellerItem.put("pf_Photo", sellerDTO.getPf_photo());
			sellerItem.put("img1", itemDTO.getImg1());
			sellerItem.put("item_price", itemDTO.getItem_price());
			sellerItem.put("item_Subject", itemDTO.getItem_subject());
			sellerItem.put("partner_userId", partner_userId);
	      
			System.out.println(partner_userId);
	      
			ModelAndView mav = new ModelAndView();
			mav.addObject("sellerItem",sellerItem);
			mav.setViewName("/talk/talkRoom");
	      
			return mav;
	   }

	
	@RequestMapping(value="talkRoomList",method=RequestMethod.GET)
	public ModelAndView roomList(HttpSession session) { //톡 리스트로 넘어올때, 둘고와야할 데이터.
		/* session ID 를 들고, DB에 갔다와야함. */
		//임시 세션 저장.
		session.setAttribute("memId", "hong");
		//
		//리스트 봅아내기
		String userId = (String) session.getAttribute("userId");
		
		List<TalkRoomDTO> list = talkService.getRoomList(userId);
		//리스트 보내기
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("/talk/talkRoomList");
		
		return mav;
	}
	
	
	
}
