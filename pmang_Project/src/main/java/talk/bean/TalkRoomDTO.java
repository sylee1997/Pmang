package talk.bean;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TalkRoomDTO {
	private String item_seq;//판매or구매 물품 
	private String partner_user_id;//상대방id
	private String user_id;//내 id
	private int talk_room_seq;//톡방seq
}
