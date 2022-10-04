<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="java.util.List"%>
<%@ page import="vada.dto.CategoryDTO"%>
<%@ page import="java.util.Map"%>
<%@ page import="vada.dto.ProductpriceDTO"%>
<%@ page import="vada.dto.BoardDTO"%>
<%@ page import="vada.service.BoardViewService"%>
<%@ page import="vada.dao.impl.BoardViewDAOImpl"%>
<%@ page import="vada.dao.BoardDAO"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<jsp:include page="top.jsp" />

<style>
.container>img {
	width: 10%;
}

.swiper-container {
	height: 200px;
	width: 630px;
	position: relative;
	overflow: hidden;
	list-style: none;
	z-index: 1;
	padding-bottom: 30px;
}

.swiper-slide {
	text-align: center;
/* 	display: flex; /* 내용을 중앙정렬 하기위해 flex 사용 */ */
	align-items: center; /* 위아래 기준 중앙정렬 */
	justify-content: center; /* 좌우 기준 중앙정렬 */
	display: inline;
}

.swiper-slide img {
	max-width: 100%;
	height: auto;
 	display: block;
 	padding-left: 200px;
}
</style>

<%

	String productnum = (String) request.getParameter("productnum");
	System.out.println("productnum ==============> " + productnum);
	
	ProductpriceDTO productpriceDTO = new ProductpriceDTO();
	BoardDTO boardDTO = new BoardDTO();
	CategoryDTO categoryDTO = new CategoryDTO();
	
	Map<String, Object> map = new BoardViewDAOImpl().viewBoard(Integer.parseInt(productnum));
	
	boardDTO = (BoardDTO) map.get("boardDTO");
	productpriceDTO = (ProductpriceDTO) map.get("ProductpriceDTO");
	categoryDTO = (CategoryDTO) map.get("categoryDTO");
	List list = (List) map.get("imglist");
	
	pageContext.setAttribute("boardDTO", boardDTO);
	System.out.println("boardDTO ===========================> " + boardDTO);
	
	pageContext.setAttribute("productpriceDTO", productpriceDTO);
	System.out.println("productpriceDTO ===========================> " + productpriceDTO);
	
	pageContext.setAttribute("categoryDTO", categoryDTO);
	System.out.println("categoryDTO ===========================> " + categoryDTO);
	
	pageContext.setAttribute("imglist", list);
	
%>

<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<main>

	<div style="margin-left: 25%">

<!-- 	이미지 슬라이드 -->
		<div class="swiper-container">
			<div class="swiper-wrapper">
				<c:forEach var="item" items="${imglist}" varStatus="status">
					<div class="swiper-slide">
							<img src="${item}">
					</div>
	           	</c:forEach>	
			</div>
			<div class="swiper-pagination"></div>
			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
		</div>
		
		<script>
			new Swiper('.swiper-container', {
				loop: true,
				spaceBetween: 30,
		        pagination: {
		          el: ".swiper-pagination",
		          clickable: true,
		          type: 'fraction'
		        },
		        navigation: {
		          nextEl: ".swiper-button-next",
		          prevEl: ".swiper-button-prev",
		        },
		      });
		</script>
		
			<div class="row">
				<div class="col-md-6">
					<a href="notifyWriteForm.jsp?productnum=<%= request.getParameter("productnum") %>" class="btn btn-secondary" style="float: right">신고</a><br /><br /> <% // TODO EL로 바꿔야함 %>
					<h3>제목 : ${boardDTO.title}</h3>
					<h3>내용</h3><textarea style="width: 100%">${boardDTO.content}</textarea><br />
					<h3>카테고리 : ${categoriesDTO.categoryname}</h3>
					<h3>가격 : ${productpriceDTO.productprice}<d> 원</d></h3><br />
					<p>
						<a href="/Vada/jsp/boardUpdateForm.jsp" class="btn btn-secondary">글 수정</a> 
						<a href="javascript:confirmCommand('/Vada/jsp/boardDeleteProc.jsp?productnum=${boardDTO.productnum}','삭제');" class="btn btn-secondary">글 삭제</a> 
						<a href="/Vada/jsp/soldOutProc.jsp?productnum=${boardDTO.productnum}" class="btn btn-secondary" style="color: yellow">판매완료</a> 
						<a href="#" class="btn btn-info" style="float: right color: red">채팅하기&raquo;</a>
						<a href="/Vada/jsp/products.jsp" class="btn btn-secondary" style="float: right; margin-right: 5px;">찜</a>
					</p>
				</div>
			</div>

		<a href="/Vada/jsp/mainForm.jsp" class="btn btn-secondary" >메인 화면으로 돌아가기</a>
		
	</div>
	
</main>

<jsp:include page="bottom.jsp" />