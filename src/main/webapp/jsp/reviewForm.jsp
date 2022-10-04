<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="top.jsp" />

<main>

	<div class="container">
		<div class="row">
			<form method="post" action="/Vada/jsp/writeAction.jsp">

				<table class="table table-stripped" style="text-align: center; boarder: 1px solid #dddddd">

					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">후기글 작성</th>
						</tr>
					</thead>

					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="20"></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height: 350px"></textarea></td>
						</tr>
						<tr>
							<td>
								<p style="float: left; font-size: 20px">별점 :</p> 
								<select name="reviewpoint" style="float: right">
									<option value="1">★☆☆☆☆</option>
									<option value="2">★★☆☆☆</option>
									<option value="3">★★★☆☆</option>
									<option value="4">★★★★☆</option>
									<option value="5">★★★★★</option>
								</select>
							</td>
						</tr>

					</tbody>

				</table>

				<input type="submit" class="btn btn-primary pull-right" value="등록">

			</form>

		</div>
	</div>

</main>

<jsp:include page="bottom.jsp" />