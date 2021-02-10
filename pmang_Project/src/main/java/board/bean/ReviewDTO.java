package board.bean;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ReviewDTO {
	private int reviewNum;	//review 번호
	private int buyerNum;	//구매자 번호
	private int itemNum;	//상품번호
	private String reviewWriter;	//리뷰 작성자
	private String reviewSubject;	//리뷰제목
	private String reviewContent;	//리뷰내용
	private String reviewStamp;		//리뷰 점수
	private String reviewImg1;		//리뷰사진1
	private String reviewImg2;		//리뷰사진2
	private String reviewImg3;		//리뷰사진3
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy.MM.dd")
	private Date reviewLogtime;		//리뷰등록시간
	
	
	private String pf_photo;
}
