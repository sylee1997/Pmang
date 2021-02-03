package talk.bean;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MessageDTO {// 메시지 한줄 한줄
	private String sender_user_id;//보낸사람 id
	private String receiver_user_id;//받은사람 id
	//private String user_id;//유저id
	private int talkRoom_seq;//톡방 seq
	private String talk_content;//메시지 내용
	private Date send_time;//메세지 보낸 시간
	private Date read_time;//메세지 받은 시간
	private int unRead_Check;//안읽은 메시지 체크
}
