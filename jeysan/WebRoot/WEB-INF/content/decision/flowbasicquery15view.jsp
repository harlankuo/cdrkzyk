﻿<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<tags:js.pager action="${ctx}/decision/flowbasicquery15view.action">
	<input type="hidden" name="filter_EQS_area"
		value="${param['filter_EQS_area']}" />
	<input type="hidden" name="filter_EQI_domicileType"
		value="${param['filter_EQI_domicileType']}" />
	<input type="hidden" name="filter_LIKES_nameh"
		value="${param['filter_LIKES_nameh']}" />
	<input type="hidden" name="filter_EQS_code"
		value="${param['filter_EQS_code']}" />
	<input type="hidden" name="filter_EQS_personCode"
		value="${param['filter_EQS_personCode']}" />
	<input type="hidden" name="filter_GED_cancelDate"
		value="${param['filter_GED_cancelDate']}" />
	<input type="hidden" name="filter_GED_cancelDate"
		value="${param['filter_GED_cancelDate']}" />
</tags:js.pager>
<div class="page">
	<div class="pageHeader">
		<form onsubmit="return navTabSearch(this);"
			action="${ctx}/decision/flowbasicquery15view.action" method="post">
			<input type="hidden" name="filter_EQI_domicileType"
				value="${param['filter_EQI_domicileType']}" />
			<div class="searchBar">
				<table class="searchContent">
					<tr>
						<td>
							姓名：
							<input type="text" name="filter_LIKES_nameh"
								value="${param['filter_LIKES_nameh']}" />
						</td>
						<td>
							身份证号：
							<input type="text" name="filter_EQS_code"
								value="${param['filter_EQS_code']}" />
						</td>
						<td>
							人员编码：
							<input type="text" name="filter_EQS_personCode"
								value="${param['filter_EQS_personCode']}" />
						</td>
					</tr>
					<tr>
						<td colspan="2">
							注销日期：
							<input type="text" name="filter_GED_cancelDate" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
								readonly="true" value="${param.filter_GED_cancelDate}" />
							~
							<input type="text" name="filter_LED_cancelDate" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})"
								readonly="true" value="${param.filter_LED_cancelDate}" />
						</td>
						<td>
							所属区域：
							<tags:js.area.selector name="filter_EQS_area" readonly="true"
								value="${param['filter_EQS_area']}" size="20"></tags:js.area.selector>
						</td>
					</tr>
				</table>
				<div class="subBar">
					<ul>
						<li>
							<div class="buttonActive">
								<div class="buttonContent">
									<button type="submit">
										检索
									</button>
								</div>
							</div>
						</li>
						<li>
							<div class="button">
								<div class="buttonContent">
									<button type="reset">
										重置
									</button>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</form>
	</div>
	<div class="pageContent">
		<div class="panelBar">
			<ul class="toolBar">
				<li class="line">
					line
				</li>
				<li>
					<a class="icon"
						href="javascript:JS_print2('已注销流出人员查询')"><span>打印或者导出</span>
					</a>
				</li>
			</ul>
		</div>
		<table class="table" width="150%" layouth="138">
			<thead>
				<tr>
					<th width="30" align="center">
						序号
					</th>
					<th width="80" orderField="personCode" class="orderFlag">
						人员编码
					</th>
					<th width="80" orderField="nameh" class="orderFlag">
						姓名
					</th>
					<th width="80" orderField="sex" class="orderFlag" htype="dict">
						性别
					</th>
					<th width="80" orderField="birthday" class="orderFlag" htype="date">
						出生日期
					</th>
					<th width="80" orderField="code" class="orderFlag">
						身份证号码
					</th>
					<th width="80" orderField="marryStatus" class="orderFlag" htype="dict">
						婚姻状况
					</th>
					<th width="80" orderField="inAddress" class="orderFlag">
						流入地
					</th>
					<th width="80" orderField="outDate" class="orderFlag" htype="date">
						流出日期
					</th>
					<th width="80" orderField="outCause" class="orderFlag">
						流动原因
					</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="a" items="${page.result}" varStatus="b">
					<tr>
						<td height="25">
							${b.index+1}
						</td>
						<td>
							${a.personCode}
						</td>
						<td>
							${a.nameh}
						</td>
						<td>
							<tags:js.dict.getValue value="${a.sex}"/>
						</td>
						<td>
							<fmt:formatDate value="${a.birthday}" pattern="yyyy-MM-dd" />
						</td>
						<td>
							${a.code}
						</td>
						<td>
							<tags:js.dict.getValue value="${a.marryStatus}"/>
						</td>
						<td>
							${a.inAddress}
						</td>
						<td>
							<fmt:formatDate value="${a.outDate}" pattern="yyyy-MM-dd" />
						</td>
						<td>
							${a.outCause}
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<%@ include file="/common/page-foot.jsp"%>
	</div>
</div>