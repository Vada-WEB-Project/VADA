<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="top.jsp" />

<style>
@charset "UTF-8";

@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

html {
	font-family: "Noto Sans KR", sans-serif;
}
/*노말라이즈*/
body, ul, li {
	list-style: none;
	padding: 0;
	margin: 0;
}

a {
	text-decoration: none;
	color: inherit;
}

/*라이브러리*/
.con {
	margin-left: auto;
	margin-right: auto;
}

.cell {
	float: left;
	box-sizing: border-box;
	margin-bottom: 20px;
}

.row::after {
	content: "";
	display: block;
	clear: both;
}

.img-box>img {
	display: block;
	width: 100%;
	height: 300px;
}
/*커스텀*/
html, body {
	overflow-x: hidden;
}

.con {
	max-width: 1000px;
}

.logo-bar {
	text-align: center;
	margin-bottom: 20px;
	margin-top: 20px;
}

.bn-box {
	margin-bottom: 20px;
	margin-top: 20px;
}

@media ( max-width :700px ) {
	.top-bn-box-1 {
		overflow-x: hidden;
	}
	.top-bn-box-1>.img-box {
		margin-left: -50%;
	}
}

.menu-box {
	margin-bottom: 20px;
	margin-top: 20px;
}

.menu-box>ul>li {
	width: calc(100%/ 7);
}

@media ( max-width : 800px) {
	.menu-box {
		display: none;
	}
}

.menu-box>ul>li>a {
	display: block;
	text-align: center;
	font-weight: bold;
	position: relative;
}

.menu-box>ul>li:hover>a {
	color: red;
	text-decoration: underline;
}

.menu-box>ul>li>a::before, .menu-box>ul>li>a::after {
	content: "";
	width: 1px;
	height: 13px;
	background-color: black;
	position: absolute;
	top: 50%;
	transform: translatey(-50%);
	left: 0;
}

.menu-box>ul>li>a::after {
	left: auto;
	right: 0;
}

.menu-box>ul>li:first-child>a::before, .menu-box>ul>li:last-child>a::after
	{
	width: 2px;
}

.list>ul>li {
	width: calc(100%/ 3);
}

.list>ul>li {
	padding: 0 10px;
}

.list>ul {
	margin: 0 -10px;
}

.list>ul>li>.product-name {
	text-align: Center;
	font-weight: bold;
}

.list>ul>li:hover>.product-name {
	text-decoration: underline;
}

.list>ul>li>.product-price {
	text-align: center;
	font-weight: bold;
	font-size: 1.5rem;
}

.list>ul>li:hover>.product-date {
	text-align: Center;
}

@media ( max-width : 800px) {
	.list>ul>li {
		width: calc(100%/ 5);
	}
}

@media ( max-width : 650px) {
	.list>ul>li {
		width: calc(100%/ 4);
	}
}

@media ( max-width : 500px) {
	.list>ul>li {
		width: calc(100%/ 3);
	}
}

@media ( max-width : 400px) {
	.list>ul>li {
		width: calc(100%/ 2);
	}
}
</style>

<main>

	<div class="list con">
	
		<ul class="row">
		
			<li class="cell">
				<div class="img-box">
					<img class=imgfile src="https://biz.chosun.com/resizer/thXh4NamvP6VYoPlBZL3ogokvP4=/616x0/smart/cloudfront-ap-northeast-1.images.arcpublishing.com/chosunbiz/KRWGKWDOH5GR5N6DLEYILA6TLU.png" alt="" />
				</div>
				<div class="product-name">단가라 ops</div>
				<div class="product-price">19800</div>
				<div class="product-name">2022-02-01</div>
			</li>
			
			<li class="cell">
				<div class="img-box">
					<img class=imgfile src="http://bnx.oa.gg/img/bnx_16fw_visual_02_list.jpg" alt="">
				</div>
				<div class="product-name">단가라 ops</div>
				<div class="product-price">19800</div>
				<div class="product-name">2022-02-01</div>
			</li>
			
			<li class="cell">
				<div class="img-box">
					<img class=imgfile src="http://bnx.oa.gg/img/bnx_16fw_visual_03_list.jpg" alt="">
				</div>
				<div class="product-name">단가라 ops</div>
				<div class="product-price">19800</div>
				<div class="product-name">2022-02-01</div>
			</li>
			
			<li class="cell">
				<div class="img-box">
					<img class=imgfile src="http://bnx.oa.gg/img/bnx_16fw_visual_04_list.jpg" alt="">
				</div>
				<div class="product-name">단가라 ops</div>
				<div class="product-price">19800</div>
				<div class="product-name">2022-02-01</div>
			</li>
			
			<li class="cell">
				<div class="img-box">
					<img class=imgfile src="http://bnx.oa.gg/img/bnx_16fw_visual_05_list.jpg" alt="">
				</div>
				<div class="product-name">단가라 ops</div>
				<div class="product-price">19800</div>
				<div class="product-name">2022-02-01</div>
			</li>
			
			<li class="cell">
				<div class="img-box">
					<img class=imgfile src="http://bnx.oa.gg/img/bnx_16fw_visual_06_list.jpg" alt="">
				</div>
				<div class="product-name">단가라 ops</div>
				<div class="product-price">19800</div>
				<div class="product-name">2022-02-01</div>
			</li>
			
			<li class="cell">
				<div class="img-box">
					<img class=imgfile src="http://bnx.oa.gg/img/bnx_16fw_visual_07_list.jpg" alt="">
				</div>
				<div class="product-name">단가라 ops</div>
				<div class="product-price">19800</div>
				<div class="product-name">2022-02-01</div>
			</li>
			
			<li class="cell">
				<div class="img-box">
					<img class=imgfile src="http://bnx.oa.gg/img/bnx_16fw_visual_08_list.jpg" alt="">
				</div>
				<div class="product-name">단가라 ops</div>
				<div class="product-price">19800</div>
				<div class="product-name">2022-02-01</div>
			</li>
			
			<li class="cell">
				<div class="img-box">
					<img class=imgfile src="http://bnx.oa.gg/img/bnx_16fw_visual_09_list.jpg" alt="">
				</div>
				<div class="product-name">단가라 ops</div>
				<div class="product-price">19800</div>
				<div class="product-name">2022-02-01</div>
			</li>
			
		</ul>
		
	</div>
	
</main>

<jsp:include page="bottom.jsp" />