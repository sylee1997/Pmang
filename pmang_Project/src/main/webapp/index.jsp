<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<link rel="stylesheet" href="/pmang/css/pm_index.css">

<title>피망마켓에 오신것을 환영합니다.</title>
</head>
<body> 

   <div id="wrap" style="border: 1px solid red">
      
      <div id="header" style="border:3px solid red">
      <div class="header_logo">
            <div class="logo-wrap">
                 <img src="./image/main_logo.jpg" alt="main_logo" />
                 <h2>피망장터</h2>
               </div>
               <div class="search-wrap">
                 <input type="text" placeholder="상품명,지역명,@상점명입력" />
               </div>
               <nav>
              <ul>
                <li>
                  <img src="./image/main_logo.jpg" alt="sale" />
                  <span>판매하기</span>
                </li>
                <li>
                  <span class="vertical">|</span>
                </li>
                <li>
                  <img src="./image/main_logo.jpg" alt="store" />
                  <span>내상점</span>
                </li>
                <li>
                  <span class="vertical">|</span>
                </li>
                <li>
                  <img src="./image/main_logo.jpg" alt="login" />
                  <span>로그인</span>
                </li>
              </ul>
            </nav>
        </div>
      
          <!-- 카테고리 -->
	<hr>

	<div id="categoryDiv">
		<ul class="category">
			<li><a>카테고리</a><!-- <li>&nbsp</li> ← 요거 카테고리 공백채우는용 지우지마세요! -->
				<ul class="category1Menu">
					<li><a href="#">패션</a>
						<ul class="category2Menu">
							<li><a href="#">여성의류</a>
								<ul class="category3Menu">
									<li><a href="#">아우터</a></li>
									<li><a href="#">티셔츠</a></li>
									<li><a href="#">니트</a></li>
									<li><a href="#">셔츠 / 블라우스</a></li>
									<li><a href="#">맨투맨 / 후드집업</a></li>
									<li><a href="#">원피스 / 세트</a></li>
									<li><a href="#">바지</a></li>
									<li><a href="#">스커트</a></li>
								</ul></li>
							<li><a href="#">남성의류</a>
								<ul class="category3Menu">
									<li><a href="#">아우터</a></li>
									<li><a href="#">티셔츠</a></li>
									<li><a href="#">니트</a></li>
									<li><a href="#">셔츠</a></li>
									<li><a href="#">맨투맨 / 후드집업</a></li>
									<li><a href="#">바지</a></li>
									<li>&nbsp</li><li>&nbsp</li><li>&nbsp</li>
								</ul></li>
							<li><a href="#">패션잡화</a>
								<ul class="category3Menu">
									<li><a href="#">가방</a></li>
									<li><a href="#">신발</a></li>
									<li><a href="#">액세서리</a></li>
									<li><a href="#">시계</a></li>
									<li><a href="#">모자</a></li>
									<li>&nbsp</li><li>&nbsp</li><li>&nbsp</li>
								</ul></li>
								<li>&nbsp</li><li>&nbsp</li><li>&nbsp</li><li>&nbsp</li><li>&nbsp</li>
						</ul></li>
					<li><a href="#">디지털 / 가전</a>
						<ul class="category2Menu">
							<li><a href="#">모바일</a>
								<ul class="category3Menu">
									<li><a href="#">스마트폰</a></li>
									<li><a href="#">태블릿</a></li>
									<li><a href="#">액세서리 / 주변기기</a></li>
									<li>&nbsp</li><li>&nbsp</li><li>&nbsp</li><li>&nbsp</li><li>&nbsp</li>
								</ul></li>
							<li><a href="#">가전제품</a>
								<ul class="category3Menu">
									<li><a href="#">소형가전</a></li>
									<li><a href="#">대형가전</a></li>
									<li><a href="#">미용가전</a></li>
									<li><a href="#">사무용품</a></li>
									<li>&nbsp</li><li>&nbsp</li><li>&nbsp</li><li>&nbsp</li>
								</ul></li>
							<li><a href="#">음방 / 영상기기</a>
								<ul class="category3Menu">
									<li><a href="#">음향기기</a></li>
									<li><a href="#">비디오 / 프로젝터</a></li>
									<li><a href="#">CD / DVD / 음반</a></li>
									<li>&nbsp</li><li>&nbsp</li><li>&nbsp</li><li>&nbsp</li><li>&nbsp</li>
								</ul></li>
							<li><a href="#">컴퓨터 / 주변기기</a>
								<ul class="category3Menu">
									<li><a href="#">데스크탑</a></li>
									<li><a href="#">키보드 / 마우스</a></li>
									<li><a href="#">모니터</a></li>
									<li><a href="#">컴퓨터 부품</a></li>
									<li><a href="#">노트북 / 넷북</a></li>
									<li><a href="#">기타 액세서리</a></li>
									<li>&nbsp</li><li>&nbsp</li>
								</ul></li>
							<li><a href="#">카메라</a>
								<ul class="category3Menu">
									<li><a href="#">DSLR / 미러리스</a></li>
									<li><a href="#">필름카메라</a></li>
									<li><a href="#">디지털 카메라</a></li>
									<li><a href="#">기타 액세서리</a></li>
									<li>&nbsp</li><li>&nbsp</li><li>&nbsp</li><li>&nbsp</li>
								</ul></li>
							<li><a href="#">게임</a>
								<ul class="category3Menu">
									<li><a href="#">PC게임</a></li>
									<li><a href="#">콘솔게임</a></li>
									<li><a href="#">게임 타이틀</a></li>
									<li>&nbsp</li><li>&nbsp</li><li>&nbsp</li><li>&nbsp</li><li>&nbsp</li>
								</ul></li>
								<li>&nbsp</li><li>&nbsp</li>
						</ul></li>
					<li><a href="#">도서 / 티켓</a>
						<ul class="category2Menu">
							<li><a href="#">도서</a>
								<ul class="category3Menu">
									<li><a href="#">학습 / 사전 / 참고서</a></li>
									<li><a href="#">만화 / 아동</a></li>
									<li><a href="#">인문 / 교양 / 소설</a></li>
									<li><a href="#">경영 / 경제 / 사회</a></li>
									<li><a href="#">과학 / 컴퓨터 / 인터넷</a></li>
									<li><a href="#">예술 / 디자인</a></li>
									<li><a href="#">기타 도서</a></li>
									<li>&nbsp</li>
								</ul></li>
							<li><a href="#">티켓</a>
								<ul class="category3Menu">
									<li><a href="#">기프티콘 / 상품권 / 쿠폰</a></li>
									<li><a href="#">예매권 / 항공권</a></li>
									<li>&nbsp</li><li>&nbsp</li><li>&nbsp</li><li>&nbsp</li><li>&nbsp</li><li>&nbsp</li>
								</ul></li>
							<li>&nbsp</li><li>&nbsp</li><li>&nbsp</li><li>&nbsp</li><li>&nbsp</li><li>&nbsp</li>
						</ul></li>
					<li><a href="#">리빙용품</a>
						<ul class="category2Menu">
							<li><a href="#">생활용품</a>
								<ul class="category3Menu">
									<li><a href="#">문구 / 학습</a></li>
									<li><a href="#">침구</a></li>
									<li><a href="#">욕실</a></li>
									<li>&nbsp</li><li>&nbsp</li><li>&nbsp</li><li>&nbsp</li><li>&nbsp</li>
								</ul></li>
							<li><a href="#">가구</a>
								<ul class="category3Menu">
									<li><a href="#">거실가구</a></li>
									<li><a href="#">생활가구</a></li>
									<li><a href="#">사무용가구</a></li>
									<li><a href="#">인테리어 소품</a></li>
									<li>&nbsp</li><li>&nbsp</li><li>&nbsp</li><li>&nbsp</li>
								</ul></li>
							<li><a href="#">주방용품</a>
								<ul class="category3Menu">
									<li><a href="#">식기세트</a></li>
									<li><a href="#">냄비 / 프라이팬</a></li>
									<li><a href="#">조리도구</a></li>
									<li><a href="#">수저 / 커트러리</a></li>
									<li><a href="#">컵 / 잔 / 텀블러</a></li>
									<li><a href="#">주방 잡화</a></li>
									<li><a href="#">밀폐용기</a></li>
									<li><a href="#">커피용품</a></li>

								</ul></li>
							<li>&nbsp</li><li>&nbsp</li><li>&nbsp</li><li>&nbsp</li><li>&nbsp</li>
						</ul></li>
					<li><a href="#">스포츠 / 레저</a>
						<ul class="category2Menu">
							<li><a href="#">실내</a>
								<ul class="category3Menu">
									<li><a href="#">헬스</a></li>
									<li><a href="#">요가</a></li>
									<li><a href="#">골프</a></li>
									<li><a href="#">수영</a></li>
									<li>&nbsp</li><li>&nbsp</li><li>&nbsp</li><li>&nbsp</li>
								</ul></li>
							<li><a href="#">실외</a>
								<ul class="category3Menu">
									<li><a href="#">축구</a></li>
									<li><a href="#">야구</a></li>
									<li><a href="#">농구</a></li>
									<li><a href="#">자전거 / 킥보드</a></li>
									<li><a href="#">등산</a></li>
									<li><a href="#">낚시 / 캠핑</a></li>
									<li>&nbsp</li><li>&nbsp</li>
								</ul></li>
							<li>&nbsp</li><li>&nbsp</li><li>&nbsp</li><li>&nbsp</li><li>&nbsp</li><li>&nbsp</li>
						</ul></li>
					<li><a href="#">뷰티 / 미용</a>
						<ul class="category2Menu">
							<li><a href="#">스킨케어</a>
								<ul class="category3Menu">
									<li><a href="#">클렌징 / 스크럽</a></li>
									<li><a href="#">스킨 / 토너 / 미스트</a></li>
									<li><a href="#">로션 / 에멀전</a></li>
									<li><a href="#">에센스 / 크림</a></li>
									<li><a href="#">팩 / 마스크</a></li>
									<li><a href="#">썬케어</a></li>
									<li>&nbsp</li><li>&nbsp</li>
								</ul></li>
							<li><a href="#">메이크업</a>
								<ul class="category3Menu">
									<li><a href="#">색조메이크업</a></li>
									<li><a href="#">베이스메이크업</a></li>
									<li>&nbsp</li><li>&nbsp</li><li>&nbsp</li><li>&nbsp</li><li>&nbsp</li><li>&nbsp</li>
								</ul></li>
							<li><a href="#">헤어 / 바디</a>
								<ul class="category3Menu">
									<li><a href="#">샴푸 / 린스 / 트리트먼트</a></li>
									<li><a href="#">헤어스타일링</a></li>
									<li><a href="#">바디클렌저 / 로션</a></li>
									<li><a href="#">헤어 / 핸드 / 풋케어</a></li>
									<li>&nbsp</li><li>&nbsp</li><li>&nbsp</li><li>&nbsp</li>
								</ul></li>
							<li><a href="#">향수 / 아로마</a>
								<ul class="category3Menu">
									<li><a href="#">여성향수</a></li>
									<li><a href="#">남성향수</a></li>
									<li><a href="#">공용향수</a></li>
									<li>&nbsp</li><li>&nbsp</li><li>&nbsp</li><li>&nbsp</li><li>&nbsp</li>
								</ul></li>
							<li><a href="#">네일아트 케어</a>
								<ul class="category3Menu">
									<li><a href="#">네일아트 / 스티커</a></li>
									<li><a href="#">매니큐어 / 패디큐어</a></li>
									<li><a href="#">네일케어도구</a></li>
									<li>&nbsp</li><li>&nbsp</li><li>&nbsp</li><li>&nbsp</li><li>&nbsp</li>
								</ul></li>
							<li><a href="#">뷰티소품</a>
								<ul class="category3Menu">
									<li><a href="#">브러시 / 퍼프</a></li>
									<li><a href="#">파우치 / 정리함</a></li>
									<li><a href="#">거울</a></li>
									<li>&nbsp</li><li>&nbsp</li><li>&nbsp</li><li>&nbsp</li><li>&nbsp</li>
								</ul></li>
							<li>&nbsp</li><li>&nbsp</li>
						</ul></li>
					<li><a href="#">유아 / 출산</a>
						<ul class="category2Menu">
							<li><a href="#">영아의류 (-2세)</a>
								<ul class="category3Menu">
									<li><a href="#">상의</a></li>
									<li><a href="#">하의</a></li>
									<li><a href="#">기타</a></li>
									<li>&nbsp</li><li>&nbsp</li><li>&nbsp</li><li>&nbsp</li><li>&nbsp</li>
								</ul></li>
							<li><a href="#">여아의류 (3-6세)</a>
								<ul class="category3Menu">
									<li><a href="#">원피스 / 세트</a></li>
									<li><a href="#">아우터</a></li>
									<li><a href="#">상하의</a></li>
									<li><a href="#">티셔츠</a></li>
									<li><a href="#">바지</a></li>
									<li><a href="#">치마</a></li>
									<li>&nbsp</li><li>&nbsp</li>
								</ul></li>
							<li><a href="#">남아의류 (3-6세)</a>
								<ul class="category3Menu">
									<li><a href="#">아우터</a></li>
									<li><a href="#">상하의</a></li>
									<li><a href="#">티셔츠</a></li>
									<li><a href="#">바지</a></li>
									<li><a href="#">남방</a></li>
									<li>&nbsp</li><li>&nbsp</li><li>&nbsp</li>
								</ul></li>
							<li><a href="#">육아잡화</a>
								<ul class="category3Menu">
									<li><a href="#">신발</a></li>
									<li><a href="#">모자</a></li>
									<li><a href="#">가방</a></li>
									<li><a href="#">양말</a></li>
									<li>&nbsp</li><li>&nbsp</li><li>&nbsp</li><li>&nbsp</li>
								</ul></li>
							<li><a href="#">동화책 / 완구 / 인형</a>
								<ul class="category3Menu">
									<li><a href="#">인형</a></li>
									<li><a href="#">교육 / 완구</a></li>
									<li><a href="#">장난감</a></li>
									<li><a href="#">물놀이도구</a></li>
									<li><a href="#">놀이터도구</a></li>
									<li>&nbsp</li><li>&nbsp</li><li>&nbsp</li>
								</ul></li>
								<li>&nbsp</li><li>&nbsp</li><li>&nbsp</li>
						</ul></li>
					<li><a href="#">기타</a>
						<ul class="category2Menu">
							<li><a href="#">피망나눔</a></li>
							<li><a href="#">차량 , 오토바이</a></li>
							<li><a href="#">기타</a></li>
							<li>&nbsp</li><li>&nbsp</li><li>&nbsp</li><li>&nbsp</li><li>&nbsp</li>
						</ul></li>
				</ul></li>
		</ul>
	</div><!-- header category -->
      
        <div id="aside" style="border:3px solid yellow">
         <div class="asideDiv">
            <div class="likebag">찜한상품
               <div class="bag_click">
                  <a class="bag_clickA" href="#">
                  <img src="/pmang/image/zeroBag.png" style="padding-top:5px; width:18px; height:18px; cursor:pointer;">
                  0 <!-- 계속 바꿔줘야 되는것 -->
                  </a>
               </div>
            </div>
            
            
            <div class="recentlyLook">
               최근본상품
               <br>
               0 <!-- 계속 바꿔줘야 되는것 -->
               <br>
               <img src="/pmang/image/aside_1.JPG" style="width:50px; height:20px;">
               <div class="goods">
                  <div id="goods_img1" style="width: 80px; height: 80px; border : 1px solid black"></div>
                  <div id="goods_img2" style="width: 80px; height: 80px; border : 1px solid black"></div>
                  <div id="goods_img3" style="width: 80px; height: 80px; border : 1px solid black"></div>
               </div>
            </div>
            
            <div class="topBtn">
               <a id="topA" href="#header">TOP</a>
            </div>
            
            <div class="pmangTok">
               <a class="pmangTokA" href="#">
               <img src="/pmang/image/pmangTok.png" style="padding-left: 2px; width: 90px; height:70px;">
                  피망Tok
               </a>
            </div>
         </div><!-- asideDiv -->

      </div><!-- aside -->
   </div><!-- header -->
      <!-- ----------------헤더 -->
      
      <div id="container" style="border: 1px solid black">
         
         <!-- 인기카테고리 슬라이드영역 -->
         <div id="slide" style="border: 1px solid pink">
            <div id="slideInitial" style="border: 1px solid pink">
               <!-- initial -->
               
               <div id="slideAct" style="border: 1px solid black">
                  <ul class="slide_wrap"
                     style="width: 5120px; height: 300px; border: 1px solid blue;">
                     <li class="slide_item">
                        <a href="#">
                           <img src="/pmang/image/image1.png" alt="배경1" />
                        </a>
                     </li>
                     
                     <li class="slide_item">
                        <a href="#">
                           <img src="/pmang/image/image2.png" alt="배경2" />
                        </a>
                     </li>
                     
                     <li class="slide_item">
                        <a href="#">
                           <img src="/pmang/image/image3.png" alt="배경3" />
                        </a>
                     </li>
                     
                     <li class="slide_item">
                        <a href="#">
                           <img src="/pmang/image/image4.png" alt="배경4" />
                        </a>
                     </li>
                     
                     <li class="slide_item">
                        <a href="#">
                           <img src="/pmang/image/image5.png" alt="배경5" />
                        </a>
                     </li>
                     
                     
                     </ul>
               </div><!-- slideAct -->
               
            </div><!-- slideInitial -->
            
         </div><!-- slide -->
         
         
         <!-- 최근게시글 -->
         <div id="selection" style="border: 1px solid green">
            <h2>오늘의 상품 추천</h2>
            
            
            <div class="selection1">
               <div class="selection2">
                  <div class="selection3">
                     <!-- 1개상품 -->                  
                     <div class="itemFrame">
                        <a class="itemLink" href="#">
                           <div class="itemImageArea">
                              <img src="/pmang/image/bench.jpg" width="194" height="194" alt="상품 이미지">
                              <div class="imageAreaDiv"></div>
                           </div>
                           <div class="itemContent">
                              <div class="itemName">상품명</div>
                              <div class="itemPriceAndTime">
                                 <div class="itemPrice">5000</div>
                                 <div class="itemTime">
                                    <span>7시간 전</span>
                                 </div>
                              </div>
                           </div>
                        </a>
                     </div><!-- itemFrame -->
                     
                     <!-- 1개상품 -->                  
                     <div class="itemFrame">
                        <a class="itemLink" href="#">
                           <div class="itemImageArea">
                              <img src="/pmang/image/bench.jpg" width="194" height="194" alt="상품 이미지">
                              <div class="imageAreaDiv"></div>
                           </div>
                           <div class="itemContent">
                              <div class="itemName">상품명</div>
                              <div class="itemPriceAndTime">
                                 <div class="itemPrice">5000</div>
                                 <div class="itemTime">
                                    <span>7시간 전</span>
                                 </div>
                              </div>
                           </div>
                        </a>
                     </div><!-- itemFrame -->
                     
                     <!-- 1개상품 -->                  
                     <div class="itemFrame">
                        <a class="itemLink" href="#">
                           <div class="itemImageArea">
                              <img src="/pmang/image/bench.jpg" width="194" height="194" alt="상품 이미지">
                              <div class="imageAreaDiv"></div>
                           </div>
                           <div class="itemContent">
                              <div class="itemName">상품명</div>
                              <div class="itemPriceAndTime">
                                 <div class="itemPrice">5000</div>
                                 <div class="itemTime">
                                    <span>7시간 전</span>
                                 </div>
                              </div>
                           </div>
                        </a>
                     </div><!-- itemFrame -->
                     
                     <!-- 1개상품 -->                  
                     <div class="itemFrame">
                        <a class="itemLink" href="#">
                           <div class="itemImageArea">
                              <img src="/pmang/image/bench.jpg" width="194" height="194" alt="상품 이미지">
                              <div class="imageAreaDiv"></div>
                           </div>
                           <div class="itemContent">
                              <div class="itemName">상품명</div>
                              <div class="itemPriceAndTime">
                                 <div class="itemPrice">5000</div>
                                 <div class="itemTime">
                                    <span>7시간 전</span>
                                 </div>
                              </div>
                           </div>
                        </a>
                     </div><!-- itemFrame -->
                     
                     <!-- 1개상품 -->                  
                     <div class="itemFrame">
                        <a class="itemLink" href="#">
                           <div class="itemImageArea">
                              <img src="/pmang/image/bench.jpg" width="194" height="194" alt="상품 이미지">
                              <div class="imageAreaDiv"></div>
                           </div>
                           <div class="itemContent">
                              <div class="itemName">상품명</div>
                              <div class="itemPriceAndTime">
                                 <div class="itemPrice">5000</div>
                                 <div class="itemTime">
                                    <span>7시간 전</span>
                                 </div>
                              </div>
                           </div>
                        </a>
                     </div><!-- itemFrame -->
                     
                     <!-- 1개상품 -->                  
                     <div class="itemFrame">
                        <a class="itemLink" href="#">
                           <div class="itemImageArea">
                              <img src="/pmang/image/bench.jpg" width="194" height="194" alt="상품 이미지">
                              <div class="imageAreaDiv"></div>
                           </div>
                           <div class="itemContent">
                              <div class="itemName">상품명</div>
                              <div class="itemPriceAndTime">
                                 <div class="itemPrice">5000</div>
                                 <div class="itemTime">
                                    <span>7시간 전</span>
                                 </div>
                              </div>
                           </div>
                        </a>
                     </div><!-- itemFrame -->
                     
                     <!-- 1개상품 -->                  
                     <div class="itemFrame">
                        <a class="itemLink" href="#">
                           <div class="itemImageArea">
                              <img src="/pmang/image/bench.jpg" width="194" height="194" alt="상품 이미지">
                              <div class="imageAreaDiv"></div>
                           </div>
                           <div class="itemContent">
                              <div class="itemName">상품명</div>
                              <div class="itemPriceAndTime">
                                 <div class="itemPrice">5000</div>
                                 <div class="itemTime">
                                    <span>7시간 전</span>
                                 </div>
                              </div>
                           </div>
                        </a>
                     </div><!-- itemFrame -->
                     
                     <!-- 1개상품 -->                  
                     <div class="itemFrame">
                        <a class="itemLink" href="#">
                           <div class="itemImageArea">
                              <img src="/pmang/image/bench.jpg" width="194" height="194" alt="상품 이미지">
                              <div class="imageAreaDiv"></div>
                           </div>
                           <div class="itemContent">
                              <div class="itemName">상품명</div>
                              <div class="itemPriceAndTime">
                                 <div class="itemPrice">5000</div>
                                 <div class="itemTime">
                                    <span>7시간 전</span>
                                 </div>
                              </div>
                           </div>
                        </a>
                     </div><!-- itemFrame -->
                     
                     <!-- 1개상품 -->                  
                     <div class="itemFrame">
                        <a class="itemLink" href="#">
                           <div class="itemImageArea">
                              <img src="/pmang/image/bench.jpg" width="194" height="194" alt="상품 이미지">
                              <div class="imageAreaDiv"></div>
                           </div>
                           <div class="itemContent">
                              <div class="itemName">상품명</div>
                              <div class="itemPriceAndTime">
                                 <div class="itemPrice">5000</div>
                                 <div class="itemTime">
                                    <span>7시간 전</span>
                                 </div>
                              </div>
                           </div>
                        </a>
                     </div><!-- itemFrame -->
                     
                     <!-- 1개상품 -->                  
                     <div class="itemFrame">
                        <a class="itemLink" href="#">
                           <div class="itemImageArea">
                              <img src="/pmang/image/bench.jpg" width="194" height="194" alt="상품 이미지">
                              <div class="imageAreaDiv"></div>
                           </div>
                           <div class="itemContent">
                              <div class="itemName">상품명</div>
                              <div class="itemPriceAndTime">
                                 <div class="itemPrice">5000</div>
                                 <div class="itemTime">
                                    <span>7시간 전</span>
                                 </div>
                              </div>
                           </div>
                        </a>
                     </div><!-- itemFrame -->
                     
                     <!-- 1개상품 -->                  
                     <div class="itemFrame">
                        <a class="itemLink" href="#">
                           <div class="itemImageArea">
                              <img src="/pmang/image/bench.jpg" width="194" height="194" alt="상품 이미지">
                              <div class="imageAreaDiv"></div>
                           </div>
                           <div class="itemContent">
                              <div class="itemName">상품명</div>
                              <div class="itemPriceAndTime">
                                 <div class="itemPrice">5000</div>
                                 <div class="itemTime">
                                    <span>7시간 전</span>
                                 </div>
                              </div>
                           </div>
                        </a>
                     </div><!-- itemFrame -->
                     
                     <!-- 1개상품 -->                  
                     <div class="itemFrame">
                        <a class="itemLink" href="#">
                           <div class="itemImageArea">
                              <img src="/pmang/image/bench.jpg" width="194" height="194" alt="상품 이미지">
                              <div class="imageAreaDiv"></div>
                           </div>
                           <div class="itemContent">
                              <div class="itemName">상품명</div>
                              <div class="itemPriceAndTime">
                                 <div class="itemPrice">5000</div>
                                 <div class="itemTime">
                                    <span>7시간 전</span>
                                 </div>
                              </div>
                           </div>
                        </a>
                     </div><!-- itemFrame -->
                     
                     
                  </div><!-- selection3 -->
               </div><!-- selection2 -->
            </div><!-- selection1 -->
         </div><!-- selection -->
      </div><!-- container -->


 
   </div><!-- wrap -->
            

            
      
    

   
   <div class="footer" style="border:3px solid blue">
      <div class="footerCategoryArea">
         <div class="footerCategory">
            <a class="cIPDuS" href="#">공지사항</a>
            <a class="cIPDuS" href="#">자주묻는질문</a>
            <a class="cgGBdw" href="#">운영정책</a>
            <a class="cIPDuS" href="#">1:1문의하기</a>
            <a class="cgGBdw" href="#">사업자정보확인</a>
            <a class="cgGBdw" href="#">이용약관</a>
            <a class="cgGBdw" href="#">청소년보호정책</a>
            <a class="cgGBdw" href="#">위치기반서비스 이용약관</a>
         </div>
      </div>
      
      <div class="footerContentArea">
         <div class="footerContent">
            <div class="footerContentMark">(피망장터이미지)피망장터
               <div class="footerContentMarkTitle">피나게 망하지 않을 만큼 판매하는 장터입니다. 누구나, 무엇이든 쉽고 편하고 안전하게 거래할 수 있습니다.</div>
            </div>
            
            <div class="icon">
               <a href="#" target="_blank">
                  <img src="/pmang/image/facebook.png" alt="facebook icon" style="margin: 0px 5px 0px 16px;">
               </a>
               
               <a href="#" target="_blank">
                  <img src="/pmang/image/instagram.png" alt="instagram icon">
               </a>
            </div>
         </div>
         
         <div class="footerCompanyInfo">
            <div class="infomain">
               대표이사: 김우석 &nbsp;|&nbsp; 개인정보담당자: 구세주 &nbsp;|&nbsp; 사업자등록정보 : 110-383-234...
               &nbsp;|&nbsp; 통신판매업신고 : 아직안했음
               <br>
               주소: 서울시 서초구 강남대로...
               <br>
               "고객센터 대표번호: 1544-1234" &nbsp;|&nbsp; FAX 02-345-6789
               <br>
               
               <div class="CustomerService">
                  <p>고객센터 운영시간:</p>
                  <p>
                     &nbsp;전화문의 : 9시 ~ 18시 (주말,공휴일 제외) &nbsp;|&nbsp; 1:1문의 : 9시~18시
                     <br>
                     ※점심시간 12~13시
                  </p>
               </div>
               고객센터 문의 help@pmang.co.kr &nbsp;|&nbsp; 제휴문의 partner@pmang.co.kr
               <br>
               호스팅서비스 제공자: bitcamp
               <br>
               <br>
               “피망장터_컨시어지” 상점의 판매상품을 제외한 모든 상품들에 대하여, 피망장터㈜는 통신판매중개자로서 중고거래마켓 번개장터의 거래 당사자가 아니며, 입점판매자가 등록한 상품정보 및 거래에 대해 책임을 지지 않습니다.
               <br>
            </div>
            
            <div>
               <div class="">
                  Copyright ⓒ Pmangjangter Inc. All rights reserved.
               </div>
            </div>
         </div>
      </div>
   </div>

<script>

      /* 인기 카테고리 슬라이드 쇼 이벤트 */
      var ul = document.querySelector('.slide_wrap');
      function move() {
         var curIndex = 0;
         setInterval(function() {
            ul.style.transition = '0.5s';
            ul.style.transform = "translate3d(-" + 1024 * (curIndex + 1)
                  + "px, 0px, 0px)";
            curIndex++;
            if (curIndex === 4) {
               curIndex = -1;
            }
         }, 1000);
      }
      document.addEventListener("DOMContentLoaded", function() {
         // 
         move();
      });
      /* 인기 카테고리 슬라이드 쇼 이벤트 */
</script>
</body>
</html>