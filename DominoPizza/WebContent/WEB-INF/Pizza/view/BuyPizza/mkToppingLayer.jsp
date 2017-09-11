<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 마이 키친 토핑 선택팝업(s) -->
<div class="bg"></div>
<div class="pop_wrap">
	<div class="pop_header">
		<h2>마이 키친 토핑 선택</h2>
	</div>
	<div class="pop_content">
		<p class="txt_topping">- 토핑은 최대 7개 선택 가능</p>
		<p class="txt_topping">- 기본으로 모차렐라 치즈가 추가됩니다. (슈퍼스프림 피자 정량 기준)</p>
		<div class="tab tab_type2">
			<ul class="btn_tab">
				<li class="active"><a href="javascript:;" id="T0100">메인</a></li>
				<li><a href="javascript:;" id="T0300">치즈</a></li>
				<li><a href="javascript:;" id="T0400">애프터</a></li>
			</ul>
			<div class="tab_content_wrap">
				<div class="tab_content active">
					<div class="lst_topping_wrap">
						<ul> <!-- class="bg_lst_gray" -->
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
<script>
$(".T0100").show();

$(".tab .btn_tab li a").click(function(e) {
	e.preventDefault();
	$(".toppingli").hide();
	$(".btn_tab li").removeClass("active");
	$(this).parent().addClass("active");
	$("."+$(this).attr("id")).show();
	return;
});

if($("#toppingList").val() != "") { // 토핑 초기 셋팅
	var toppingArr = $("#toppingList").val().split(",");
	$.each($(".toppingselect"), function() {
		$.each($(this).find("option"), function() {
			var code = $(this).attr("value");
			var obj = $(this);
			$.each(toppingArr, function(i, v) {
				if(code == v) {
					obj.attr("selected", "selected");
					obj.parent().parent().parent().addClass("active");
				}
			});
		});
	});


	setToppingTotalCnt();
}

$(".toppingselect").change(function() {
	if($(this).val() != "") {
		$(this).parent().parent().addClass("active");
	} else {
		$(this).parent().parent().removeClass("active");
	}

	setToppingTotalCnt($(this));
});

var toppingReset = function() {
	$(".toppingselect").val("");
	$(".toppingli").removeClass("active");
	setToppingTotalCnt();
};

var toppingTotalAmount = 0;
var setToppingTotalCnt = function(obj) {
	var toppingTotalCnt = 0;
	toppingTotalAmount = 0;
	$(".toppingselect").each(function() {
		if($(this).val() != "") {
			toppingTotalCnt++;
			toppingTotalAmount += parseInt($(this).find("option:selected").data("price"));
		}
	});

	var reset = false;
	if("" == "RPZ803S") {
		if(toppingTotalCnt > 5) {
			alert("히든엣지 추가 토핑은 최대 5개까지 선택 가능합니다.");
			reset = true;
		}
	} else {
		if(toppingTotalCnt > 7) {
			alert("추가 토핑은 최대 7개까지 선택 가능합니다.");
			reset = true;
		}
	}
	if(reset) {
		obj.val("");
		obj.parent().parent().find(".ico_or_chk").hide();
		setToppingTotalCnt();
		return;
	}

	if(toppingTotalCnt == 0) {
		$("#toppingTotalCnt").text("");
		$("#toppingTotalAmount").html("총 0원");
		$("#toppingDisplayList").hide();
	} else {
		$("#toppingTotalCnt").text("("+toppingTotalCnt+")");
		$("#toppingTotalAmount").text("총 "+toppingTotalAmount.cvtNumber()+"원");
		$("#toppingDisplayList").show();
	}

};

var setToppingCheck = function() {
	var toppingList = "";

	$(".toppingselect").each(function() {
		if($(this).val() != "") {
			if(toppingList != "") {
				toppingList += ",";
			}
			toppingList += $(this).val();
		}
	});

	$.ajax({
		type: "POST",
		url: "/goods/pauseCheck",
		data: { 'topping': toppingList },
		success:function(data) {
			if(data.resultData.result == "success") {
				setTopping();
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

var setTopping = function() {
	var toppingList = "";
	var totalAmt = 0;
	var toppingNmList = "";
	var toppingTotalCnt = 0;
	var html = "";
	$(".toppingselect").each(function() {
		if($(this).val() != "") {
			if(toppingList != "") {
				toppingList += ",";
			}
			toppingTotalCnt++;
			toppingList += $(this).val();
			totalAmt += parseInt($(this).find("option:selected").data("price"));

			html += '<li id="'+$(this).val()+'">'
				+	'	<p class="topping_name">'+$(this).find("option:selected").data("name")+' ' + $(this).find("option:selected").data("weight") +'</p>'
				+	'	<span class="bill_price">'+(parseInt($(this).find("option:selected").data("price"))).cvtNumber()+'</span>'
				+	'	<a href="javascript:;" onclick="$(this).parent().remove();setToppingPrice();" class="btn_ico btn_delete">삭제하기</a>'
				+	'</li>';

		}
	});


	if("" == "RPZ803S") {
		if(toppingTotalCnt > 5) {
			alert("히든엣지 추가 토핑은 최대 5개까지 선택 가능합니다.");
			return;
		}
	} else {
		if(toppingTotalCnt > 7) {
			alert("추가 토핑은 최대 7개까지 선택 가능합니다.");
			return;
		}
	}

	$("#toppingList").val(toppingList);
	$("#toppingTotalAmt").text(totalAmt.cvtNumber() + "원");
	$("#toppingDisplayList").html(html);
	if(toppingList != "") {
		var totalAmtStr = totalAmt.cvtNumber();
		var toppingSumHtml = toppingTotalCnt+"개 선택</strong>";
		$("#toppingSum").html(toppingSumHtml);
		$(".balloon_wrap").show();

	} else {
		$(".balloon_wrap").hide();
		$("#toppingSum").html("");
	}

	closeLayer();
	//총액 반영
	setTotalAmt();
};


</script>