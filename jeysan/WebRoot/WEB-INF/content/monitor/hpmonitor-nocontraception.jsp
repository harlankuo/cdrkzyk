﻿<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<tags:js.pager action="${ctx}/monitor/monitorlog.action">
	<input type="hidden" name="filter_EQI_id" value="${param['filter_EQI_id']}" />
</tags:js.pager>
<div class="page">


		
		<table class="table" width="100%" layouth="50">
			<thead>
				<tr>
					
					<th width="50" align="center">序号</th>
					<th width="100"  class="orderFlag">妇女编码</th>
					<th width="100"  class="orderFlag">姓名</th>
					<th width="100"  class="orderFlag">身份证号</th>
					<th width="100" class="orderFlag">避孕节育措施</th>
					<th width="150"  class="orderFlag">现家庭子女数</th>
					<th width="120"  class="orderFlag">最小孩出生日期</th>
					<th width="150"  class="orderFlag">现居地</th>
				
				</tr>
					</thead>
					
				<c:forEach items="${list }" var="dlist" varStatus="num">
				<tr>
				<td>
				<c:out value="${num.index }"></c:out></td>
				<td><c:out value="${dlist[0] }"></c:out></td>
				<td><c:out value="${dlist[1] }"></c:out></td>
				<td><c:out value="${dlist[2] }"></c:out></td>
				<td><c:out value="${dlist[3] }"></c:out></td>
				<td>
				<c:if test="${empty dlist[4]}">0</c:if>
				<c:out value="${dlist[4] }"></c:out>
				</td>
				<td><c:out value="${dlist[5] }"></c:out></td>
				<td><c:out value="${dlist[6] }"></c:out></td>
				<td><c:out value="${dlist[7] }"></c:out></td>
				</tr>
	
				</c:forEach>
		
			
								
		</table>
	<div class="panelBar">
			<ul class="toolBar" dir="rtl">
				
				<li><a class="icon" href="javascript:void(0);"><span>汇总</span></a></li>
				<li><a class="icon" href="javascript:void(0);"><span>导出EXCEL</span></a></li>
				<li><a class="icon" href="javascript:void(0);"><span>打印</span></a></li>
				<li><a class="icon" href="javascript:void(0);"><span>返回</span></a></li>
			</ul>
		</div>
		<%@ include file="/common/page-foot.jsp"  %>

</div>