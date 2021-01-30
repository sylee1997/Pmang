package talk.bean;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MessageDTO {
	private int talk_room_seq;//톡방 seq
	private String sender_user_id; //보낸사람 id
	private String receiver_user_id; //받은 사람id
	private String user_id;//유저id
	private String talk_content; //메세지 내용
	private Date send_time;//메세지 보낸시간
	private Date read_time;//메세지 읽은 시간
	private int unread_count;//메세지 안읽은 갯수
}
