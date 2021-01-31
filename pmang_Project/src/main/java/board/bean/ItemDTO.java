package board.bean;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ItemDTO {

	private int item_seq;
	private String marketKey;
	private String img1;
	private String img2;
	private String img3;
	private String itemSubject;
	private String category1;
	private String category2;
	private String category3;
	private String condition;
	private String item_state;
	private String item_location;
	private int item_price;
	private String nego;
	private String item_content;
	private String hashtag1;
	private String hashtag2;
	private String hashtag3;
	private int qty;
	private int item_like;
	private int comment_seq;
	private int hit;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern = "yyyy.MM.dd")
	private Date logtime;
	
}
