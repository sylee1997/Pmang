package talk.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import board.bean.ItemDTO;
import member.bean.SellerDTO;
import talk.bean.MessageDTO;
import talk.bean.TalkRoomDTO;
import talk.service.TalkService;

@Controller
@RequestMapping(value = "talk")
public class TalkController {

	@Autowired
	private TalkService talkService;

	@RequestMapping(value = "talkRoom", method = RequestMethod.GET)
	public ModelAndView talkRoom(@RequestParam String item_seq, HttpSession session) {

		System.out.println("아이템 seq : " + item_seq);
		session.setAttribute("userId", "hong");

		// 판매글 제목, 가격, 상점명, 상대방아이디 - 아이템
		ItemDTO itemDTO = talkService.getItem(Integer.parseInt(item_seq));

		// 상대방 아이디로 프로필사진 가져오기 - 판매자
		String partner_userId = itemDTO.getUserId();
		SellerDTO sellerDTO = talkService.getSeller(partner_userId);

		Map<String, Object> sellerItem = new HashMap<String, Object>();
		sellerItem.put("marketName", sellerDTO.getMarketname());
		sellerItem.put("pf_Photo", sellerDTO.getPf_photo());
		sellerItem.put("img1", itemDTO.getImg1());
		sellerItem.put("item_price", itemDTO.getItem_price());
		sellerItem.put("item_Subject", itemDTO.getItem_subject());
		sellerItem.put("partner_userId", partner_userId);

		System.out.println(partner_userId);

		ModelAndView mav = new ModelAndView();
		mav.addObject("sellerItem", sellerItem);
		mav.setViewName("/talk/talkRoom");

		return mav;
	}

	@RequestMapping(value = "talkRoomList", method = RequestMethod.GET)
	public String talkRomList(HttpSession session) { // 톡 리스트로 넘어올때, 둘고와야할 데이터.
		// 임시 세션 저장.
		session.setAttribute("userId", "hong");
		// 리스트 봅아내기

		return "/talk/talkRoomList";
	}

	@RequestMapping(value = "getRoomList", method = RequestMethod.POST)
	public ModelAndView getRomList(HttpSession session) { // 톡 리스트로 넘어올때, 둘고와야할 데이터.
		/* session ID 를 들고, DB에 갔다와야함. */

		// 리스트 봅아내기
		String userId = (String) session.getAttribute("userId");

		List<TalkRoomDTO> list = talkService.getRoomList(userId);
		// 리스트내용
		List<Map<String, Object>> mapList = new ArrayList<Map<String, Object>>();

		for (TalkRoomDTO talkRoomDTO : list) {
			int talkRoom_seq = talkRoomDTO.getTalkRoom_seq();// 방번호
			String partner_userId = talkRoomDTO.getPartner_userId();// 상대방 유저아이디

			Map<String, Object> map = new HashMap<String, Object>();
			// 방번호, 파트너유저아이디, 알람여부,
			map.put("talkRoom_seq", talkRoom_seq);
			map.put("partner_userId", partner_userId);
			map.put("notification_status", talkRoomDTO.getNotification_status());

			// 유저마켓이름, 프로필
			SellerDTO sellerDTO = talkService.getSeller(partner_userId);

			if (sellerDTO.getMarketname() == null) {//마켓네임이 없으면 일단 유저 아이디를 넣어놈
				map.put("marketname", partner_userId);
			} else {
				map.put("marketname", sellerDTO.getMarketname());
			}
			map.put("pf_photo", sellerDTO.getPf_photo());
			// 마지막대화내용, 시간
			MessageDTO messageDTO = talkService.getLastMessage(talkRoom_seq);
			map.put("talk_content", messageDTO.getTalk_content());
			map.put("send_time", messageDTO.getSend_time());
			
			mapList.add(map);
		}

		// 리스트 보내기
		ModelAndView mav = new ModelAndView();
		mav.addObject("userId", userId);
		mav.addObject("mapList", mapList);
		mav.setViewName("jsonView");
		//
		return mav;
	}
}
