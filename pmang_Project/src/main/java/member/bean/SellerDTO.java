package member.bean;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class SellerDTO {
<<<<<<< HEAD
   private String userId;
   private String marketname;   
   private String pf_photo;              
   private String pf_content;
   private int markethit;
   @JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy.MM.dd")
   private Date marketdate;
}
=======
	private int userid;	//����Ű, primary key
	private String marketname;	//������
	private String pf_photo;		//���� ������ ����
	private String pf_content;	//���� ������ �Ұ���
	private int markethit;		//���� �湮��
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy.MM.dd")
	private Date marketdate;	//���� ������
}
>>>>>>> branch 'temp' of https://github.com/sylee1997/Pmang.git
