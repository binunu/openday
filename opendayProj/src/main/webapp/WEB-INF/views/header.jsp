<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="<c:url value="/resources/js/user/jquery-3.3.1.js"/>"></script>

<script src='<c:url value="/resources/js/user/header.js"/>'></script>

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet"
	href="<c:url value="/resources/css/user/header.css"/>">
<!-- 달력 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/2.3.2/css/bootstrap-responsive.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.js"></script>

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet"
	href="<c:url value="/resources/css/user/header.css"/>">



</head>
<body>

	<div class="headerWrapper">
		<div class="contentWrapper">
			<header>
				<ul class="topButtons">
					<c:set var="userId" value="${sessionScope.userId}" />
					<!-- <li class="nickname">닉네임</li> -->
					<c:choose>
						<c:when test="${userId eq null}">
							<li class="logoutButton"></li>
						</c:when>
						<c:otherwise>
							<b><c:out value="${userId.userNickname}" /></b>

							<li class="logoutButton"><a href="logout"><button>로그아웃</button></a></li>
						</c:otherwise>
					</c:choose>


					<li class="topButtonColor tB topButtonsMargin"><a href=#>강사신청</a></li>

					<li class="topButton tB topButtonsMargin"><a href=#>클래스요청</a></li>

					<li class="topButton tB tBLast topButtonsMargin"><a href=#>고객센터</a></li>

				</ul>
		</div>
		<hr class="hr1">
		<div class="contentWrapper">
			<div class="logoMenu">
				<h1 class="logo">
					<a href="#">열어데이</a>
				</h1>
				<form type="text" action="search" method="get">
					<div class="searchAndIcon">

						<input class="search" type="text" onclick="dis()"
							placeholder="검색어 입력"> <a href="subClassList"><span
							class="material-symbols-outlined searchIcon">search</span></a>
					</div>
				</form>
				<ul class="verticalAlign">
					<li><a href="#"><span
							class="material-symbols-outlined alarm"> notifications </span>
							<p>알림</p></a></li>
					<c:set var="userId" value="${sessionScope.userId }" />
					<c:choose>
						<c:when test="${userId eq null}">
							<li><a href="loginform"><span
									class="material-symbols-outlined login"> person </span>
									<p>로그인</p></a></li>
						</c:when>
						<c:otherwise>

							<li><a href="loginform"><span
									class="material-symbols-outlined login"> person </span>
									<p>마이</p></a></li>
						</c:otherwise>
					</c:choose>

					<li id="menu" onclick="disMenu()"><a href="#"><span
							class="material-symbols-outlined menu"> menu </span>
							<p>카테고리</p></a></li>
				</ul>
			</div>





			</header>
		</div>
		<hr class="hr2">
	</div>
	<form type="text" action="search" method="get">
		<div id='dis' class="searchFilterWrapper">

			<div class="contentWrapper">
				<div class="filterUl1">
					<p class="filterUlTitle">지역</p>
					<ul>
						<li value="all">전체</li>
						<li value="${scdLoc == '서울' ? 'selected' : ''}">서울</li>
						<li value="${scdLoc == '경기' ? 'selected' : ''}">경기</li>
						<li value="${scdLoc == '인천' ? 'selected' : ''}">인천</li>
						<li value="${scdLoc == '강원' ? 'selected' : ''}">강원</li>
						<li value="${scdLoc == '충북' ? 'selected' : ''}">충북</li>
						<li value="${scdLoc == '충남' ? 'selected' : ''}">충남</li>
						<li value="${scdLoc == '세종' ? 'selected' : ''}">세종</li>
						<li value="${scdLoc == '대전' ? 'selected' : ''}">대전</li>
						<li value="${scdLoc == '광주' ? 'selected' : ''}">광주</li>
						<li value="${scdLoc == '전북' ? 'selected' : ''}">전북</li>
						<li value="${scdLoc == '경북' ? 'selected' : ''}">경북</li>
						<li value="${scdLoc == '대구' ? 'selected' : ''}">대구</li>
						<li value="${scdLoc == '제주' ? 'selected' : ''}">제주</li>
						<li value="${scdLoc == '전남' ? 'selected' : ''}">전남</li>
						<li value="${scdLoc == '경남/울산' ? 'selected' : ''}">경남/울산</li>
						<li value="${scdLoc == '부산' ? 'selected' : ''}">부산</li>
					</ul>
				</div>
				<div class="filterUl2">
					<p class="filterUlTitle">카테고리</p>
					<select name="category" id="category">
						<option value="all" selected>전체</option>
						<c:forEach items="${codeList}" var="code">
							<option value="${code.codNum}">${code.codName}</option>
						</c:forEach>

					</select>
				</div>
				<!-- 검색 필터 달력 -->
				<div class="filterUl3">
					<p class="filterUlTitle">요일</p>
					<div class="container px-1 px-sm-5 mx-auto searchDatepicker">
						<form autocomplete="off searchDatepickerForm">
							<div class="searchDatepickerDiv">
								<div class="col-lg-6 col-11">
									<div class="input-group input-daterange">
										<input type="text" class="form-control input1"
											value="startDate" placeholder="Start Date" readonly>
										<input type="text" class="form-control input2" value="endDate"
											placeholder="End Date" readonly>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>


				<!-- <div class="filterUl3">
				<p class="filterUlTitle">요일</p>
<div class="container px-1 px-sm-5 mx-auto searchDatepicker">
  <form autocomplete="off">
    <div class="flex-row d-flex justify-content-center">
      <div class="col-lg-6 col-11">
        <div class="input-group input-daterange">
          <input type="text" class="form-control input1" placeholder="Start Date" readonly>
          <input type="text" class="form-control input2" placeholder="End Date" readonly>
        </div>
      </div>
    </div>
  </form>
</div>
</div>-->
				<!-- 달력코드끝 -->
				<!-- <div class="filterUl3">
				<p class="filterUlTitle">요일</p>
				<button type="button" class="multiSelectButton"
					onclick="toggleSelection(this)">월</button>
				<button type="button" class="multiSelectButton"
					onclick="toggleSelection(this)">화</button>
				<button type="button" class="multiSelectButton"
					onclick="toggleSelection(this)">수</button>
				<button type="button" class="multiSelectButton"
					onclick="toggleSelection(this)">목</button>
				<button type="button" class="multiSelectButton"
					onclick="toggleSelection(this)">금</button>
				<button type="button" class="multiSelectButton"
					onclick="toggleSelection(this)">토</button>
				<button type="button" class="multiSelectButton"
					onclick="toggleSelection(this)">일</button>
			</div>
 -->
				<div class="searchFilterButton">
					<button type="button" class="refresh" onclick="resetFilters()">
						<span class="material-symbols-outlined"> refresh </span>
						<p>초기화</p>
					</button>



					<input type="submit" class="searchButton" value="검색">
		
				</div>
			</div>
		</div>
	</form>

	<div id='disMenu' class="menuWrapper">
		<div class="contentWrapper">
			<table class="menuTable">
				<tr>
					<td>
						<button type="button" class="categoryButton" name="categoryButton">전체</button>
					</td>
					<td>
						<button type="button" class="categoryButton" name="categoryButton">도자기</button>
					</td>
					<td>
						<button type="button" class="categoryButton" name="categoryButton">가죽</button>
					</td>
					<td>
						<button type="button" class="categoryButton" name="categoryButton">목공</button>
					</td>
					<td>
						<button type="button" class="categoryButton" name="categoryButton">금속/악세서리</button>
					</td>

				</tr>
				<tr>
					<td>
						<button type="button" class="categoryButton" name="categoryButton">유리</button>
					</td>
					<td>
						<button type="button" class="categoryButton" name="categoryButton">조향/캔들/방향제</button>
					</td>
					<td>
						<button type="button" class="categoryButton" name="categoryButton">라탄/마크라메</button>
					</td>
					<td>
						<button type="button" class="categoryButton" name="categoryButton">자수/재봉/펠트</button>
					</td>
					<td>
						<button type="button" class="categoryButton" name="categoryButton">취미/레저</button>
					</td>

				</tr>
				<tr>
					<td>
						<button type="button" class="categoryButton" name="categoryButton">플라워/벌룬</button>
					</td>
					<td>
						<button type="button" class="categoryButton" name="categoryButton">애견</button>
					</td>
					<td>
						<button type="button" class="categoryButton" name="categoryButton">미술</button>
					</td>
					<td>
						<button type="button" class="categoryButton" name="categoryButton">음악(보컬/악기/프로그램
							등)</button>
					</td>
					<td>
						<button type="button" class="categoryButton" name="categoryButton">뷰티/미용</button>
					</td>

				</tr>
				<tr>
					<td>
						<button type="button" class="categoryButton" name="categoryButton">쿠킹</button>
					</td>
					<td>
						<button type="button" class="categoryButton" name="categoryButton">핸드메이드</button>
					</td>
					<td>
						<button type="button" class="categoryButton" name="categoryButton">키즈</button>
					</td>
					<td>
						<button type="button" class="categoryButton" name="categoryButton">기타</button>
					</td>

				</tr>
			</table>
		</div>
	</div>


</body>
</html>