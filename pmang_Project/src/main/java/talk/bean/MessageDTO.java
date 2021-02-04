package talk.bean;

import java.util.Date;

<<<<<<< HEAD
import com.google.gson.Gson;

import lombok.Data;

@Data
public class MessageDTO {// ë©”ì‹œì§€ í•œì¤„ í•œì¤„
   private String sender_user_id;//ë³´ë‚¸ì‚¬ëžŒ id
   private String receiver_user_id;//ë°›ì€ì‚¬ëžŒ id
   //private String user_id;//ìœ ì €id
   private int talkRoom_seq;//í†¡ë°© seq
   private String talk_content;//ë©”ì‹œì§€ ë‚´ìš©
   private Date send_time;//ë©”ì„¸ì§€ ë³´ë‚¸ ì‹œê°„
   private Date read_time;//ë©”ì„¸ì§€ ë°›ì€ ì‹œê°„
   private int unRead_Check;//ì•ˆì½ì€ ë©”ì‹œì§€ ì²´í¬
   private String pf_Photo;//ìƒëŒ€ë°© í”„ë¡œí•„ ì´ë¯¸ì§€
   
   public static MessageDTO convertMessage(String source) {
      MessageDTO message = new MessageDTO();
      Gson gson = new Gson();
      message = gson.fromJson(source, MessageDTO.class);
      //sourceë¡œ ë„˜ì–´ì˜¨ json ë°ì´í„°ë¥¼ MessageDTO í´ëž˜ìŠ¤ì˜ ê°ì²´ì˜ í•„ë“œì— ê°’ì„ ìžë™ ì„¸íŒ…í•œë‹¤.

      return message;
   }
=======
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MessageDTO {
	private int talk_room_seq;//Åå¹æ seq
	private String sender_user_id; //º¸³½»ç¶÷ id
	private String receiver_user_id; //¹ÞÀº »ç¶÷id
	private String user_id;//À¯Àúid
	private String talk_content; //¸Þ¼¼Áö ³»¿ë
	private Date send_time;//¸Þ¼¼Áö º¸³½½Ã°£
	private Date read_time;//¸Þ¼¼Áö ÀÐÀº ½Ã°£
	private int unread_count;//¸Þ¼¼Áö ¾ÈÀÐÀº °¹¼ö
>>>>>>> branch 'temp' of https://github.com/sylee1997/Pmang.git
}
