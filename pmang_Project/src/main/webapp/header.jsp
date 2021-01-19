<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
#topHeaderNav {
   height: 30px; /* 메인 메뉴의 높이 */
   float: right;
}

#topHeaderNav  ul {
   list-style-type: none;
   margin: 0px; /* 메인 메뉴 안의 ul의 margin을 없앰 */
   padding: 0px; /* 메인 메뉴 안의 ul의 padding을 없앰 */
}

#topHeaderNav  ul li {
   float: left;
   position: relative; /* 해당 li 태그 내부의 top/left 포지션 초기화 */
}

.topHeaderMenu:hover .topHeaderSubmenu {
   /* 상위 메뉴에 마우스 모버한 경우 그 안의 하위 메뉴 스타일 설정 */
   height: 100px; /* 높이를 93px로 설정 */
   width: 150px;
}

.topHeaderSubmenu { /* 하위 메뉴 스타일 설정 */ eight .2s
   -moz-transition: heighposition: absolute;
   /* html의 flow에 영향을 미치지 않게 absolute 설정 */ height : 0px;
   /* 초기 높이는 0px로 설정 */ overflow : hidden; /* 실 내용이 높이보다 커지면 해당 내용 감춤 */
   transition : height .2s; /* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(기본) */
   -webkit-transition : ht .2s;
   /* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(구버전 파폭) */
   -o-transition: height .2s;
   height: 0px; /* 초기 높이는 0px로 설정 */
   overflow: hidden; /* 실 내용이 높이보다 커지면 해당 내용 감춤 */
   transition: height .2s; /* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(기본) */
   -webkit-transition: ht .2s;
   /* height를 변화 시켰을 때 0.2초간 변화 되도록 설정(구버전 오페라) */
}

/* 카테고리 */
#categoryNav  ul {
   list-style-type: none;
   margin: 0px; /* 메인 메뉴 안의 ul의 margin을 없앰 */
   padding: 0px; /* 메인 메뉴 안의 ul의 padding을 없앰 */
}

#categlryIcon:hover .category1Menu {
   border: 1px gray solid;
   height: 250px;
   width: 150px;
}

.category1Menu {
   eight : 2s;
   -moz-transition: heighposition: absolute;
   height: 0px; /* 초기 높이는 0px로 설정 */
   overflow: hidden;
   transition: height .2s; 
   -webkit-transition: ht .2s;
   -o-transition: height .2s;
}
/* ---------------- */
#header {
  display: flex;
  align-items: center;
}
#header .logo-wrap {
  width: 20%;
  display: flex;
  align-items: center;
  justify-content: center;
  /* padding-right: 100px; */
}
#header .logo-wrap img {
  width: 30px;
  height: 30px;
  margin-right: 10px;
}
#header .logo-wrap h2 {
  font-size: 30px;
}
#header .search-wrap {
  width: 45%;
}
#header .search-wrap input {
  width: 100%;
  padding: 13px;
  border: 2px solid red;
}
#header nav {
  width: 35%;
}
#header ul {
  list-style: none;
  display: flex;
  /* justify-content: space-evenly; */
  padding-left: 80px;
}
#header ul li {
  display: flex;
  align-items: center;
  font-size: 15px;
  cursor: pointer;
  padding-right: 20px;
}
#header ul li .vertical {
  opacity: 0.7;
}
#header ul li img {
  width: 20px;
  height: 20px;
}
</style>
<title>Document</title>
  </head>
  <body>
   <div>
      <nav id="topHeaderNav">
         <ul>
            <li class="topHeaderMenu"><a href="#">로그인/회원가입</a></li>

            <li>&nbsp&nbsp&nbsp</li>

            <li class="topHeaderMenu"><a href="#">로그아웃</a></li>

            <li>&nbsp&nbsp&nbsp</li>

            <li class="topHeaderMenu"><a href="#">알림</a> <img
               src="../image/dropdown.png">
               <ul class="topHeaderSubmenu">
                  <!-- 알람을 여기에 표시하는 기능을 넣어야함 -->
                  <li><a href="#">test)알람1</a></li>
               </ul></li>

            <li>&nbsp&nbsp&nbsp</li>

            <li class="topHeaderMenu"><a href="#">내상점</a> <img
               src="../image/dropdown.png">
               <ul class="topHeaderSubmenu">
                  <li><a href="#">내 상품</a></li>
                  <br>
                  <li><a href="#">찜한상품</a></li>
                  <br>
                  <li><a href="#">계정설정</a></li>
                  <br>
                  <li><a href="#">고객센터</a></li>
                  <br>
               </ul></li>
         </ul>
      </nav>
   </div>
   <br>
   <!-- 검색 등 -->
   <br>

</body>
  <body>
    <div id="header">
      <div class="logo-wrap">
        <img src="./image//main_logo.jpg" alt="main_logo" />
        <h2>피망장터</h2>
      </div>
      <div class="search-wrap">
        <input type="text" placeholder="상품명,지역명,@상점명입력" />
      </div>
      <nav>
        <ul>
          <li>
            <img src="./image//main_logo.jpg" alt="sale" />
            <span>판매하기</span>
          </li>
          <li>
            <span class="vertical">|</span>
          </li>
          <li>
            <img src="./image//main_logo.jpg" alt="store" />
            <span>내상점</span>
          </li>
          <li>
            <span class="vertical">|</span>
          </li>
          <li>
            <img src="./image//main_logo.jpg" alt="pmangTalk" />
            <span>피망톡</span>
          </li>
        </ul>
      </nav>
   </div>
     <!-- 카테고리 -->
   <hr>
   <div>
      <nav id="categoryNav">
         <ul>
            <li id="categlryIcon"><a href="#"><img alt=""
                  src="../image/category.png"> 카테고리</a>
               <ul class="category1Menu">
                  <li><a href="#">여성의류</a>
                     <ul class="category2Menu">
                        <li><a href="#">원피스</a></li>
                        <li><a href="#">블라우스</a></li>
                        <!-- 추가해야함... -->
                     </ul></li>
                  <li><a href="#">패션잡화</a>
                     <ul class="category2Menu">
                        <li><a href="#">...</a></li>
                        <li><a href="#">...</a></li>
                     </ul></li>
                  <li><a href="#">남성의류</a>
                     <ul class="category2Menu">
                        <li><a href="#">...</a></li>
                        <li><a href="#">...</a></li>
                     </ul></li>
                  <li><a href="#">기타</a>
                     <ul class="category2Menu">
                        <li><a href="#">...</a></li>
                        <li><a href="#">...</a></li>
                     </ul></li>
                  <li><a href="#">등등..</a>
                     <ul class="category2Menu">
                        <li><a href="#">...</a></li>
                        <li><a href="#">...</a></li>
                     </ul></li>
               </ul></li>
         </ul>
	</nav>
   </div>
  </body>
</html>
