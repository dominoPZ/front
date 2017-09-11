<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<head>
	<meta charset="euc-kr">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>도미노피자</title>
	<meta name="viewport" id="viewport" content="width=1119px, user-scalable=yes">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="pragma" content="no-cache">
	<link rel="shortcut icon" href="https://cdn.dominos.co.kr/renewal2016/ko/w/img/favicon.ico">
	<link rel="stylesheet" type="text/css" href="https://web.dominos.co.kr/resources/css/font.css">
	<link rel="stylesheet" type="text/css" href="https://cdn.dominos.co.kr/renewal2016/ko/w/css/layout.css?v1.0">
<script async="" src="https://web.dominos.co.kr//fs.bizspring.net/fs4/logger.v4.1.js"></script><script async="" src="https://web.dominos.co.kr//fs.bizspring.net/fs4/bstrk.1.js"></script><script async="" src="https://www.google-analytics.com/analytics.js"></script><script async="" src="https://www.google-analytics.com/analytics.js"></script><script type="text/javascript" src="https://web.dominos.co.kr/resources/js/jquery1.11.1.js"></script>
	<script type="text/javascript" src="https://cdn.dominos.co.kr/renewal2016/ko/w/js/ui.js"></script>
	<script type="text/javascript" src="https://cdn.dominos.co.kr/renewal2016/ko/w/js/jquery.flexslider.js"></script>
	<script type="text/javascript" src="https://web.dominos.co.kr/resources/js/selectbox.js"></script><!-- js 수정함. -->
	<script type="text/javascript" src="https://web.dominos.co.kr/resources/js/d2CommonUtil.js"></script>
	<script type="text/javascript" src="https://web.dominos.co.kr/resources/js/Cookie.js"></script>
	<script type="text/javascript" src="https://web.dominos.co.kr/resources/js/basket_w.js"></script>
	<script type="text/javascript">
	var CON_DOMAIN_URL = "http://web.dominos.co.kr";
	var CON_SSL_URL = "https://web.dominos.co.kr";
	var CON_STATIC_URL = "https://cdn.dominos.co.kr/renewal2016/ko/w";

	$(document).ready(function() {
		$.ajaxSetup({cache:false});

		setBasketCnt();

		// 마이쿠폰 정보 조회(가입회원)
		

		// 주문&주문트레커 조회(가입회원/인증회원)
		
	});

	function setBasketCnt() {
		var basketCnt = cookieManager.getCookie("BASKETCNT");
		var basket = cookieManager.getCookie("BASKET");
		var finish_basket = cookieManager.getCookie("FINISH_BASKET");

		if(basketCnt == "") basketCnt = "0";
		else if(basket != "" && basket == finish_basket) basketCnt = "0";
		if(basketCnt != "0")
			$(".cart_count").text(basketCnt);
	}

	var goCart = function() {
		location.href="https://web.dominos.co.kr/basket/detail";
	};

	var doLogin = function() {
		location.href="https://web.dominos.co.kr/global/login";
	};

	var myOrderDetail = function() {
		var order_no = $('#tracker_order_no').val();
		location.href="https://web.dominos.co.kr/mypage/myOrderView?order_no="+order_no+"&pageNo=1"
	};

</script>

<script>
	$(function(){
			var a="T0100";
			$(".btn_tab>li").click(function(){
				if(a!=this.id){
				$(".tab_content_wrap li").hide();
				$("."+this.id).show(function(){
				});
				//this.id
				a=this.id;
				}
				
				});
			
			$(".btn_txt").click(function(){
				
				$("option").each(function(){
					alert($(this).html());
					
				});
				
			});
			
		});
</script>

<!-- Naver Anlytics 공통-->
<script>
var WCSLOG_URL = location.protocol == "https:" ? "https://wcs.naver.net/wcslog.js" : "http://wcs.naver.net/wcslog.js";
document.write(unescape("%3Cscript type='text/javascript' src='" + WCSLOG_URL +"' %3E%3C/script%3E"));
</script><script type="text/javascript" src="https://wcs.naver.net/wcslog.js"></script>
<!-- // Naver Anlytics 공통-->

<!-- 카이젠 공통-->
<script data-kz-key="7944084e2b522564" data-kz-namespace="kzs" src="https://web.dominos.co.kr//cdn.kaizenplatform.net/s/79/44084e2b522564.js" charset="utf-8" data-kz-loaded-sitejs-id="7944084e2b522564">
</script> 
<!-- 카이젠 공통-->

</head>




<div class="pop_layer pop_type topping open" id="topping_info_pop2"><!-- 마이 키친 토핑 선택팝업(s) -->
<div class="bg"></div>
<div class="pop_wrap" style="top: 430px;">
	<div class="pop_header">
		<h2>마이 키친 토핑 선택</h2>
	</div>
	<div class="pop_content">
		<p class="txt_topping">- 토핑은 최대 7개 선택 가능</p>
		<p class="txt_topping">- 기본으로 모차렐라 치즈가 추가됩니다. (슈퍼스프림 피자 정량 기준)</p>
		<div class="tab tab_type2">
			<ul class="btn_tab">
				<li class="active" id="T0100" ><a href="javascript:test" >메인</a></li>
				<li id="T0300" ><a href="javascript:test" >치즈</a></li>
				<li id="T0400" ><a href="javascript:test" >애프터</a></li>
			</ul>
			<div class="tab_content_wrap">
				<div class="tab_content active">
					<div class="lst_topping_wrap">
						<ul> <!-- class="bg_lst_gray" -->
						
						
			<li class="T0400 toppingli" style="display:none;">
								<div class="img_topping">
									<img src="https://cdn.dominos.co.kr/admin/upload/topping/RTP854.jpg" alt="모차렐라 치즈" onerror="this.src='https://cdn.dominos.co.kr/admin/upload/topping/topping_default.jpg'">
									<span class="ico ico_or_chk"></span>
								</div>
								<p><strong>모차렐라 치즈</strong> <span> (S:1,500원)</span></p>

								<div class="sel_box">
									<select name="toppingCode" class="select toppingselect" style="">
										<option value="">선택</option>
					<option value="RTP854HL:1" data-price="1500" data-name="모차렐라 치즈" data-weight="S">S:1,500원</option>
			<option value="RTP855HL:1" data-price="2500" data-name="모차렐라 치즈" data-weight="M">M:2,500원</option>
			<option value="RTP856HL:1" data-price="3500" data-name="모차렐라 치즈" data-weight="L">L:3,500원</option>
			</select>
								</div>
							</li>
							
							
						<li class="T0300 toppingli" style="display:none;">
								<div class="img_topping">
									<img src="https://cdn.dominos.co.kr/admin/upload/topping/RTP857.jpg" alt="체더 치즈" onerror="this.src='https://cdn.dominos.co.kr/admin/upload/topping/topping_default.jpg'">
									<span class="ico ico_or_chk"></span>
								</div>
								<p><strong>체더 치즈</strong> <span> (S:1,000원)</span></p>

								<div class="sel_box">
									<select name="toppingCode" class="select toppingselect" style="">
										<option value="">선택</option>
					<option value="RTP857HL:1" data-price="1000" data-name="체더 치즈" data-weight="S">S:1,000원</option>
			<option value="RTP858HL:1" data-price="1500" data-name="체더 치즈" data-weight="M">M:1,500원</option>
			<option value="RTP859HL:1" data-price="2000" data-name="체더 치즈" data-weight="L">L:2,000원</option>
			</select>
								</div>
							</li>
							
							
						<li class="T0100 toppingli" style="">
								<div class="img_topping">
									<img src="https://cdn.dominos.co.kr/admin/upload/topping/RTP839.jpg" alt="케이준 새우살" onerror="this.src='https://cdn.dominos.co.kr/admin/upload/topping/topping_default.jpg'">
									<span class="ico ico_or_chk"></span>
								</div>
								<p><strong>케이준 새우살</strong> <span> (S:2,000원)</span></p>

								<div class="sel_box">
									<select name="toppingCode" class="select toppingselect" style="">
										<option value="">선택</option>
					<option value="RTP839HL:1" data-price="2000" data-name="케이준 새우살" data-weight="S">S:2,000원</option>
			<option value="RTP840HL:1" data-price="4000" data-name="케이준 새우살" data-weight="M">M:4,000원</option>
			<option value="RTP841HL:1" data-price="6000" data-name="케이준 새우살" data-weight="L">L:6,000원</option>
			</select>
								</div>
							</li>
							
						<li class="T0100 toppingli" style="">
								<div class="img_topping">
									<img src="https://cdn.dominos.co.kr/admin/upload/topping/RTP821.jpg" alt="파인애플" onerror="this.src='https://cdn.dominos.co.kr/admin/upload/topping/topping_default.jpg'">
									<span class="ico ico_or_chk"></span>
								</div>
								<p><strong>파인애플</strong> <span> (S:300원)</span></p>

								<div class="sel_box">
									<select name="toppingCode" class="select toppingselect" style="">
										<option value="">선택</option>
					<option value="RTP821HL:1" data-price="300" data-name="파인애플" data-weight="S">S:300원</option>
			<option value="RTP822HL:1" data-price="500" data-name="파인애플" data-weight="M">M:500원</option>
			<option value="RTP823HL:1" data-price="1000" data-name="파인애플" data-weight="L">L:1,000원</option>
			</select>
								</div>
							</li>
							
						
						</ul>
					</div>
				</div>

			</div>
		</div>
		<div class="btn_wrap topping_tatal">
			<div class="btn_fix_lft">
				<a href="javascript:toppingReset();" class="btn"><span class="btn_txt">초기화</span></a>
			</div>
			<div class="btn_fix_rgt">
				<p><strong>토핑금액 : </strong><span id="toppingTotalAmount">총 0원</span></p>
			</div>
		</div>
		<a href="javascript:setToppingCheck();" class="btn btn_mdle btn_red btn_block"><span class="btn_txt">토핑 추가하기 <span id="toppingTotalCnt"></span></span></a>

	</div>
	<a href="javascript:closeLayer();" class="btn_ico btn_close">닫기</a>
</div>
<!-- //마이 키친 토핑 선택팝업(e) -->

