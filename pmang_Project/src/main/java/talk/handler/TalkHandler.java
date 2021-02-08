package talk.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import talk.bean.MessageDTO;
import talk.bean.TalkRoomDTO;
import talk.service.TalkService;


public class TalkHandler extends TextWebSocketHandler {
	
	Logger log = LoggerFactory.getLogger(TalkHandler.class);
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	@Autowired
	private TalkService talkService;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.add(session);//클라이언트가 접속할 때, session 정보를 sessionList에 저장
		
		System.out.println("afterConnectionEstablished session : " + session);
		System.out.println("afterConnectionEstablished 연결됨 ");// 테이블이 생성되면  session.getId()
	}//클라이언트가 서버에 접속했을 때, 실행된다
	
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		//데이터 찍어보기
		System.out.println("handleTextMessage session : " + session);
		System.out.println("handleTextMessage message : " + message);
		System.out.println("message.getPayload() : " + message.getPayload());
		
		Map<String, Object> httpSessionMap = session.getAttributes();
		
		//객체담기
		MessageDTO messageDTO = MessageDTO.convertMessage(message.getPayload());//메세지로 넘어온 데이터 DTO에 삽입
		System.out.println("messageDTO.toString() : "+messageDTO.toString());
		
		//-------------------------------------------
		TalkRoomDTO talkRoomDTO = new TalkRoomDTO();
		talkRoomDTO.setItem_seq(messageDTO.getItem_seq());
		talkRoomDTO.setPartner_userId(messageDTO.getReceiver_user_id());
		talkRoomDTO.setUserId((String) httpSessionMap.get("userId"));
		
		
		//방이 없으면 새로 만들고 있으면 있는거 사용
		TalkRoomDTO getTalkRoomDTO = talkService.isRoom(talkRoomDTO);
		if(getTalkRoomDTO == null) {
			talkService.createRoom(talkRoomDTO);
		}
		TalkRoomDTO room = talkService.isRoom(talkRoomDTO);
		
		messageDTO.setTalkRoom_seq(room.getTalkRoom_seq());//room_seq 만 여기서 데이터 삽입.
		
		talkService.insertMessage(messageDTO);
		
		
		System.out.println(session.getId() + " 로 부터 " + message.getPayload() + "받음");
		for(WebSocketSession se : sessionList) {
				se.sendMessage(new TextMessage(message.getPayload())); //모든 클라이언트들에게 TextMessage 전송. (브로드캐스트)
		}
		
			log.info("{}로 부터 {} 받음", session.getId(), message.getPayload());//getPayload 는 문자형태 그대로 받겠다는 말이다
	}//클라이언트가 소켓에 메시지를 보냈을 떄 실행된다
	
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("afterConnectionClosed session : " + session);
		System.out.println("afterConnectionClosed status : " + status);
		
		sessionList.remove(session);
		
		log.info(session.getId()+ "연결 종료");
	}//커넥션이 close 됐을때 실행된다.

}
