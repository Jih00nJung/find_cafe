<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" href="style.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<body>
    <%@ include file="/WEB-INF/views/include/header.jsp" %>
    <!-- header -->
    <div class="container mt-4">
        <div class="row">
            <div class="col-12 text-center map-title">목록페이지</div>
        </div>
    </div>

    <div class="container mt-4">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <form class="form" action="list">
                    <div class="input-group">
                    	<input type="hidden" name="category_no" value="${category_no }">
                        <input class="form-control" name="keyword" type="text" placeholder="검색예시) '강남'" aria-label="검색">
                        <div class="input-group-append">
                            <button class="btn btn-outline-success" onclick="submit">검색</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="container mt-4">
        <div class="row">
            <c:forEach var="cafe_list" items="${cafe_list }">
                <div class="col-sm-4 mb-5">
                    <div class="card" style="width: 18rem;">
                        <img src="upload/${cafe_list.cafe_image }" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">
                                <b>${cafe_list.cafe_name }</b>
                            </h5>
                            <p class="card-text">${cafe_list.cafe_comment }</p>
                        </div>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">
                                ${cafe_list.cafe_time1 } ~ ${cafe_list.cafe_time1 }
                            </li>
                            <li class="list-group-item">
                                ${cafe_list.cafe_address }
                            </li>
                            <li class="list-group-item">
                                <span style="font-size: 24px; color: gold;">
                                    <c:set var="cafe_star" value="${ cafe_list.avg_cafe_star}" />
                                    <c:set var="num2" value="${cafe_star%1}" /> <!-- 이부분에 num빼고 별점 변수 넣으면 된다. -->
                                    <c:set var="num3" value="${cafe_star/1}" />
                                    <c:forEach begin="1" end="${num3}" var="star">
                                        <i class="fas fa-star"></i>
                                    </c:forEach>
                                    <c:if test="${cafe_star == 0}">
                                        <i class="far fa-star"></i>
                                    </c:if>
                                    <c:if test="${num2>0.5}">
                                        <i class="fas fa-star-half-alt"></i>
                                    </c:if>
                                    <span style="color: black; margin-left: 10px; font-size: 16px"> ${ cafe_list.avg_cafe_star}</span>
                                </span>
                            </li>
                        </ul>
                        <div class="card-body">
                            <button class="btn btn-primary" style="margin-left: 30px; vertical-align: middle;" onClick="location.href='Detail?cafe_no=${cafe_list.cafe_no}'">지금 바로 확인하기</button>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    
    <!-- 페이징 버튼 -->
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
		
		<!-- 검색했을 경우 목록 페이징 -->
		<c:if test="${not empty keyword}">
			<c:if test="${rp.startPage > rp.pagePerBlk }">
				<li class="page-item"><a class="page-link" href="list?category_no=1&pageNum=${rp.startPage-1 }&keyword=${keyword}"aria-label="Previous">
				<span aria-hidden="true">&laquo;</span></a>
				</li>
			</c:if>
			
			<c:forEach var="i" begin="${rp.startPage }" end="${rp.endPage }">
				<li <c:if test="${rp.currentPage == i }"> class="page-item active"</c:if> >
				<a class="page-link" href="list?category_no=1&pageNum=${i }&keyword=${keyword}">${i }</a></li>
			</c:forEach>
				
			<c:if test="${rp.endPage < rp.totalPage }">	
				<li class="page-item"><a class="page-link" href="list?category_no=1&pageNum=${rp.endPage+1}&keyword=${keyword}" aria-label="Next">
				<span aria-hidden="true">&raquo;</span></a>
				</li>
			</c:if>
		</c:if>
		
		<!-- 검색을 안할 경우 전체 목록 페이징 -->
		<c:if test="${empty keyword}">
			<c:if test="${rp.startPage > rp.pagePerBlk }">
				<li class="page-item"><a class="page-link" href="list?category_no=1&pageNum=${rp.startPage-1 }"aria-label="Previous">
				<span aria-hidden="true">&laquo;</span></a>
				</li>
			</c:if>
			
			<c:forEach var="i" begin="${rp.startPage }" end="${rp.endPage }">
				<li <c:if test="${rp.currentPage == i }"> class="page-item active"</c:if> >
				<a class="page-link" href="list?category_no=1&pageNum=${i }">${i }</a></li>
			</c:forEach>
				
			<c:if test="${rp.endPage < rp.totalPage }">	
				<li class="page-item"><a class="page-link" href="list?category_no=1&pageNum=${rp.endPage+1}" aria-label="Next">
				<span aria-hidden="true">&raquo;</span></a>
				</li>
			</c:if>
		</c:if>
		</ul>
	</nav>
</body>
</html>
