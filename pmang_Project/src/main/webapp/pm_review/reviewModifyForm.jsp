<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰쓰기</title>
<link rel="stylesheet" href="/pmang/css/review.css">
</head>
<body>
<!-- ************아직 데이터 가져오지 못하여 미구현 ****************************** -->



	<input type="hidden" id="photoCountHidden" value=0>
	<form action="" id="reviewWriteForm">
		<div class="reviewHeader">
			<span>리뷰쓰기</span>

		</div>

		<div class="reviewContainer">
			<div class="reviewItemDiv">
				<div class="reviewItemImg">
					<img alt="상품이미지" src="../image/bench.jpg" width="75" height="75">
				</div>
				<!-- reviewItemImg -->
				<div class="reviewItemContent">
					<p class="reviewStoreName">상점명상점명</p>
					<h2 class="reviewItemName">상품명상품명상품명상품명</h2>
					<p class="reviewTime">거래시간</p>
				</div>
				<!-- reviewItemContent -->
			</div>
			<!-- reviewItemDiv -->

			<div class="reviewDiv">
				<div class="reviewScore">
					<strong>거래는 어떠셨나요?</strong>
					<div class="scoreLevelDiv">
						<div class="scoreLevel">
							<input type="radio" class="scoreRadio" name="level1" id="level1"
								value="score1" /> <label for="level1"> <img
								id="scoreLevel1" src="../image/grayPmang.png">
							</label> <input type="radio" class="scoreRadio" name="level2" id="level2"
								value="score2" /> <label for="level2"> <img
								id="scoreLevel2" src="../image/grayPmang.png">
							</label> <input type="radio" class="scoreRadio" name="level3" id="level3"
								value="score3" /> <label for="level3"> <img
								id="scoreLevel3" src="../image/grayPmang.png">
							</label>


							<div class="level">별로에요&emsp;&emsp;보통이에요&emsp;&emsp;좋아요</div>
							<div class="scoreLevelMsg">선택하세요</div>
							<!-- scoreLevelMsg -->
						</div>
						<!-- scoreLevel -->
					</div>
					<!-- scoreLevelDiv -->
				</div>
				<!-- reviewScore -->

				<div class="reviewContentDiv">
					<textarea class="reviewContent" id="reviewInput"
						placeholder="후기 내용을 남겨주세요.(최소 10자 이상)" cols="30"></textarea>
					<div class="contentCountDiv">
						<span id="counter">(0 / 최대 200자)</span>
					</div>
					<!-- contentCountDiv -->
				</div>
				<!-- reviewContentDiv -->

				<div class="reviewImgUploadDiv" id="reviewImgUploadDiv">

					<!-- <a href="#" class="imgUpload"> -->
			
					<div class="reviewPhotoDiv">
						<ul class="reviewPhotoUl">
							<li class="reviewPhotoLi" />
							<img src="../image/photoIcon.png" alt="카메라아이콘" />사진 등록
							<input type="file" class="reviewPhoto" name="img[]"
								accept="image/jpg, image/jpeg, image/png" multiple>
						</ul>
					</div>
					<!-- reviewPhotoDiv -->
					<!-- </a> -->
				</div>

				<!-- reviewImgUploadDiv -->
				<div class="reviewPhotoPreview"></div>

				<div class="reviewCheckDiv">
					<div class="reviewCancel">
						<!-- <input type="button" id="reviewCancelBtn" value="취소"> -->
						<button class="reviewCancelBtn">취소</button>
					</div>
					<!-- reviewCabcek -->
					<div class="reviewOk">
						
						<button class="reviewOkBtn">등록</button>
					</div>
					<!-- reviewOk -->
				</div>
				<!-- reviewCheckDiv -->
			</div>
			<!-- reviewDiv -->
		</div>
		<!-- reviewContainer -->
	</form>



	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="../js/review.js"></script>
	<script>
		$(document).ready(function() {
			$('.reviewOkBtn').attr('disabled', true);
		});
	</script>

</body>
</html>