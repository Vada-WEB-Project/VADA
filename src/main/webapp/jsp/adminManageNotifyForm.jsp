<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="vada.dao.impl.BoardListDAOImpl"%>
<%@ page import="vada.service.BoardListService"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	BoardListService notifyListService = new BoardListDAOImpl();
	
	request.setAttribute("list", notifyListService.notifyListBoard());

%>

<jsp:include page="top.jsp" />

<style>
th, td {
	border: 1px solid #000000;
	text-align: center;
}
</style>

<main>

	<div class="container-fluid px-4">
		<h1 class="mt-4">회원 정보관리</h1>
		<ol class="breadcrumb mb-4">
		</ol>
		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table me-1"></i> 회원목록
			</div>
			<div class="card-body">
			
				<table>
					<colgroup>
						<col width="500px" />
						<col width="1500px" />
						<col width="500px" />
					</colgroup>
					
					<thead>
						<tr>
							<th>신고글 제목</th>
							<th>신고자ID</th>
							<th>신고일시</th>
						</tr>
					</thead>
					
					<tbody>
						<c:set var="listSize" value="${list.size()}" />
						<c:forEach var="notifylistDTO" items="${list}" varStatus="stat">
							<tr>
								<td><a href="">${notifylistDTO.notifyreason}</a></td>
								<td>${notifylistDTO.notifyuserid}</td>
								<td>${notifylistDTO.notifydate}</td>
							</tr>
						</c:forEach>
					</tbody>
					
				</table>
				
			</div>
		</div>
	</div>

</main>

<jsp:include page="bottom.jsp" />