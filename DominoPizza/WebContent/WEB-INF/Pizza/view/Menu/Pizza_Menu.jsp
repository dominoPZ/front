<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html lang="ko">
<head>
	<meta charset="euc-kr">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>도미노피자</title>
	<meta name="viewport" id="viewport" content="width=1119px, user-scalable=yes">
	<meta http-equiv='cache-control' content='no-cache'>
	<meta http-equiv='expires' content='0'>
	<meta http-equiv='pragma' content='no-cache'>
	<link rel="shortcut icon" href="https://cdn.dominos.co.kr/renewal2016/ko/w/img/favicon.ico"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/Pizza/css/font.css' />">
	<link rel="stylesheet" type="text/css" href="https://cdn.dominos.co.kr/renewal2016/ko/w/css/layout.css?v1.0">
	
	<script type="text/javascript" src="<c:url value='/Pizza/js/jquery1.11.1.js' />"></script>
	<script type="text/javascript" src="https://cdn.dominos.co.kr/renewal2016/ko/w/js/ui.js"></script>
	<script type="text/javascript" src="https://cdn.dominos.co.kr/renewal2016/ko/w/js/jquery.flexslider.js"></script>
	<script type="text/javascript" src="<c:url value='/Pizza/js/selectbox.js' />"></script><!-- js 수정함. -->
	<script type="text/javascript" src="<c:url value='/Pizza/js/d2CommonUtil.js' />"></script>
	<script type="text/javascript" src="<c:url value='/Pizza/js/Cookie.js' />"></script>
	<script type="text/javascript" src="<c:url value='/Pizza/js/basket_w.js' />"></script>
	<script type="text/javascript">
	var CON_DOMAIN_URL = "http://web.dominos.co.kr";
	var CON_SSL_URL = "https://web.dominos.co.kr";
	var CON_STATIC_URL = "https://cdn.dominos.co.kr/renewal2016/ko/w";

	$(document).ready(function() {
		$.ajaxSetup({cache:false});

		setBasketCnt();

		// 마이쿠폰 정보 조회(가입회원)
		
			$.ajax({
				type: "POST",
				url: "/mypage/mainMyCouponInfoAjax",
				dataType : "json",
				success:function(data) {
				 	if (data.resultData.status == "success") {
				 		$('#myMonth').text(data.resultData.myMonth+'월');
				 		$('#myLevel').text(data.resultData.myLevel);
				 		if(data.resultData.myCouponCnt > 0) {
				 			$(".none_coupon").hide();
					 		$(".exist_coupon").show();
					 		$('#myCouponCnt').html(data.resultData.myCouponCnt+"<span>개</span>");
					 		$('#gnbCoupon').text("("+data.resultData.myCouponCnt+")");
				 		}
					} else {
// 						console.log("마이쿠폰 정보 가져오기 실패");
					}
				}
			});
			

		// 주문&주문트레커 조회(가입회원/인증회원)
		
				$.ajax({
					type: "POST",
					url: "/mypage/leftMyOrderInfoAjax",
					dataType : "json",
					success:function(data) {
					 	if (data.resultData.status == "success") {
					 		// 현재 주문 진행중인건이 있으면
					 		if(data.resultData.ingOrderCnt > 0){
					 			var stateCode = data.resultData.state_code;
					 			$('#ingOrderInfo').show();
						 		$('#gnbOrderCnt').text("("+data.resultData.ingOrderCnt+")");
						 		$('#tracker_order_no').val(data.resultData.order_no);

						 		if(stateCode == '1' || stateCode == '2'){
						 			$(".tracker_step").parent().addClass("active");  // 접수완료
						 		}else if(stateCode == '3'){
						 			$(".tracker_step2").parent().addClass("active"); // 요리중
						 		}else if(stateCode == '4'){
						 			$(".tracker_step3").parent().addClass("active"); // 배달중
						 		}else if(stateCode == '5'){
						 			$(".tracker_step4").parent().addClass("active"); // 배달완료
						 		}else{
// 						 			console.log("Left 주문내역 가져오기 실패");
						 		}
					 		}
						} else {
// 							console.log("Left 주문내역 가져오기 실패");
						}
					}
				});
			
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
		location.href="/basket/detail";
	};

	var doLogin = function() {
		location.href="/global/login";
	};

	var myOrderDetail = function() {
		var order_no = $('#tracker_order_no').val();
		location.href="/mypage/myOrderView?order_no="+order_no+"&pageNo=1"
	};

</script>
<!-- Naver Anlytics 공통-->
<script>
var WCSLOG_URL = location.protocol == "https:" ? "https://wcs.naver.net/wcslog.js" : "http://wcs.naver.net/wcslog.js";
document.write(unescape("%3Cscript type='text/javascript' src='" + WCSLOG_URL +"' %3E%3C/script%3E"));
</script>
<!-- // Naver Anlytics 공통-->

<!-- 카이젠 공통-->
<script data-kz-key="7944084e2b522564"
data-kz-namespace="kzs"
src="//cdn.kaizenplatform.net/s/79/44084e2b522564.js" charset="utf-8">
</script> 
<!-- 카이젠 공통-->

</head>
<body>


	<!-- top_event_bnr -->
	<div class="top_bnr top_event" id="lineBanner">
		<div class="top_event_wrap">
			<a href="javascript:;" class="btn_ico btn_event_close" onclick="lineBannerClose(); return false;">close</a>
		</div>
	</div>
	<!-- //top_event_bnr -->

	<!-- wrap  -->
	<div id="wrap">
	
	
	<jsp:include page="/WEB-INF/Pizza/template/Top.jsp" />
	
	

<script>
$(document).ready(function() {

	$(".gnb_menu .menu01").addClass("on");
	
	$(".tab_category > ul > .C0101").addClass("active");


	$(".minus").click(function() {
		var obj = $(this).next().find("input");
		var cnt = parseInt(obj.val()) - 1;
		if(cnt < 1) cnt = 1;

		obj.val(cnt);
	});

	$(".add").click(function() {
		var obj = $(this).prev().find("input");
		var cnt = parseInt(obj.val()) + 1;
		if(cnt > 99) cnt = 99;

		obj.val(cnt);
	});
	
	<!-- 2017-05-08 // 챗봇 추가(s) -->
	$(document).ready(function(){
		var showAlert = setTimeout(function() {
			$('.chat_bubble').removeClass('active');
		}, 5000);
		$('.btn_chat').click(function(e){
		
				e.preventDefault();
				$('.layer_chat').addClass('active');
				$('body').addClass('fixed');
				$('#chatUrl').attr('src', "https://domichat.dominos.co.kr:10000/pc/order.html?dominoId=erjin1230&customerName=이어진&customerHpNo=010-8288-2305");
			
		})
		$('.layer_chat .btn_close').click(function(e){
		
				document.getElementById("chatUrl").contentWindow.postMessage("CHAT_CLOSE_REQUEST", "https://domichat.dominos.co.kr:10000");
			
		})
		$('.chat_order .btn_close').click(function(e){
			e.preventDefault();
			$('.chat_order').addClass('active')
			$('#chatUrl').attr('src', "https://domichat.dominos.co.kr:10000/pc/order.html?dominoId=erjin1230&customerName=이어진&customerHpNo=010-8288-2305");
		})
		$('.btn_chat').hover(function(e){
			e.preventDefault();
			$('.chat_bubble').addClass('active');
		})
		$('.btn_chat').mouseout(function(e){
			e.preventDefault();
			$('.chat_bubble').removeClass('active');
		})
	})
	
	window.onmessage = function(e){
		if(e.data == "CHAT_CLOSE_ACCEPT"){
			e.preventDefault();
			$('.layer_chat').removeClass('active');
			$('body').removeClass('fixed');
			$('#chatUrl').attr('src', "https://domichat.dominos.co.kr:10000/pc/order.html?dominoId=erjin1230&customerName=이어진&customerHpNo=010-8288-2305");
		}else
			alert("챗봇 서버와 통신이 원할하지 않습니다. 새로고침 후에 사용해 주세요");
	}
});


var qty = 0;
var addGoods = function(goodsCode) {
	qty = parseInt($("#"+goodsCode+"_qty").val());

	var returnUrl = "/goods/list?dsp_ctgr=C0101";

	addBasket("addGD", goodsCode, qty, "", "", addBasketComplete, returnUrl);
};

var addBasketComplete = function() {

};

var goView = function(menuCode, url) {
	location.href = url;
};

var chocolatChk = function() {
	if(confirm("해당 제품은 현재 900원 특가 프로모션 진행중입니다.\n특가제품 페이지로 이동하시겠습니까?")){
		location.href = "/hotdeal/chocolat";
	} else {
		return;
	}
}

</script>

<!-- container -->
<div id="container">
	<!-- content -->
	<div id="content" class="product">

		<!-- sub_title -->
		<div class="sub_title">
			<ul class="sub_nav">
				<li><a href="/main">HOME</a></li>
				<li><a href="/goods/list?dsp_ctgr=C0101">피자</a></li>
				<li><span>곡물도우</span></li>
				</ul>
			<div class="sub_title_wrap">
				<h2>피자</h2>
			</div>
		</div>
		<!-- //sub_title -->
		<div class="tab_category">
			<ul class="btn_tab">

	<li class="C0101"><a href="<c:url value='/menuList.pz?ty=101' />">곡물도우</a></li>
				<li class="C0102"><a href="<c:url value='/menuList.pz?ty=102' />">프리미엄</a></li>
				<li class="C0104"><a href="<c:url value='/menuList.pz?ty=103' />">클래식</a></li>
		</ul>
			<div class="tab_content_wrap">
				<div class="tab_content active">
					<div class="visual_category">
						<img src="<c:url value='/Pizza/Image/menub/${bimg } '/>" alt="">
					</div>
					<div class="lst_prd_type ">



						<!-- li 1번째 5번째 class="prd_list_rgt" 추가 ★★★★ // 앞에 공백 제거해줌 -->
						
						
						<ul>
						
						
						<c:forEach var="dtos" items="${dto }" varStatus="loop"  >
						<c:if test="${(loop.count-1) % 4==0 }" var="pif" >
						<c:set value="prd_list_rgt" var="pclass" />
						</c:if>
						<c:if test="${!pif }">
						<c:set value=" " var="pclass" />
						</c:if>
						<li class="${pclass}">
							<a href="<c:url value='/PizzaView.pz' />?p_no=${dtos.p_no}&gok=${gok}">
								<div class="prd_img">
										<div class="prd_tag">
										<span class="ico ico_tag">NEW</span>
										</div>
										<div class="prd_img_view"><img src="<c:url value='/Pizza/Image/pizzalist/${dtos.p_img}' />" alt="꽃게 온더 피자 곡물도우"></div>
									</div>
									<div class="prd_info">
										<div class="prd_title">${dtos.p_name }</div>
									</div>
							</a>
							<div class="prd_price">
							<p class="price_large"><span class="ico ico_s_large"></span>${dtos.p_sprice }<em>원</em></p>
									<p class="price_medium"><span class="ico ico_s_medium"></span>${dtos.p_lprice }<em>원</em></p>
								</div>
							</li>
							
						</c:forEach>
	
					


						</ul>
					</div>

				</div>

				<div class="lst_guide">
					<ul>
						<li>
							※ 트윈크레페/올댓치즈 피자 상품권 이용 안내
							<span>- 트윈크레페/올댓치즈 피자 단종으로 인해 해당 피자 상품권 구매 고객 대상으로 콜라 1.25L 무료제공하고 있습니다.<br>(주문금액 32,900원 초과 시 미제공) </span>
						</li>
						<li>
							※ 도이치휠레 단종으로 인한 상품권 사용 안내
							<span>- 타제품 주문 가능</span> (프리미엄 피자의 경우, 금액 추가)<br>
							<span>- 동일 가격 제품 : 포테이토/슈퍼슈프림/슈퍼디럭스/베이컨체더치즈 더블치즈 엣지, 리얼바비큐 곡물도우  </span>
						</li>
						<li>※ 일부 리조트 및 특수매장은 상기 가격과 차이가 있음 </li>
						<li>※ 모든 사진은 이미지 컷이므로 실제 제품과 다를 수 있습니다. </li>
					</ul>
				</div>
<div class="chat_order active">
					<!-- 2017-07-06 // 챗봇 말풍선 추가(s) -->
					<img class="chat_bubble active" src="http://cdn.dominos.co.kr/renewal2016/ko/w/img/domibubble.png" alt="챗봇말풍선">
					<!-- 2017-07-06 // 챗봇 말풍선 추가(e) -->
					<a href="#" class="btn_chat">채팅주문</a>
					<a href="#" class="btn_close">닫기</a>
				</div>
				<!-- 2017-07-06 // 챗봇 추가(e) -->		
			</div>
		</div>
	</div>
	<!-- //content -->
</div>
<!-- //container -->

<!-- LOGGER 환경변수 설정 -->
<script type="text/javascript">
	var goods_ctgr_nm = "";

	
	goods_ctgr_nm = "곡물도우";
	

	_TRK_PI = "PLV";			// 웹페이지의 성격 정의 - 상품리스트
    _TRK_CP = "/메뉴/피자/"+goods_ctgr_nm;	// 카테고리명 전달
</script>
<!-- // LOGGER 환경변수 설정 -->
<!-- 로딩 이미지 -->
		<div class="loading" id="defaultLoading" style="display:none;">
			<img src="https://cdn.dominos.co.kr/renewal2016/ko/w/img/loading.gif" alt="loading">
			<div class="dim"></div>
		</div>
		<!-- // 로딩 이미지 -->

		<!-- 장바구니 담기 토스트 팝업(s) -->
		<div class="pop_toast" id="card_add">
			<div class="bg"></div>
			<div class="pop_wrap">
				<div class="pop_content">
					<p>장바구니에 담았습니다.</p>
				</div>
			</div>
		</div>

		<!-- //장바구니 담기 토스트 팝업(e) -->

		<!-- 장바구니(s) -->
		<div class="pop_layer pop_type" id="cart_pop">
			<div class="bg"></div>
			<div class="pop_wrap">
				<div class="pop_header">
					<h2>장바구니</h2>
				</div>
				<!-- iframe src="100_cart_pop_frame.html" width="1000" height="832" frameborder="0"></iframe><!-- 2016-10-05//아이프레임대체 -->
				<a href="javascript:;" onclick="setBasketCnt();" class="btn_ico btn_close">닫기</a>
			</div>
		</div>
		<!-- //장바구니(e) -->

		<div id="footer">
			<div class="footer_wrap">
				<div class="company_info">
					<dl class="order_phone">
						<dt>전화주문</dt>
						<dd><span class="ico ico_phone"></span>1577-3082</dd>
					</dl>
					<ul class="list_sns">
						<li><a href="https://www.facebook.com/dominostory/" target="_blank" class="btn_facebook">facebook</a></li>
						<li><a href="https://twitter.com/dominostory" target="_blank" class="btn_twitter">twitter</a></li>
						<li><a href="http://blog.naver.com/dominostory" target="_blank" class="btn_blog">blog</a></li>
						<li><a href="https://www.instagram.com/dominostory/" target="_blank" class="btn_instar">instargram</a></li>
					</ul>
					<div class="footer_menu">
						<ul class="list_terms">
							<li><a href="/company/contents/overview">회사소개</a></li>
							<li><a href="/contents/privacy"><strong>개인정보 처리방침</strong></a></li>
							<li><a href="/contents/law">이용약관</a></li>
							<li><a href="/bbs/faqList?view_gubun=W&bbs_cd=online">고객센터</a></li>
						</ul>
						<ul class="list_company">
							<li>135-928 서울특별시 강남구 언주로 315 청오디피케이㈜</li>
							<li>문의 : <a href="mailto:webmaster@dominos.co.kr">webmaster@dominos.co.kr</a></li>
							<li>사업자 등록번호: 220-81-03371</li>
							<li>통신판매업신고: 강남 5064호</li>
							<li>개인정보 보호책임자 : 이명윤</li>
							<li>대표이사: 오광현</li>
						</ul>
						<address>Copyrightsⓒ2017 by Domino’s Pizza. All rights reserved.</address>
						<!-- a href="/contents/familySite" class="btn_family">family_brand</a  -->
					</div>
				</div>
				<div class="awards_area">
					<ul class="list_awards">
						<li>
							<img src="https://cdn.dominos.co.kr/renewal2016/ko/w/images/list_awards.png" alt="">
							<p>식품안전<br>경영시스템 인증</p>
						</li>
						<li>
							<img src="https://cdn.dominos.co.kr/renewal2016/ko/w/images/list_awards2.png" alt="">
							<p>지식경제부<br>우수디자인 선정</p>
						</li>
						<li>
							<img src="https://cdn.dominos.co.kr/renewal2016/ko/w/images/list_awards3.png" alt="">
							<p>고객이 가장 추천하는 기업<br/>피자전문점 부문 4년 연속 1위</p>
						</li>
						<li>
							<img src="https://cdn.dominos.co.kr/renewal2016/ko/w/images/list_awards4.png" alt="">
							<p>2016년 「대한민국인터넷소통대상」<br/>「대한민국소셜미디어대상」<br/>Leading Star (7년 연속 종합 1위)</p>
						</li>
						<li>
							<img src="https://cdn.dominos.co.kr/renewal2016/ko/w/images/list_awards5.png" alt="">
							<p>2016 한국산업의 고객만족도<br/>피자전문점 부문 2년 연속 1위</p>
						</li>
					</ul>
				</div>
			</div>
			<a href="#" class="btn_top">Top</a>
		</div>
		<!-- //footer -->
	</div>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-40278626-1', 'auto');
  ga('send', 'pageview');

</script>
<!-- LOGGER(TM) TRACKING SCRIPT V.40 FOR logger.co.kr / 21550 : COMBINE TYPE / DO NOT ALTER THIS SCRIPT. -->
<script type="text/javascript">var _TRK_LID="21550";var _L_TD="ssl.logger.co.kr";var _TRK_CDMN=".dominos.co.kr";</script>
<script type="text/javascript">var _CDN_DOMAIN = location.protocol == "https:" ? "https://fs.bizspring.net" : "http://fs.bizspring.net";
(function(b,s){var f=b.getElementsByTagName(s)[0],j=b.createElement(s);j.async=true;j.src='//fs.bizspring.net/fs4/bstrk.1.js';f.parentNode.insertBefore(j,f);})(document,'script');</script>
<noscript><img alt="Logger Script" width="1" height="1" src="http://ssl.logger.co.kr/tracker.tsp?u=21550&amp;js=N" /></noscript>
<!-- END OF LOGGER TRACKING SCRIPT -->

<!-- AceCounter Log Gathering Script V.70.2012031601-->
<script type="text/javascript" src="/resources/js/acecounter.js"></script>
<!-- AceCounter Log Gathering Script End -->

<!-- Naver Anlytics 공통-->
<script type="text/javascript" src="//wcs.naver.net/wcslog.js"> </script>
<script type="text/javascript">
if (!wcs_add) var wcs_add={};
wcs_add["wa"] = "s_273c36e36e8a";
if (!_nasa) var _nasa={};
wcs.inflow("dominos.co.kr");
wcs_do(_nasa);
</script>
<!-- // Naver Anlytics 공통 -->
<!-- 2017-05-08 // 챗봇 추가(s) -->

<div class="layer_chat">
	<div class="dim"></div>
	<div class="layer_content">
		<iframe id="chatUrl" src="" frameborder="0"></iframe>
		<a href="#" class="btn_close">닫기</a>
	</div>
</div>
<!-- 2017-05-08 // 챗봇 추가(e) -->
		
</body>
<script>
cookieManager.makePCID("PCID", 10);
</script>
</html>
