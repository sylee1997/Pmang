package seller.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class SellerManagementPaging {
	private int currentPage;		//현재 페이지
	private int pageBlock;			
	private int pageSize;			//1 페이지 당 게시물 갯수
	private int totalA;				//총 글 수
	private StringBuffer pagingHTML;
	
	public void makePagingHTML() {
		pagingHTML = new StringBuffer();
		
		int totalP = (totalA+pageSize-1) / pageSize;	//총 페이지 수
		int startPage = (currentPage-1) / pageBlock * pageBlock+1;
		int endPage = startPage + pageBlock-1;
		
		if(endPage > totalP)
			endPage = totalP;
		
		if(startPage > pageBlock)		//startPage가 pageBlock보다 높을 때 이전 페이지로 이동하는 버튼 생성 & image에 < 모양 이미지 추가해야함
			pagingHTML.append("<a class=\"footerPageA\"><img src=\"\" width=\"12\" height=\"12\" alt=\"페이징 아이콘\" class=\"footerPageLeft\"></a>");
		
		for(int i=startPage; i<=endPage; i++) {
			if(i==currentPage)			//i가 현재 페이지와 같을 경우 현재 페이지 표시(색상 박스 처리) 생성
				pagingHTML.append("<a class=\"footerCurrentPage\">"+i+"</a>");
			else						//i 페이지로 가는 영역 생성
				pagingHTML.append("<a class= \"footerPage\">"+i+"</a>");
		}
		
		if(endPage < pageBlock)			//endPage가 pageBlock보다 낮을 때 다음 페이지로 이동하는 버튼 생성 & image에 > 모양 이미지 추가해야함
			pagingHTML.append("<a class=\"footerPageA\"><img src=\"\" width=\"12\" height=\"12\" alt=\"페이징 아이콘\"></a>");
	}
}