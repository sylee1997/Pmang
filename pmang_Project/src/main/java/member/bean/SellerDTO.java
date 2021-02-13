package member.bean;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class SellerDTO {
	private String userid;	//����Ű, primary key
	private String marketname;	//������
	private String pf_photo;		//���� ������ ����
	private String pf_content;	//���� ������ �Ұ���
	private int markethit;		//���� �湮��
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy.MM.dd")
	private Date marketdate;	//���� ������
}
