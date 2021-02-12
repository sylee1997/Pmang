package talk.controller;


import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
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
@RequestMapping(value="talk")
public class TalkController {
	
	@Autowired
	private TalkService talkService;
	
		@RequestMapping(value="talkRoom",method=RequestMethod.GET)
		public ModelAndView talkRoom(@RequestParam String item_seq,
									 @RequestParam String partner_userId,//상대방 user_id
									 HttpSession session) {
	      	
			System.out.println("아이템 seq : "+item_seq);
			System.out.println("partner_userId : " + partner_userId);
			session.setAttribute("userId","hong");
			//session.setAttribute("userId", "gil");
			
			TalkRoomDTO talkRoomDTO = new TalkRoomDTO();
			talkRoomDTO.setItem_seq(Integer.parseInt(item_seq));
			talkRoomDTO.setPartner_userId(partner_userId);
			talkRoomDTO.setUserId((String) session.getAttribute("userId"));
			TalkRoomDTO getTalkRoomDTO = talkService.isRoom(talkRoomDTO);
			if (getTalkRoomDTO != null) {
				int talkRoom_seq = getTalkRoomDTO.getTalkRoom_seq();
				session.setAttribute("talkRoom_seq", talkRoom_seq);
			} else {
				session.setAttribute("talkRoom_seq", -1);
			}
			
			
			//판매글 제목, 가격, 상점명, 상대방아이디 - 아이템
			ItemDTO itemDTO = talkService.getItem(Integer.parseInt(item_seq));
	      
			//상대방 아이디로 프로필사진 가져오기 - 판매자
			//String partner_userId = itemDTO.getUserId();
			
			SellerDTO sellerDTO = talkService.getSeller(itemDTO.getUserId());
			
	      
			Map<String,Object> sellerItem = new HashMap<String,Object>();
			sellerItem.put("marketName", sellerDTO.getMarketname());
			sellerItem.put("pf_Photo", sellerDTO.getPf_photo());
			sellerItem.put("img1", itemDTO.getImg1());
			sellerItem.put("item_price", itemDTO.getItem_price());
			sellerItem.put("item_Subject", itemDTO.getItem_subject());
			//sellerItem.put("partner_userId", partner_userId);
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("sellerItem",sellerItem);
			mav.setViewName("/talk/talkRoom");
	      
			return mav;
	   }
	
		@RequestMapping(value = "getMessage", method=RequestMethod.POST)
		public ModelAndView getMessage(@RequestParam String partner_userId,
				HttpSession session) {
			
			//message가 존재한다면, message 가져오기
			Map<String,String> userMap = new HashMap<String,String>();
			
			userMap.put("userId", (String)session.getAttribute("userId"));
			userMap.put("partner_userId", partner_userId);
			
			List<MessageDTO> messageList = talkService.getMessage(userMap);
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("messageList",messageList);
			mav.setViewName("jsonView");
			return mav;
		}

	//List==============================================================
		
		@RequestMapping(value = "talkRoomList", method = RequestMethod.GET)
		public String talkRomList(HttpSession session) { // 톡 리스트로 넘어올때, 둘고와야할 데이터.
			// 임시 세션 저장.
			session.setAttribute("userId", "hong");
			return "/talk/talkRoomList";
		}
		
		@RequestMapping(value = "getRoomList", method = RequestMethod.POST)
		public ModelAndView getRomList(HttpSession session) { // 톡 리스트로 넘어올때, 둘고와야할 데이터.
			/* session ID 를 들고, DB에 갔다와야함. */
			session.setAttribute("userId", "hong");
			// 리스트 봅아내기
			String userId = (String) session.getAttribute("userId");
			System.out.println("userId: " + userId);
			List<TalkRoomDTO> list = talkService.getRoomList(userId);
			System.out.println("list갯수: " + list.size());
			// 리스트내용
			List<Map<String, Object>> mapList = new ArrayList<Map<String, Object>>();

			for (TalkRoomDTO talkRoomDTO : list) {
				int talkRoom_seq = talkRoomDTO.getTalkRoom_seq();// 방번호
				System.out.println(talkRoom_seq);
				String partner_userId = talkRoomDTO.getPartner_userId();// 상대방 유저아이디
				if (partner_userId.equals(userId)) {
					partner_userId = talkRoomDTO.getUserId();
				}
				System.out.println("partner_userId: " + partner_userId);

				Map<String, Object> map = new HashMap<String, Object>();
				// 방번호, 파트너유저아이디, 알람여부,
				map.put("talkRoom_seq", talkRoom_seq);
				map.put("partner_userId", partner_userId);
				map.put("notification_status", talkRoomDTO.getNotification_status());
				System.out.println("3");
				// 유저마켓이름, 프로필
				SellerDTO sellerDTO = talkService.getSeller(partner_userId);
				if (sellerDTO == null) {// 마켓네임이 없으면 일단 유저 아이디를 넣어놈
					map.put("marketname", partner_userId);
					map.put("pf_photo", "grayPmang.png");
				} else {
					map.put("marketname", sellerDTO.getMarketname());
					map.put("pf_photo", sellerDTO.getPf_photo());
				}
				// 마지막대화내용, 시간, item_seq
				MessageDTO messageDTO = talkService.getLastMessage(userId, talkRoom_seq);
				System.out.println("messageDTO : " + messageDTO);
				
				//여기부터 nullPoint
				try {
					if (messageDTO != null) {
						map.put("talk_content", messageDTO.getTalk_content());
						map.put("send_time", messageDTO.getSend_time().substring(11, 16));
						map.put("item_seq", messageDTO.getItem_seq());
						mapList.add(map);
						
						// 안읽은 메세지 갯수
						int unread_count = 0;
						// message가 존재한다면, message 가져오기
						Map<String, String> userMap = new HashMap<String, String>();
						
						userMap.put("userId", userId);
						userMap.put("partner_userId", partner_userId);
						
						List<MessageDTO> messageList = talkService.getMessage(userMap);
						String user_readtime = null;
						for (MessageDTO message : messageList) {
							if (user_readtime == null) {
								if (message.getUserId().equals(userId)) {
									if (message.getSender_user_id().equals(userId)) {
										user_readtime = message.getRead_time().replace(" ", "T");
									}
								}
							}else {
								break;
							}
						}
						if(user_readtime == null) {
							user_readtime = "2000-11-12T15:20:31.000";
						}
						System.out.println("user_readtime : "+user_readtime);
						LocalDateTime partner_readtime_time = LocalDateTime.parse(user_readtime);
						for (MessageDTO message : messageList) {
							// 상대방이 보낸 메세지의 readtime이 내가보낸 메세지의 sendtime보다 과거면 true반환
							if (message.getUserId().equals(userId)) {
								if (message.getReceiver_user_id().equals(userId)) {
									LocalDateTime partner_sendtime = LocalDateTime.parse(message.getSend_time().replace(" ", "T"));
									if(partner_readtime_time.isBefore(partner_sendtime)) {
										System.out.println("partner_sendtime: "+partner_sendtime);
										unread_count++;
									}
								}
							}
						}
						if(unread_count == 0) {
							map.put("unread_count", "");
						}else {               
							map.put("unread_count", unread_count);
						}
					}
					
				} catch (Exception e) {
					// TODO: handle exception
					System.out.println(e);
				}

			}

			// 리스트 보내기
			ModelAndView mav = new ModelAndView();
			mav.addObject("userId", userId);
			mav.addObject("mapList", mapList);
			mav.setViewName("jsonView");
			//
			return mav;
		}

		// 나가기
		@RequestMapping(value = "getOut", method = RequestMethod.POST)
		public String getOut(HttpSession session, @RequestParam String partner_userId) {
			System.out.println("userId : " + session.getAttribute("userId"));
			System.out.println("partner_userId : " + partner_userId);
			String userId = (String) session.getAttribute("userId");

			talkService.getOut(userId, partner_userId);
			return "/talk/talkRoomList";
		}
	
}
