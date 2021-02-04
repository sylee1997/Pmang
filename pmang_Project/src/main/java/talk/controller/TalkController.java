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

import talk.bean.TalkRoomDTO;
import talk.service.TalkService;

@Controller
@RequestMapping(value = "talk")
public class TalkController {
	@Autowired
	private TalkService talkService;

	@RequestMapping(value = "talkRoom", method = RequestMethod.GET)
	public ModelAndView talkRoom(HttpSession session, @RequestParam Map<String, Object> map) {
		TalkRoomDTO talkRoomDTO = new TalkRoomDTO();
		talkRoomDTO.setItem_seq((Integer) map.get("item_seq"));
		talkRoomDTO.setPartner_userId((String) map.get("partner_userId"));
		talkRoomDTO.setUserId((String) session.getAttribute("userId"));
		
		TalkRoomDTO getTalkRoomDTO = (TalkRoomDTO) talkService.isRoom(talkRoomDTO);
		if(getTalkRoomDTO == null) { //톡룸이 생성되지 않았을 경우 생성해줌
			talkService.createRoom(talkRoomDTO);
		}
		TalkRoomDTO room = (TalkRoomDTO) talkService.isRoom(talkRoomDTO);
		
		//상품이미지 img1,img2,img3, 가격 itemPrice, 제목 itemSubject
		//마켓명
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("room", room);
		
		mav.setViewName("/talk/talkRoom");
		
		
		
		return mav;
	}

	@RequestMapping(value = "roomList", method = RequestMethod.POST)
	public String roomList(HttpSession session) { // 톡 리스트로 넘어올때, 둘고와야할 데이터.
		/* session ID 를 들고, DB에 갔다와야함. */
		// 임시 세션 저장.
		session.setAttribute("memId", "hong");
		//
		// 리스트 봅아내기
		String user_id = (String) session.getAttribute("memId");
		List<TalkRoomDTO> list = talkService.getRoomList(user_id);

		return "/talk/roomList";
	}

}
