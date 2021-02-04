package talk.bean;

<<<<<<< HEAD
import lombok.Data;


@Data
public class TalkRoomDTO { //방정보
   private String userId;//session 아이디
   private String partner_userId;//상대방 아이디(상품키로 가져온 판매자아이디)
   private int item_seq;//판매 seq
   private int talkRoom_seq;//톡방 seq DB에서 생성
   private int Notification_status;//알림여부 1-알림허용 ,0-알림불가
=======
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TalkRoomDTO {
	private String item_seq;//�Ǹ�or���� ��ǰ 
	private String partner_user_id;//����id
	private String user_id;//�� id
	private int talk_room_seq;//���seq
>>>>>>> branch 'temp' of https://github.com/sylee1997/Pmang.git
}
