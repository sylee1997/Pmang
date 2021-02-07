package talk.bean;

import java.util.Date;

import com.google.gson.Gson;

import lombok.Data;

@Data
public class MessageDTO {// 메시지 한줄 한줄
	private String sender_user_id;//보낸사람 id
	private String receiver_user_id;//받은사람 id
	private int talkRoom_seq;//톡방 seq
	private String talk_content;//메시지 내용
	private Date send_time;//메세지 보낸 시간
	private Date read_time;//메세지 받은 시간
	private int unRead_Check;//안읽은 메시지 체크
	private String receiver_pf_Photo;//상대방 프로필 이미지
	private int item_seq;//판매 seq
	private String user_id;//유저아이디
	
	public static MessageDTO convertMessage(String source) {
		MessageDTO message = new MessageDTO();
		Gson gson = new Gson();
		message = gson.fromJson(source, MessageDTO.class);
		//source로 넘어온 json 객체형식으로 담겨있는 String 데이터를 MessageDTO 클래스의 객체의 필드에 값을 자동 세팅한다.
		//결과예제 Member [id=jekalmin, name=Min, age=26, address=Seoul]
		return message;
	}
}





