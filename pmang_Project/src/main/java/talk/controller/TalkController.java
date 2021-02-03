package talk.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import talk.bean.TalkRoomDTO;
import talk.service.TalkService;

@Controller
@RequestMapping(value="talk")
public class TalkController {
	
	@Autowired
	private TalkService talkService;
	
	
	@RequestMapping(value="roomList",method=RequestMethod.GET)
	public String roomList(HttpSession session) { //톡 리스트로 넘어올때, 둘고와야할 데이터.
		/* session ID 를 들고, DB에 갔다와야함. */
		//임시 세션 저장.
		session.setAttribute("memId", "hong");
		//
		//리스트 봅아내기
		String userId = (String) session.getAttribute("memId");
		//List<TalkRoomDTO> list = talkService.getRoomList(userId);
		
		return "/talk/talkRoomList";
	}
}
