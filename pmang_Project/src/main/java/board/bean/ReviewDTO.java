package board.bean;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ReviewDTO {
	private int reviewNum;	//review ��ȣ
	private int buyerNum;	//������ ��ȣ
	private int itemNum;	//��ǰ��ȣ
	private String reviewWriter;	//���� �ۼ���
	private String reviewSubject;	//��������
	private String reviewContent;	//���䳻��
	private String reviewStamp;		//���� ����
	private String reviewImg1;		//�������1
	private String reviewImg2;		//�������2
	private String reviewImg3;		//�������3
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy.MM.dd")
	private Date reviewLogtime;		//�����Ͻð�
	
	
	private String pf_photo;
}
