<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="vada.dto.CategoryDTO"%>
<%@ page import="java.util.List"%>
<%@ page import="vada.dao.impl.CategoryListDAOImpl"%>
<%@ page import="vada.service.CategoryService"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	request.setCharacterEncoding("utf-8");

	CategoryService categoryService = new CategoryListDAOImpl();
	List<CategoryDTO> categoryDTOList = categoryService.listCategory();
	
	pageContext.setAttribute("categoryDTOList", categoryDTOList);
%>

<jsp:include page="top.jsp" />

<main>

	<div class="container">
		<div class="row">
		
			<form method="post" action="/Vada/fileupload" enctype="multipart/form-data" accept-charset="utf-8">
				<input type="hidden" name="command" value="write" />
				
				<table class="table table-stripped" style="text-align: center; boarder: 1px solid #dddddd">
					
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">글 작성하기</th>
						</tr>
					</thead>
					
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="글 제목" name="title" maxlength="20"></td>
						</tr>
						<tr>
							<td style="float: left">카테고리 : 
							<select name="category">
								<option value="all">전체</option>
								<c:forEach var="categoryDTO" items="${categoryDTOList}">
									<option value="${categoryDTO.categorynum}">${categoryDTO.categoryname}</option>
								</c:forEach>
							</select>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용" name="content" maxlength="2048" style="height: 350px"></textarea></td>
						</tr>
						<tr>
							<td><input type="number" class="form-control" placeholder="가격 (원)" name="produectprice" maxlength="50"></td>
						</tr>
						<tr>
							<td style="float: left">첨부파일 : <input type="file" name="file1" /><br />
						</tr>
						<tr>
							<td style="float: left">첨부파일 : <input type="file" name="file2" /><br />
						</tr>
						<tr>
							<td style="float: left">첨부파일 : <input type="file" name="file3" /><br />
						</tr>
					</tbody>
					
				</table>
				
				<input type="submit" class="btn btn-primary pull-right" value="등록">
				
			</form>
			
		</div>
	</div>
	
</main>

<jsp:include page="bottom.jsp" />