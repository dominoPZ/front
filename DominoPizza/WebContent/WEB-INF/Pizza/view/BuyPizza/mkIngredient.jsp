<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 영양성분 표 팝업(s)) -->
<div class="pop_layer pop_type open" id="mykitchen_nutrient">
	<div class="bg"></div>
	<div class="pop_wrap">
		<div class="pop_header">
			<h2>영양성분 표</h2>
		</div>
		<div class="pop_content">
			<div class="mykitchen_table">
				<dl>
					<dt>1. 피자</dt>
					<dd>
						<table class="tbl_type">
							<caption>마이키친 영양성분 표</caption>
							<colgroup>
								<col width="95px">
								<col width="95px">
								<col width="95px">
								<col width="95px">
								<col width="95px">
								<col width="95px">
								<col width="95px">
								<col width="95px">
								<col width="95px">
							</colgroup>
							<thead>
								<tr>
									<th>제품명<br>(마이키친<br>기본피자)</th>
									<th>총 중량(g)</th>
									<th>1회분 기준</th>
									<th>1회분 중량<br>(g)</th>
									<th>열량<br>(kcal/1회분)</th>
									<th>단백질<br>(g/1회분)</th>
									<th>포화지방<br>(g/1회분)</th>
									<th>나트륨<br>(mg/1회분)</th>
									<th>당류<br>(g/1회분)</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="txt_align_lft">오리지널L</td>
									<td>784</td>
									<td>1조각</td>
									<td>98</td>
									<td>253</td>
									<td>10</td>
									<td>4</td>
									<td>469</td>
									<td>4</td>
								</tr>
							</tbody>
						</table>
					</dd>
					<dt>2. 토핑</dt>
					<dd>
						<table class="tbl_type">
							<caption>마이키친 영양성분 표</caption>
							<colgroup>
								<col width="143px">
								<col width="143px">
								<col width="143px">
								<col width="143px">
								<col width="143px">
								<col width="143px">
							</colgroup>
							<thead>
								<tr>
									<th>제품명</th>
									<th>열량(kcal/1회분)</th>
									<th>단백질 (g/1회분)</th>
									<th>포화지방 (g/1회분)</th>
									<th>나트륨 (mg/1회분)</th>
									<th>당류 (g/1회분)</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="txt_align_lft">양파</td>
									<td>25</td>
									<td>0.8(1.33%)</td>
									<td>0</td>
									<td>7(0.35%)</td>
									<td>3.99</td>
								</tr>
								<tr class="bg_tr_gray">
									<td class="txt_align_lft">피망</td>
									<td>20</td>
									<td>0.8(1.33%)</td>
									<td>0</td>
									<td>7.5(0.38%)</td>
									<td>1.92</td>
								</tr>
							</tbody>
						</table>
					</dd>
				</dl>
			</div>
		</div>

		<a href="javascript:closeLayer();" class="btn_ico btn_close">닫기</a>
	</div>
</div>
<!-- //영양성분 표 팝업(e) -->

<!-- LOGGER 환경변수 설정 -->
<script type="text/javascript">
	_TRK_PI = "PLV";			// 웹페이지의 성격 정의
    _TRK_CP = "/메뉴/마이키친/영양성분 및 알레르기 유발성분";	// 카테고리명 전달
</script>
<!-- // LOGGER 환경변수 설정 -->