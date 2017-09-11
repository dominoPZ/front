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
	<link rel="shortcut icon" href="<c:url value='/Pizza/Image/favicon.ico'/>"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/Pizza/css/font.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='https://cdn.dominos.co.kr/renewal2016/ko/w/css/layout.css'/>">
	<!-- https://cdn.dominos.co.kr/renewal2016/ko/w/css/layout.css / /Pizza/css/layout.css -->
<script type="text/javascript" src="<c:url value='/Pizza/js/jquery1.11.1.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/Pizza/js/ui.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/Pizza/js/jquery.flexslider.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/Pizza/js/selectbox.js'/>"></script><!-- js 수정함. -->
	<script type="text/javascript" src="<c:url value='/Pizza/js/d2CommonUtil.js'/>"></script>
	<%-- <script type="text/javascript" src="<c:url value='/Pizza/js/Cookie.js'/>"></script> --%> <!-- 오류 부분 -->
	<script type="text/javascript" src="<c:url value='/Pizza/js/basket_w.js'/>"></script>
	<script type="text/javascript">
	var CON_DOMAIN_URL = "http://web.dominos.co.kr";
	var CON_SSL_URL = "https://web.dominos.co.kr";
	var CON_STATIC_URL = "https://cdn.dominos.co.kr/renewal2016/ko/w";

	
	
	
	
	$(document).ready(function() {
		$.ajaxSetup({cache:false});
		$(".gnb_menu .menu04").addClass("on");
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
	
	<!-- 헤더 인클루드 -->
	<jsp:include page="/WEB-INF/Pizza/template/Top.jsp" />


<script>
var pizzaList1, pizzaList2 = null;
$(document).ready(function() {
	$(".gnb_menu .menu04").addClass("on");

	$.ajax({
		type: "POST",
		dataType: "json",
		async: false,
		url: "/goods/hnhAjax",
		success:function(data) {
			pizzaList1 = data.resultData;
		 	if(pizzaList1) {
		 		$.each(pizzaList1, function(k, v) {
		 			var isExist = false;
		 			$.each($("#pizza_select1 option"), function() {
		 				if(v.code_01 == $(this).val()) isExist = true;
		 			});
		 			if(!isExist)
		 				$("#pizza_select1").append("<option value='"+v.code_01+"' data-price='"+v.price+"' data-code='"+v.hnh_code+"'>"+v.name+"</option>");
		 		});
		 	}
		},
		error: function (xhr,status,error){
			if(xhr.status != "0") {
				alert("다시 시도해주세요."+xhr.status);
			}
		}
	});

	//첫번째 피자 체인지 이벤트 발생시
	$("#pizza_select1").change(function() {
		$("#pizza_select2 option:gt(0)").remove();
		$("#dough option:gt(0)").remove();
		$("#size option:gt(0)").remove();

		$(".half_right").removeClass("on");
		$(".half_right span").html("피자를 선택하세요.");
		//피자 반쪽 이미지 왼쪽
		if($(this).val() != "") {
			$(".half_left").addClass("on");
			//$(".half_left span").html('<img src="https://cdn.dominos.co.kr/admin/upload/hnh/'+$(this).val()+'.png" alt="선택한 첫 번째 피자" />');
			$(".half_left span").html('<img src="<c:url value='/Pizza/Image/꽃게 온더 피자.png'/>" alt="선택한 첫 번째 피자"/>');
		} else {
			$(".half_left").removeClass("on");
			$(".half_left span").html("피자를 선택하세요.");
			return;
		}

		$.ajax({
			type: "POST",
			url: "/goods/hnhMappingAjax",
			data: {code_01 : $(this).val()},
			success:function(data) {
				pizzaList2 = data.resultData;
			 	if(pizzaList2) {
			 		$.each(pizzaList2, function(k, v) {
			 			var isExist = false;
			 			$.each($("#pizza_select2 option"), function() {
			 				if(v.code_01 == $(this).val()) isExist = true;
			 			});
			 			if(!isExist)
			 				$("#pizza_select2").append("<option value='"+v.code_01+"' data-price='"+v.price+"' data-code='"+v.hnh_code+"'>"+v.name+"</option>");
			 		});
			 	}
			},
			error: function (error){
				alert("다시 시도해주세요.");
			}
		});

		setTotalAmt();
	});

	$("#pizza_select2").change(function() {
		$("#dough option:gt(0)").remove();
		$("#size option:gt(0)").remove();

		if($(this).val() != "") {
			$(".half_right").addClass("on");
			$(".half_right span").html('<img src="https://cdn.dominos.co.kr/admin/upload/hnh/'+$(this).val()+'.png" alt="선택한 두 번째 피자" />');
		} else {
			$(".half_right").removeClass("on");
			$(".half_right span").html("피자를 선택하세요.");
		}

		setDough();

	});

	$("#dough").change(function() {
		setSize();
	});

	$("#size").change(function() {
		removeTopping();
		setTotalAmt();
	});

	/*$("#qty").change(function() {
		if($(this).val() != "1") {
			$("#pizzaQty").html(" X 피자("+$(this).val()+")");
		} else {
			$("#pizzaQty").html("");
		}
		setTotalAmt();
	})*/;

	$("#btn_basket").click(function() {
		if($("#pizza_select1").val() == "") {
			alert("첫 번째 피자를 선택해주세요.");
			return;
		}

		if($("#pizza_select2").val() == "") {
			alert("두 번째 피자를 선택해주세요.");
			return;
		}

		if($("#dough").val() == "") {
			alert("도우를 선택해주세요.");
			return;
		}

		if($("#size").val() == "") {
			alert("사이즈를 선택해주세요.");
			return;
		}
		if($("#qty").val() == "") {
			alert("수량을 선택해주세요.");
			return;
		}

		var goods_code = $("#pizza_select1").val() + $("#size").val() + "/" + $("#pizza_select2").val() + $("#size").val();

		addBasket("addPZ", goods_code, $("#qty").val(), $("#toppingList").val(), "", addBasketComplete, "/goods/hnh");
	});


	$(".minus").click(function() {
		var cnt = parseInt($("#qty").val()) - 1;
		if(cnt < 1) cnt = 1;

		$("#qty").val(cnt);
		setTotalAmt();
		setToppingStr();

	});

	$(".add").click(function() {
		var cnt = parseInt($("#qty").val()) + 1;
		if(cnt > 9) cnt = 9;

		$("#qty").val(cnt);
		setTotalAmt();
		setToppingStr();

	});

});

var setToppingStr = function() {
	if($("#qty").val() != "1" && $("#toppingList").val() != "") {
		$(".pizzaQty").html(" X 피자("+$("#qty").val() +")");
	} else {
		$(".pizzaQty").html("");
	}
};

//토핑 리셋
var removeTopping = function() {
	$("#toppingList").val("");
	$("#toppingTotalAmt").val("");
	$(".toppingSum").html("내맘대로 토핑을 추가해보세요.");
	//$(".balloon_wrap").hide();
};


var addBasketComplete = function() {
	window.setTimeout( function() {location.href="/goods/hnh?v="+new Date();}, 900);
};


var setDough = function() {
	$("#dough option:gt(0)").remove();
	$("#size option:gt(0)").remove();

	$.each(pizzaList2, function(k, v) {
		var val = v.gubun;
		var nm = v.ctgr_nm;
		var isExist = false;
		$("#dough option").each(function() {
			if($("#pizza_select1").val() == v.code_01)
				isExist = true;
			else if($(this).val() == val)
				isExist = true;
		});
		if(!isExist) {
			$("#dough").append("<option value='"+val+"'>"+nm+"</option>");
		}
	});
	setSize();
};

//사이즈 옵션 셋팅
var setSize = function() {
	$("#size option:gt(0)").remove();

	if($("#dough").val() != "") {
		$.each(pizzaList2, function(k, v) {
			if($("#pizza_select2").val() == v.code_01 && v.gubun == $("#dough").val()) {
				$("#size").append("<option value='"+(v.hnh_code).substring(6,8)+"'>"+ v.sub_name + "</option>");
			}
		});
	}

	setTotalAmt();

};

//토핑 가져오기
var addToppingCheck = function() {
	if($("#size").val() == "") {
		alert("피자, 도우, 사이즈를 선택해주세요.");
		return;
	}

	if($("#pizza_select1").val() == "") {
		alert("피자를 선택해주세요.");
		return;
	}

	var size = $("#size").val();
	var goods_code = $("#pizza_select1").val()+size+"/"+$("#pizza_select2").val()+size;

	$.ajax({
		type: "POST",
		url: "/goods/pauseCheck",
		data: { 'goods_code': goods_code },
		success:function(data) {
			if(data.resultData.result == "success") {
				addTopping();
			} else {
				alert(data.resultData.result);
				return;
			}
		},
		error: function (error){
			alert("다시 시도해주세요.");
		}
	});
};



//토핑 가져오기
var addTopping = function() {
	if($("#size").val() == "") {
		alert("피자, 도우, 사이즈를 선택해주세요.");
		return;
	}

	if($("#pizza_select1").val() == "") {
		alert("피자를 선택해주세요.");
		return;
	}

	$("#topping_info_pop").html("");
	$.ajax({
		type: "POST",
		url: "toppingLayer",
		data: { 'code_01': $("#pizza_select1").val()+$("#size").val() },
		success:function(data) {
		 	$("#topping_info_pop").html(data).addClass("open");
		 	var top = $(window).scrollTop();
		 	$("#topping_info_pop").find('.pop_wrap').css('top',top+30+'px');
		},
		error: function (error){
			alert("다시 시도해주세요.");
		}
	});
};



var setTotalAmt = function() {
	if($("#size").val() == "" || $("#qty").val() == "") {
		$("#totalAmt").text("0원");
		return;
	}

	var price = 0;
	$.each(pizzaList1, function(k, v) {
		if(v.hnh_code == ($("#pizza_select1").val()+$("#size").val()))
			price += parseInt(v.price) / 2;
	});

	$.each(pizzaList2, function(k, v) {
		if(v.hnh_code == ($("#pizza_select2").val()+$("#size").val()))
			price += parseInt(v.price) / 2;
	});

	var pizzaAmt = price * parseInt($("#qty").val());
	var toppingAmt = ($("#toppingTotalAmt").val() != "")? parseInt($("#toppingTotalAmt").val()) * parseInt($("#qty").val()) : 0;
	$("#totalAmt").text((pizzaAmt + toppingAmt).cvtNumber() + "원");
};

var closeLayer = function() {
	$(".pop_layer").removeClass("open");
};

</script>
<!-- container -->
<div id="container">
	<!-- content 상단바 메뉴 밑 컨텐츠 시작============================================================================================================== -->
	<div id="content" class="event">

		<!-- sub_title -->
		<div class="sub_title">
			<ul class="sub_nav">
				<li><a href="/main">HOME</a></li>
				<li><a href="<c:url value='/Pizza/BuyPizza/hnh.pz'/>">내맘대로 피자</a></li>
				<li><span>하프&amp;하프</span></li>
			</ul>
			<div class="sub_title_wrap">
				<h2>내맘대로 피자</h2>
			</div>
		</div>
		<!-- //sub_title -->


		<div class="tab_category">
			<ul class="btn_tab">
				<li class="active"><a href="javascript:;">하프&amp;하프</a></li>
				<li><a href="<c:url value='/Pizza/BuyPizza/mykitchen.pz'/>">마이 키친</a></li>
				<li><a href="<c:url value='/Pizza/BuyPizza/topping.pz'/>">추가 토핑 안내</a></li>
			</ul>
			<div class="tab_content_wrap pizza">
				<div class="tab_content">
					<span class="mykitchen_obj"></span>
				</div>
				<div class="tab_content active half">
					<!--  피자 선택 전 -->
					<!-- <div class="pizza_visual">
						<div class="half_left">
							<span class="sel_pizza">피자를 선택하세요</span>
						</div>
						<div class="half_right">
							<span class="sel_pizza">피자를 선택하세요</span>
						</div>
					</div> -->

					<!-- 피자 선택 후 -->
					<div class="pizza_visual">
						<div class="half_left">
							<span class="sel_pizza">피자를 선택하세요</span>
						</div>
						<div class="half_right">
							<span class="sel_pizza">피자를 선택하세요</span>
						</div>
					</div>


				</div>
				<div class="tab_content"></div>
			</div>
		</div>
		<!-- //tab -->


		<div class="halfandhalf_container">
			<div class="halfandhalf_card">
				<div class="card_title"><img src="https://cdn.dominos.co.kr/renewal2016/ko/w/img/tit_half.png" alt="half & half pizza"></div>
				<div class="card_content">
					<div class="halfandhalf_content">

						<div class="prd_selbox">
							<div class="option_title">피자를 선택하세요. </div>

							<div class="form_group">
								<div class="form_field">
										<div class="sel_box">
											<select id="pizza_select1">
												<option value="">첫 번째 피자 선택</option>
												<c:forEach items="${pizzaList}" var="pizza">
													<option value="${pizza.p_no}">${pizza.p_name}</option>
												</c:forEach>												
											</select>
										</div>
								</div>
								<div class="form_field">
									<div class="sel_box">
										<select id="pizza_select2">
													<option value="">두 번째 피자 선택</option>
													<c:forEach items="${pizza}" var="pizza">
													<option value="피자코드">${pizza.name}</option>
												</c:forEach>	
										</select>
									</div>
								</div>
							</div>
							<!-- //form_group -->


						</div>
						<!-- //prd_selbox -->

						<div class="prd_selbox">
							<div class="prd_dogh">

								<div class="option_title">도우</div>

								<div class="form_group">
										<div class="form_field">
											<div class="sel_box">
												<select id="dough">
													<option value="">선택</option>
													<option value="104">오리지널</option>
													<option value="115">나폴리</option>
													<option value="103">씬</option>
													<option value="203">곡물</option>
												</select>
											</div>
										</div>
									</div>
								<!-- //form_group -->

							</div>
							<!-- //prd_dogh -->

							<div class="prd_size">

								<div class="option_title">사이즈</div>

								<div class="form_group">
									<div class="form_field">
											<div class="sel_box">
												<select name="" id="size">
													<option value="">선택</option>
													<option value="SM">M</option>
													<option value="SL">L</option>
												</select>
											</div>
										</div>
								</div>
								<!-- //form_group -->


							</div>


						</div>
						<!-- //prd_selbox -->


						<div class="prd_toppingbox">


							<div class="btn_balloon balloon_rgt">
								<input type="hidden" id="toppingList" value="" />
								<input type="hidden" id="toppingNmList" value="" />
								<input type="hidden" id="toppingTotalAmt" value="0" />
								<a href="javascript:addToppingCheck();" class="btn"><span class="btn_txt">토핑 추가하기</span></a>
								<div class="balloon_wrap">
									<p class="toppingSum">내맘대로 토핑을 추가해보세요.<span class="pizzaQty"></span></p>
								</div>
							</div>


						</div>
						<!-- //prd_toppingbox -->


						<div class="prd_valuebox">

							<div class="option_title">수량 선택</div>


							<div class="input_num">
								<a href="javascript:;" class="minus"><span class="ico ico_minus"></span></a>
								<div class="form_item">
									<input type="text" id="qty" class="i_text" value="1" readonly />
								</div>
								<a href="javascript:;" class="add"><span class="ico ico_add"></span></a>
							</div>

						</div>
						<!-- //prd_valuebox -->
					</div>
					<!-- //halfandhalf_content -->
				</div>
				<!-- //card_content -->
			</div>
			<!-- //halfandhalf_card -->

			<!-- 장바구니 버튼 -->
			<div class="price_totalsum">
				<div class="price">총 금액 : <span id="totalAmt">0원</span></div>
				<a href="<c:url value='/Pizza/BuyPizza/addCart.pz'/>" id="btn_basket" class="btn btn_mdle btn_red btn_basic"><span class="btn_txt">장바구니 담기</span></a>
			</div>
		</div>
		<!-- //halfandhalf_container -->

		<div class="caution_notice">
			<p class="notice_title v2">하프&amp;하프 주문 시 유의사항</p>
			<div class="lst_type v2">
				<ul>
					<li>하프&amp;하프는 동일 사이즈, 도우, 더블치즈엣지 주문 시 이용 가능</li>
					<li>직화 스테이크+와규 앤 비스테카 피자 간 하프&amp;하프 이용 가능 (단, 프로모션 기간 동안에는 여타 제품과 하프&amp;하프 적용 가능)</li>
				</ul>
			</div>
		</div>
		<!-- //caution_notice -->



	</div><!-- content 상단바 메뉴 밑 컨텐츠 끝============================================================================================================== -->
	<!-- //content -->
</div>
<!-- //container -->
<div class="pop_layer pop_type topping" id="topping_info_pop"></div>

<!-- LOGGER 환경변수 설정 -->
<script type="text/javascript">
	_TRK_PI = "PLV";			// 웹페이지의 성격 정의
    _TRK_CP = "/메뉴/하프&하프";	// 카테고리명 전달
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
