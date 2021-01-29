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
		sessionList.add(session);//Ŭ���̾�Ʈ�� ������ ��, session ������ sessionList�� ����
		System.out.println("afterConnectionEstablished session : " + session);
		System.out.println("afterConnectionEstablished ����� ");// ���̺��� �����Ǹ�  session.getId()
	}//Ŭ���̾�Ʈ�� ������ �������� ��, ����ȴ�
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("handleTextMessage session : " + session);
		System.out.println("handleTextMessage message : " + message);
		
		System.out.println(session.getId() + "�� ���� " + message.getPayload() + "����");
		for(WebSocketSession se : sessionList) {
			se.sendMessage(new TextMessage(message.getPayload())); //��� Ŭ���̾�Ʈ�鿡�� TextMessage ����. (��ε�ĳ��Ʈ)
		}
		log.info("{}�� ���� {} ����", session.getId(), message.getPayload());//getPayload �� �������� �״�� �ްڴٴ� ���̴�
	}//Ŭ���̾�Ʈ�� ���Ͽ� �޽����� ������ �� ����ȴ�
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("afterConnectionClosed session : " + session);
		System.out.println("afterConnectionClosed status : " + status);
		
		sessionList.remove(session);
		log.info(session.getId()+ "���� ����");
	}//Ŀ�ؼ��� close ������ ����ȴ�.

}
