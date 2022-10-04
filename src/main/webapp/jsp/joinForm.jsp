<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="top.jsp" />

<style>
select {
	-moz-appearance: none;
	-webkit-appearance: none;
	appearance: none;
	font-family: "Noto Sansf KR", sans-serif;
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.5;
	color: #444;
	background-color: #fff;
	padding: .6em 1.4em .5em .8em;
	margin: 0;
	border: 1px solid #aaa;
	border-radius: .5em;
	box-shadow: 0 1px 0 1px rgba(0, 0, 0, .04);
}

select:hover {
	border-color: #888;
}

select:focus {
	border-color: #aaa;
	box-shadow: 0 0 1px 3px rgba(59, 153, 252, .7);
	box-shadow: 0 0 0 3px -moz-mac-focusring;
	color: #222;
	outline: none;
}

select:disabled {
	opacity: 0.5;
}

label {
	font-family: "Noto Sans KR", sans-serif;
	font-size: 1rem;
	font-weight: 600;
	line-height: 1.3;
	color: #444;
	margin-right: 0.5em;
}
</style>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

	// 우편번호 API
	window.onload = function() {
		document.getElementById("address_kakao").addEventListener("click", function() { // 주소입력칸을 클릭하면
			new daum.Postcode({
				oncomplete : function(data) { // 선택 시 입력값 세팅
					document.getElementById("address").value = data.address; // 주소 넣기
					document.querySelector("input[name=detailaddress]").focus(); // 상세입력 포커싱
				}
			}).open();
		});
	}

	//이메일 옵션 선택후 주소 자동 완성
	function change_email() {
		var email_add = document.getElementById("email_add");
		var email_sel = document.getElementById("email_sel");

		//지금 골라진 옵션의 순서와 값 구하기
		var idx = email_sel.options.selectedIndex;
		var val = email_sel.options[idx].value;

		email_add.value = val;
	}
	
</script>

<main>

	<form name="join_form" action="/Vada/jsp/joinProc.jsp" method="post">
		<div>
			<label>아이디<input type="text" name="userid" id="uid"></label>
			<button type="button" onclick="id_check();">중복확인</button>
		</div>
		<div>
			<label>비밀번호<input type="password" name="pwd" id="pwd" placeholder="영문자+숫자+특수문자 조합"></label>
		</div>
		<div>
			<label>비밀번호 재확인<input type="password" name="userpw" id="repwd"></label>
		</div>
		<div>
			<label>이름<input type="text" name="name" id="uname"></label>
		</div>

		<div>
			<label>전화번호<input type="tel" name="tel" id="mobile"> ex "-"없이 숫자만 입력 </label>
		</div>
		<div>
			<label>이메일<input type="text" name="email" id="email_id">@</label> 
			<input type="text" name="email_add" id="email_add"> 
			<select name="email_sel" id="email_sel" onchange="change_email();">
				<option value="">직접입력</option>
				<option value="naver.com">naver</option>
				<option value="gmail.com">gmail</option>
				<option value="nate.com">nate</option>
			</select>
		</div>
		<div>
			<label>기본주소<input type="text" id="address" name="address" readonly></label>
			<button type="button" id="address_kakao">우편번호 찾기</button>
		</div>
		<div>
			<label>상세주소<input type="text" name="detailaddress" id="addr2" size="30"></label>
		</div>
		<div>
			<label>닉네임<input type="text" name="nickname" id="nickname"></label>
		</div>
		<div>
			<lable>관심 카테고리 
				<select name="categories1">
					<option value="category1">category1</option>
					<option value="category2">category2</option>
					<option value="category3">category3</option>
				</select> <select name="interestcategorynum">
					<option value="100">100</option>
					<option value="200">200</option>
					<option value="300">300</option>
				</select> &nbsp;&nbsp; 
			</lable>
		</div>
		<div class="join_btn">
			<button type="button" onclick="history.back();">이전페이지로</button>
			<button type="button" onclick="this.form.submit();">가입하기</button>
		</div>
	</form>

</main>

<jsp:include page="bottom.jsp" />
