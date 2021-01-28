package talk.handler;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;


public class TalkHandler extends TextWebSocketHandler {
	
	Logger log = LoggerFactory.getLogger(TalkHandler.class);
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.add(session); //클라이언트가 접속할 때, session 정보를 sessionList에 저장
		System.out.println(" 연결됨 "); // 테이블이 생성되면  session.getId()
	}//클라이언트가 서버에 접속했을 때, 실행된다
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		for(WebSocketSession se : sessionList) {
			se.sendMessage(new TextMessage(message.getPayload()));
		}
		log.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
	}//클라이언트가 소켓에 메시지를 보냈을 떄 실행된다
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
		log.info(session.getId()+ "연결 종료");
	}//커넥션이 close 됐을때 실행된다.

}
