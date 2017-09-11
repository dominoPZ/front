
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
	<link rel="stylesheet" type="text/css" href="/resources/css/font.css">
	<link rel="stylesheet" type="text/css" href="https://cdn.dominos.co.kr/renewal2016/ko/w/css/layout.css?v1.0">
<script type="text/javascript" src="/resources/js/jquery1.11.1.js"></script>
	<script type="text/javascript" src="https://cdn.dominos.co.kr/renewal2016/ko/w/js/ui.js"></script>
	<script type="text/javascript" src="https://cdn.dominos.co.kr/renewal2016/ko/w/js/jquery.flexslider.js"></script>
	<script type="text/javascript" src="/resources/js/selectbox.js"></script><!-- js 수정함. -->
	<script type="text/javascript" src="/resources/js/d2CommonUtil.js"></script>
	<script type="text/javascript" src="/resources/js/Cookie.js"></script>
	<script type="text/javascript" src="/resources/js/basket_w.js"></script>
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
	
	
	

<div id="container">
	<div class="main_floating">
		<div class="quick_menu">
			<a href="javascript:goOrder('O');" class="quick_order"><span>온라인<br>주문하기</span></a>
		</div>
		<div class="quick_menu2">
			<a href="javascript:goOrder('Q');" class="quick_order2"></a>
		</div>
		<div class="quick_menu4 chat_order active">
<a href="javascript:goChat()" class="quick_order4"></a>
		</div>
		<div class="quick_menu3">
			<a href="/contents/present" class="quick_order3"></a>
		</div>		
		
<!-- 2017-07-05 // 챗봇 수정(e) -->
		<!-- 2017-07-05 // 플로팅 추가(s) -->
			<!-- 2017-07-05 // 플로팅 추가(e) -->
		</div>
	<div class="main_visual">
		<div class="slide_wrap btn_center btn_type">
			<ul class="slides" id="main_visual">
			</ul>
		</div>
	</div>
	<!-- content -->
	<div id="content" class="main">
		<!-- delivery_tracker -->
		<div class="delivery_tracker" style="display:none;" id="ingOrderInfo">
			<input type="hidden" id="tracker_order_no" value="">
			<p class="customer_tracker">현재 <strong>이어진</strong> 님의<br>주문상태는?</p>
			<ul class="list_tracker">
				<li>
					<span class="tracker_step" style="cursor: pointer;" onclick="javascript:myOrderDetail();"></span>
					<p>접수완료</p>
				</li>
				<li>
					<span class="tracker_step2" style="cursor: pointer;" onclick="javascript:myOrderDetail();"></span>
					<p>요리 중</p>
				</li>
				<li>
					<span class="tracker_step3" style="cursor: pointer;" onclick="javascript:myOrderDetail();"></span>
					<p>배달 중</p>
				</li>
				<li>
					<span class="tracker_step4" style="cursor: pointer;" onclick="javascript:myOrderDetail();"></span>
					<p>배달완료</p>
				</li>
			</ul>
		</div>
		<!-- //delivery_tracker -->

		<!-- customer_info -->
		<div class="customer_info">
		<ul>
				<li>
					<a href="/mypage/myLevel">
						<div class="img_info">
							<img src="https://cdn.dominos.co.kr/renewal2016/ko/w/images/img_customer_info.png" alt="">
						</div>
						<div class="txt_info">
							<p><span id="myMonth"></span> 이어진님은<br><strong class="txt_royal" id="myLevel"></strong> 등급입니다.</p>
							<div class="txt_info_right">
								<span class="blue_box">혜택보기</span>
							</div>
						</div>
					</a>
				</li>
				<li class="exist_coupon" style="display:none;">
					<a href="/mypage/myCoupon">
						<div class="img_info">
							<img src="https://cdn.dominos.co.kr/renewal2016/ko/w/images/img_customer_info2.png" alt="">
						</div>
						<div class="txt_info">
							<p><span>이어진</span> 님의<br>사용 가능한 쿠폰은?</p>
							<div class="txt_info_right bar_line">
								<p class="coupon_info" id="myCouponCnt"></p>
								<span class="bar"></span>
							</div>
						</div>
					</a>
				</li>
				<li class="none_coupon">
					<a href="/event/discount">
						<div class="img_info">
							<img src="https://cdn.dominos.co.kr/renewal2016/ko/w/img/img_customer_info2.png" alt="">
						</div>
						<div class="txt_info">
							<p><span>이어진</span> 님을 위한 <br>도미노 꿀팁!</p>
						</div>
					</a>
				</li>

				<li id="lsmArea" style="display:none;">
					<a href="#">
						<div class="img_info">
							<img src="https://cdn.dominos.co.kr/renewal2016/ko/w/images/img_customer_info3.png" alt="">
						</div>
						<div class="txt_info">
							<p>지금<span class="name"></span><br> 에서는?</p>
							<div class="txt_info_right bar_line">
								<p class="sale_info"></p>
								<span class="bar"></span>
							</div>
						</div>
					</a>
				</li>
				<li id="lsmDefault">
					<a href="/branch">
						<div class="img_info">
							<img src="https://cdn.dominos.co.kr/renewal2016/ko/w/images/img_customer_info3_2.png" alt="">
						</div>
						<div class="txt_info">
							<p>내 주변<br>이벤트 매장 찾기</p>
							<div class="txt_info_right">
								<span class="ico ico_store"></span>
							</div>
						</div>
					</a>
				</li>
			</ul>
			</div>
		<!-- //customer_info -->

		<!-- main_bnr_wrap -->
		<div class="main_bnr_wrap">
			<div class="bnr_section">
				<div class="bnr_slide">
					<div class="slide_wrap btn_center btn_type">
						<ul class="slides" id="bnr_section">
						</ul>
					</div>
				</div>
			</div>



			<div class="bnr_section" id="notice_area">
				<div class="bnr_notice">
					<dl>
						<dt>공지사항</dt>
						<dd>
							<ul id="noticeList">
							</ul>
						</dd>
					</dl>
					<a href="/bbs/newsList?type=N" class="btn_ico btn_more">더보기</a>
				</div>
			</div>

			<div class="bnr_section">
				<div class="bnr_fix bnr_domino">
					<a href="/company/contents/overview">
						<div class="img_bnr_fix">
							<img src="https://cdn.dominos.co.kr/renewal2016/ko/w/images/img_bnr_fix.png" alt="">
						</div>
						<div class="txt_bnr_fix">
							<div class="txt_fix_wrap">
								<strong>한국 도미노피자 </strong>
								<p>최고의 피자 전문가이자 피자마스터<br>한국도미노피자를 소개합니다.</p>
							</div>
						</div>
					</a>
				</div>
				<div class="bnr_fix bnr_survey">
					<a href="javascript:goSurvey();">
						<div class="img_bnr_fix">
							<img src="https://cdn.dominos.co.kr/renewal2016/ko/w/images/img_bnr_fix2.png" alt="">
						</div>
						<div class="txt_bnr_fix">
							<div class="txt_fix_wrap">
								<strong>도미노피자 오픈 서베이</strong>
								<p>고객님의 의견을 들려주시고<br>20% 할인 혜택도 받으세요.</p>
							</div>
						</div>
					</a>
				</div>
			</div>
			<div class="bnr_section bnr_section_right" id="empty_area" style="display:none;">
				<div class="bnr_empty">
					<img src="https://cdn.dominos.co.kr/renewal2016/ko/w/images/img_bnr_empty.png" alt="">
				</div>
			</div>
		</div>
		<!-- //main_bnr_wrap -->

		<div class="customer_bottom">
			<div class="customer_info">
		</div>
		</div>


	</div>
	<!-- //content -->
</div>

<script type="text/javascript" src="/resources/js/xml2json.js"></script>
<script type="text/javascript">
var p_now = new Date();
// 헤더푸터 인크루드
$(document).ready(function(){
	
		$.ajax({
			type: "GET",
			url: "/mypage/myLsmAjax",
			success:function(data) {
				if(data.resultData) {
					$("#lsmArea span.name").text(data.resultData.branch_name);
					$("#lsmArea a").attr("href", "/branch?branch_code="+data.resultData.branch_code);
					$("#lsmArea .sale_info").html(data.resultData.p_name + "<br/>이벤트 진행중");
					$("#lsmDefault").hide();
					$("#lsmArea").show();
				}
			},
			error: function (error){
// 				console.log("error");
			}
		});
	

	// 공지사항
	$.ajax({
		type: "GET",
		url: "/bbs/newsListAjax?type=MAIN&blockSize=3",
		dataType : "json",
		success:function(data) {
	 		var noticeList = "";
	 		if(data.status == "success"){
		 		$.each(data.resultData.list, function (index, entry) {
		 			var newsYn = "";
			 		if(entry["type"] == "N")
			 			newsYn = "<span class='ico ico_notice'></span> ";
					noticeList += "<li><a href='/bbs/newsView?idx="+entry["idx"]+"&type="+entry["type"]+"'>"+newsYn+entry["subject"]+"</a></li>";
				});

		 		$("#noticeList").html(noticeList);
			} else {
// 				console.log("공지사항 가져오기 실패");
			}
		}
	});

	// 배너 로딩
	var t_now = new Date();
	$.ajax({
		type: "GET",
		url: "/contents/mainBanner",
		dataType: "xml",
		success:function(xml) {
			var lineBannerYn = "";
			var cnt = $(xml).find('banner').find('bitem').length;
			$(xml).find('banner').find('bitem').each(function(i) {
					var html = "";
					var sDate = stringToDate($(this).attr("sDate"));
					var eDate = stringToDate($(this).attr("eDate"));
					var useYn = $(this).attr("useYn");
					var gubun = $(this).attr("gubun");
					var fileNm = $(this).attr("fileNm");
					var linkUrl = $(this).attr("linkUrl");
					var title = $(this).attr("title");
					var gubunNm = "";
					if(gubun == "B0001")
						gubunNm = "메인빅배너";
					else if(gubun == "B0002")
						gubunNm = "메인신제품";
					else if(gubun == "B0003")
						gubunNm = "메인하단";
					else if(gubun == "B0008")
						gubunNm = "띠 배너";

					var loggerTrack = "onmousedown=\"try{_trk_clickTrace('EVT','"+gubunNm+"/"+title+"');}catch(e){}\"";

					if(t_now > sDate && t_now < eDate && useYn == "Y") {
						if(gubun == "B0001" || gubun == "B0002") {
							html = "<li><a href=\"javascript:goBannerLink('"+linkUrl+"');\"><img src=\"https://cdn.dominos.co.kr/admin/upload/banner/"+fileNm+"\" alt=\""+title+"\" "+loggerTrack+"></a></li>";
							if(gubun == "B0001")
								$(".main_visual .slides").append($(html));
							else
								$(".bnr_slide .slides").append($(html));
						} else if(gubun == "B0003") {
							html = "<div class=\"bnr_section evt\"><div class=\"bnr_img\"><a href=\"javascript:goBannerLink('"+linkUrl+"');\"><img src=\"https://cdn.dominos.co.kr/admin/upload/banner/"+fileNm+"\" alt=\""+title+"\" "+loggerTrack+"></a></div></div>";

							$("#notice_area").before($(html));
						} else if(gubun == "B0008" && lineBannerYn == "" && "true" == "true") {
							var colorKey = $(this).attr("etc");
							if(colorKey != "" && fileNm != ""){
								lineBannerYn = "Y";
								html = "<a href=\"javascript:goBannerLink('"+linkUrl+"');\"><img src=\"https://cdn.dominos.co.kr/admin/upload/banner/"+fileNm+"\" alt=\""+title+"\" "+loggerTrack+"></a>";
								$("#lineBanner .btn_event_close").before(html);
								$("#lineBanner").css("background-color", colorKey);
							}
						}
					}

					if(cnt == (i+1)) {
						$('.bnr_slide .slide_wrap').flexslider({
							animation: 'slide',
							animationSpeed: 2000,
							slideshowSpeed: 4000,
							directionNav: false
						});
						$('.main_visual .slide_wrap').flexslider({
							animation: 'slide',
							animationSpeed: 3000,
							slideshowSpeed: 4000
						});
					}
			});

			if (lineBannerYn == "Y") {
				var nDate = t_now.getFullYear() + "" + n2c(t_now.getMonth() + 1) + "" + n2c(t_now.getDate());
				var cookieName = cookieManager.getCookie('main_t_banner');
				if (cookieName != 'main_t_banner' + nDate) { // 쿠키체크
					$("#lineBanner").addClass("active");
				}
			}
		}
	});
	//메인 팝업
	getMainPopup();
	
	window.onmessage = function(e){
		if(e.data == "CHAT_CLOSE_ACCEPT"){
			e.preventDefault();
			$('.layer_chat').removeClass('active');
			$('body').removeClass('fixed');
			$('#chatUrl').attr('src', "https://domichat.dominos.co.kr:10000/pc/order.html?dominoId=erjin1230&customerName=이어진&customerHpNo=010-8288-2305");
		}else
			alert("챗봇 서버와 통신이 원할하지 않습니다. 새로고침 후에 사용해 주세요");
	}
	// 챗봇 열기
	$('.quick_order4').click(function(e){
	
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
});

$(document).ajaxStop(function() {
	$(".bnr_section").each(function(idx){
		if(idx%2 != 0){
			$(this).addClass("bnr_section_right");
		}
	});

	if($(".bnr_section").length%2 == 0){
		$("#empty_area").show();
	}
});

function goBannerLink(link) {
	location.href = link;
}

function goChat() {
	location.href = "/global/login?returnUrl=/main";
}

function goOrder(orderMethod) {

		if(orderMethod == "Q") {
			$.ajax({
				type: "GET",
				url: "/quickOrder/settingCheck",
				success:function(data) {
					var result = data.resultData.result;
					if(result == "pause") {
						if(confirm(data.resultData.msg+" 퀵 오더 설정을 수정하시겠습니까?")) {
							location.href = "/quickOrder/detail";
						}
					} else if(result == "delete") {
						if(confirm("퀵 오더 등록된 매장이 삭제되었습니다. 퀵 오더 설정을 수정하시겠습니까?")) {
							location.href = "/quickOrder/detail";
						}
					} else {
						location.href = "/quickOrder/proc?channel=MAIN";
					}
				},
				error: function (error){
//	 				console.log("error");
				}
			});
		} else {
			location.href = "/goods/list?dsp_ctgr=C0101";
		}
	
}

function getMainPopup() {
	var nowDay = p_now.getFullYear() + "" + fncLPAD((p_now.getMonth() + 1)) + "" + fncLPAD(p_now.getDate()) + "";

	$.ajax({
		type: "GET",
		url: "/resources/xml/mainPopup.xml",
		dataType: "xml",
		success:function(xml) {
			$(xml).find('pop').find('pitem').each(
				function(i) {
					var seq = $(this).attr('seq');
					var width = $(this).attr('imgWidth') - 4;
					var height = parseInt($(this).attr('imgHeight')) + 22;
					var left = $(this).attr('imgLeft');
					var top = $(this).attr('imgTop');
					var s_date = $(this).attr('sDate');
					var e_date = $(this).attr('eDate');
					var lang = $(this).attr('lang');
					var use_yn = $(this).attr('useYn');
					if (nowDay >= s_date && nowDay <= e_date && lang != "EN" && use_yn == "Y") {
						if (cookieManager.getCookie('DOMINO_MAINPOPUP_' + seq).isBlank()) {
							window.open('/mainPopup?seq=' + seq, 'DOMINO_MAINPOP_' + seq, 'width=' + width + ', height=' + height + ', left='
									+ left + ', top=0, scrollbars = no');
						}
					}
			});
		}
	});
}
function fncLPAD(num) {
	if (num < 10)
		return '0'+num;
	else
		'' + num;
	return num;
}

//온라인 서베이
function goSurvey(){
	var pop = window.open('/survey/surveyForm','survey','width=780px, height=600px, left=0, top=0');
	pop.focus();
}

//띠 배너 오늘하루 다시 보지 않기
function lineBannerClose(){
	var t_now = new Date();
	var nDate = t_now.getFullYear() + "" + n2c(t_now.getMonth() + 1) + "" + n2c(t_now.getDate());
	cookieManager.setCookie('main_t_banner','main_t_banner'+nDate, 1);
}

</script>
<div class="pop_layer pop_type" id="password_ch_pop">
	<div class="bg"></div>
	<div class="pop_wrap">
		<div class="pop_header">
			<h2>비밀번호 변경 권유</h2>
		</div>
		<div class="pop_content">
			<div class="sp_bubble_left bubble_shadow">
				<div class="bubble_area">
					<p><strong>고객님의 회원정보 보호를 위해 도미노피자는<br><span class="txt_orange">6개월마다 비밀번호 변경을 권유</span>하고 있습니다.</strong></p>
					<p>비밀번호 변경을 원하지 않을 경우 ‘다음에 변경하기’<br>버튼을 눌러 1개월 동안 안내를 받지 않을 수 있습니다.<br>기존 비밀번호와 신규 비밀번호를 입력 해 주세요.</p>
				</div>
			</div>
			<div class="lst_type_dot">
				<ul>
					<li>
						<label for="old_passwd">현재 비밀번호</label>
						<div class="form_group">
							<div class="form_field">
								<div class="form_item">
									<input type="password" name="old_passwd" id="old_passwd" maxlength="16" class="i_text">
								</div>
							</div>
							<span class="i_error show" id="old_passwd_alert"></span>
						</div>
					</li>
					<li>
						<label for="passwd">새 비밀번호</label>
						<div class="form_group">
							<div class="form_field">
								<div class="form_item">
									<span for="temp_input" class="i_label" style="position: absolute;"></span>
									<input type="password" name="passwd" id="passwd" maxlength="16" class="i_text" placeholder="8 ~16자 영문대소문자, 숫자, 특수문자 사용가능">
								</div>
							</div>
							<span class="i_error show" id="passwd_alert"></span>
						</div>
					</li>
					<li>
						<label for="confirmpw">새 비밀번호 확인</label>
						<div class="form_group">
							<div class="form_field">
								<div class="form_item">
									<input type="password" name="confirmpw" id="confirmpw" maxlength="16" class="i_text" placeholder="8 ~16자 영문대소문자, 숫자, 특수문자 사용가능">
								</div>
							</div>
							<span class="i_error show" id="confirmpw_alert"></span>
						</div>
					</li>
				</ul>
			</div>

			<div class="btn_wrap">
				<div class="btn_fix_center">
					<a href="javascript:goDelay();" class="btn btn_mdle btn_blue btn_basic"><span class="btn_txt">1개월 후 변경하기</span></a>
					<a href="javascript:updateChangePasswd();" class="btn btn_mdle btn_red btn_basic"><span class="btn_txt">수정하기</span></a>
				</div>
			</div>
		</div>
		<a href="javascript:goDelay();" class="btn_ico btn_close" id="goDelay">닫기</a>
	</div>
</div>

<script type="text/javascript" src="https://cdn.dominos.co.kr/renewal2016/ko/w/js/ui.js"></script>
<script type="text/javascript" src="/resources/js/member.js"></script>
<script type="text/javascript">
var redirectUrl = "";
$(document).ready(function(){
	var cookieYn = cookieManager.getCookie('PwdSuggest');

	if("" == "Y" && cookieYn == ""){
		$("#password_ch_pop").addClass("open");
	}

	$("#goDelay").unbind("click");
});

//다음에 변경하기
function goDelay(){
	cookieManager.setCookie('PwdSuggest','0', 30); // 30일
	if(redirectUrl != "")
		location.href=redirectUrl;
	else
		location.href="/main";
}

//비밀번호 변경 처리
function updateChangePasswd() {
	$("#old_passwd_alert").text("");
	$("#passwd_alert").text("");
	$("#confirmpw_alert").text("");

	if ($('#old_passwd').val() == ""){
		$("#old_passwd_alert").text("현재 비밀번호를 입력해 주세요.");
		$('#old_passwd').focus();
		return;
	}
	if ($('#passwd').val() == ""){
		$("#passwd_alert").text("새 비밀번호를 입력해 주세요.");
		$('#passwd').focus();
		return;
	}
	if ($('#confirmpw').val() == ""){
		$("#confirmpw_alert").text("새 비밀번호를 입력해 주세요.");
		$('#confirmpw').focus();
		return;
	}
	if (!isValidPwd($("#passwd").val())) {
		$("#passwd").focus();
		return;
	}
	if ($('#passwd').val() != $('#confirmpw').val()) {
		$("#confirmpw_alert").text('비밀번호가 일치하지 않습니다.');
		$("#confirmpw").focus();
		return;
	}

	if(confirm("해당 내용으로 수정하시겠습니까?")){
		$.ajax({
			type: "POST",
			url: "/member/changePwdAjax",
			data: {	old_passwd : $("#old_passwd").val(),
					passwd : $('#passwd').val() },
			dataType : "json",
			success:function(data) {
				if (data.status == "success"){
					alert(data.msg);
					if(redirectUrl != "")
						location.href=redirectUrl;
					else
						location.href="/main";
					return;
				} else {
					if(data.code != ""){
						$("#"+data.code+"_alert").text(data.msg);
						$("#"+data.code).focus();
					}else{
						alert(data.msg);
					}
					return;
				}
			},
			error: function (error){
				alert("다시 시도해주세요.");
			}
		});
	}
}

</script>
<!-- Google 리마케팅 태그 코드 -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 956654516;
var google_custom_params = window.google_tag_params;
var google_remarketing_only = true;
/* ]]> */
</script>
<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="//googleads.g.doubleclick.net/pagead/viewthroughconversion/956654516/?guid=ON&amp;script=0"/>
</div>
</noscript>
<!-- Google 리마케팅 태그 코드 -->
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
