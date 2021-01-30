package talk.bean;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MessageDTO {
	private int talk_room_seq;//��� seq
	private String sender_user_id; //������� id
	private String receiver_user_id; //���� ���id
	private String user_id;//����id
	private String talk_content; //�޼��� ����
	private Date send_time;//�޼��� �����ð�
	private Date read_time;//�޼��� ���� �ð�
	private int unread_count;//�޼��� ������ ����
}
