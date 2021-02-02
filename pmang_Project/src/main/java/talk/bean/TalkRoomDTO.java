package talk.bean;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TalkRoomDTO { //방정보
	private String item_seq;//판매 seq
	private String partner_user_id;//상대방 아이디(상품키로 가져온 판매자아이디)
	private String user_id;//session 아이디
	private int talk_room_seq;//톡방 seq DB에서 생성
	private int Notification_status;//알림여부 1-알림허용 ,0-알림불가
}


