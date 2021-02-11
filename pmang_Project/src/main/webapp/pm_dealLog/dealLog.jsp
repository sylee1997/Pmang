<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래내역</title>

<link rel="stylesheet" href="/pmang/css/dealLog.css">
</head>
<body>
	<div class="dealLogWrap">
		<div class="dealLogHeader">
			<h1>거래 내역</h1>
		</div>
		<!-- dealLogHeader -->

		<div class="dealLogTab">
			<ul class="logTabs">
				<li data-tab="tab1" class="tabmenu" id="default">구매</li>
				<li data-tab="tab2" class="tabmenu">판매</li>

			</ul>
			<div class="logTabContent">
			</div>
			<!-- logTabContent -->
		</div>
		<!-- dealLogTab -->
	</div>
	<!-- dealLogWrap -->

	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<script type="text/javascript" src="/pmang/js/dealLog.js"></script>
</body>
</html>