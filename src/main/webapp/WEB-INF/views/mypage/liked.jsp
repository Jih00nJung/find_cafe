<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<div class="container mt-4">
		<div class="row">
			<!-- sidebar -->
			<div class="col-md-2">
				<%@ include file="/WEB-INF/views/include/sidebar.jsp"%>
			</div>

			<input type="hidden" name="member_id" value="${member.member_id }">

			<!-- 목록페이지 -->
			<div class="col-md-10">
				<div class="row">
					<c:forEach var="l" items="${likedResult }"
						begin="${liked.startRow }" end="${liked.endRow }" varStatus="num">
						<input type="hidden" name="cafe_no" value="${l['CAFE_NO'] }">
						<div class="col-sm-4 mb-5">
							<div class="card" style="width: 18rem;">
								<img src="upload/${l['CAFE_IMAGE'] }" class="card-img-top"
									alt="카페 이미지">
								<div class="card-body">
									<h5 class="card-title">
										<a href="Detail?cafe_no=${l['CAFE_NO']}">${l['CAFE_NAME'] }</a>
									</h5>
									<p class="card-text"></p>
								</div>
								<ul class="list-group list-group-flush">
									<li class="list-group-item">${l['CAFE_ADDRESS'] }</li>
									<c:choose>
										<c:when test="${fn:length(cafe.cafe_content ) <= 10}">
											<li class="list-group-item">${l['CAFE_COMMENT'] }</li>
										</c:when>
										<c:otherwise>
											<li class="list-group-item">${fn:substring(cafe.cafe_content, 0, 10)}...</li>
										</c:otherwise>
									</c:choose>

									<li class="list-group-item">별점 : ${l['AVG_CAFE_STAR'] }</li>
								</ul>
								<div class="card-body">
									<button class="btn btn-primary"
										style="margin-left: 30px; vertical-align: middle;"
										onClick="location.href='Detail?cafe_no=${l['CAFE_NO']}'">지금
										바로 확인하기</button>
								</div>
							</div>
						</div>
					</c:forEach>


					<!-- 페이징 버튼 -->
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
							<li class="page-item"><a class="page-link"
								href="liked?member_id=${member_id }&pageNum=${pp.startPage }"
								aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>

							<c:forEach var="i" begin="${pp.startPage }"
								end="${pp.totalPage }">
								<li class="page-item"><a class="page-link"
									href="liked?member_id=${member_id }&pageNum=${i}">${i}</a></li>
							</c:forEach>
							<li class="page-item"><a class="page-link"
								href="liked?member_id=${member_id }&pageNum=${pp.totalPage }"
								aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
						</ul>
					</nav>




				</div>
			</div>
		</div>
	</div>
</body>
</html>
