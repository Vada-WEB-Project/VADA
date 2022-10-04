<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="top.jsp" />

<style>
th, td {
	border: 1px solid #000000;
	text-align: center;
}
</style>

<main>

	<div class="container-fluid px-4">
		<h1 class="mt-4">구매 목록</h1>
		<ol class="breadcrumb mb-4">
		</ol>
		
		<div class="card mb-4">
			<div class="card-header">
				<i class="fas fa-table me-1"></i> Buy List
			</div>
			<div class="card-body">
				<table>
					<colgroup>
						<col width="3000px" />
						<col width="600px" />
					</colgroup>
					<thead>
						<tr>
							<th>게시물 제목</th>
							<th>후기작성</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>아이폰 17 미개봉</td>
							<td><input type="button" value="후기 작성" /></td>
						</tr>

						<tr>
							<td>갤럭시 버즈 프로</td>
							<td><input type="button" value="후기 작성" /></td>
						</tr>

						<tr>
							<td>포켓몬 빵 스티커</td>
							<td><input type="button" value="후기 작성" /></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	
</main>

<jsp:include page="bottom.jsp" />