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
		sessionList.add(session); //Ŭ���̾�Ʈ�� ������ ��, session ������ sessionList�� ����
		System.out.println(" ����� "); // ���̺��� �����Ǹ�  session.getId()
	}//Ŭ���̾�Ʈ�� ������ �������� ��, ����ȴ�
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		for(WebSocketSession se : sessionList) {
			se.sendMessage(new TextMessage(message.getPayload()));
		}
		log.info("{}�� ���� {} ����", session.getId(), message.getPayload());
	}//Ŭ���̾�Ʈ�� ���Ͽ� �޽����� ������ �� ����ȴ�
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
		log.info(session.getId()+ "���� ����");
	}//Ŀ�ؼ��� close ������ ����ȴ�.

}
