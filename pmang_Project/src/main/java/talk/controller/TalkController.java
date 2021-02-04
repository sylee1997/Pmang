package talk.controller;


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
import talk.bean.TalkRoomDTO;
import talk.service.TalkService;

@Controller
@RequestMapping(value="talk")
public class TalkController {
	
	@Autowired
	private TalkService talkService;
	
	@RequestMapping(value="talkRoom",method=RequestMethod.GET)
	public ModelAndView talkRoom(HttpSession session, @RequestParam Map<String,Object> map) {
		
		session.setAttribute("item_seq", 123);//임시세션넘버
		
		TalkRoomDTO talkRoomDTO = new TalkRoomDTO();
		talkRoomDTO.setItem_seq((Integer) map.get("item_seq"));
		talkRoomDTO.setPartner_userId((String) map.get("partner_userId"));
		talkRoomDTO.setUserId((String) session.getAttribute("userId"));
		
		
		
		TalkRoomDTO getTalkRoomDTO = talkService.isRoom(talkRoomDTO);
		if(getTalkRoomDTO == null) {
			talkService.createRoom(talkRoomDTO);
		}
		TalkRoomDTO room = talkService.isRoom(talkRoomDTO);
		
		//상점명,pf_Photo ->item_seq 를 통해서 userKey를 빼오고, userkey로 상점명,pf_Photo 검색.
		
		//상품이미지 img1/img2/img3,상품 가격 item_price,상품 제목 itemSubject
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("room",room);
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
