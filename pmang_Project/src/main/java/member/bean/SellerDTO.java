package member.bean;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class SellerDTO {
	private int userkey;	//유저키, primary key
	private String marketname;	//상점명
	private String pf_photo;		//상점 프로필 사진
	private String pf_content;	//상점 프로필 소개글
	private int markethit;		//상점 방문수
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy.MM.dd")
	private Date marketdate;	//상점 오픈일
}
