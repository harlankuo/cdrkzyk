﻿<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<div class="page">
	<div class="pageContent">
		<form method="post" action="${ctx}/decision/flowbasicquery1view!save.action" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone4Update);">
			<input type="hidden" name="id" value="${id}"/><!-- 
			<input type="hidden" name="result4Json.callbackType" value="closeCurrent"/> -->
			<input type="hidden" name="result4Json.navTabId" value="nav_flowbasicquery1viewmanage"/>
			<div class="pageFormContent" layoutH="56">
																			<p>
					<label>流动人口编码：</label>
					<input name="personCode"    type="text" size="30" value="${personCode}" />
					</p>
																													<p>
					<label>身份证：</label>
					<input name="code"    type="text" size="30" value="${code}" />
					</p>
																													<p>
					<label>姓名：</label>
					<input name="nameh"    type="text" size="30" value="${nameh}" />
					</p>
																													<p>
					<label>性别：</label>
					<input name="sex" class="digits" type="text" size="30" value="${sex}"/>
					</p>
																													<p>
					<label>出生日期：</label>
					<input name="birthday" class="date " readonly="readonly" type="text" size="30" value="<fmt:formatDate value="${birthday}" pattern="yyyy-MM-dd"/>"/><a class="inputDateButton" href="javascript:void(0)">选择</a>
					</p>
																													<p>
					<label>婚姻状况：</label>
					<input name="marryStatus" class="digits" type="text" size="30" value="${marryStatus}"/>
					</p>
																													<p>
					<label>最近婚变日期：</label>
					<input name="marryCryDate" class="date " readonly="readonly" type="text" size="30" value="<fmt:formatDate value="${marryCryDate}" pattern="yyyy-MM-dd"/>"/><a class="inputDateButton" href="javascript:void(0)">选择</a>
					</p>
																													<p>
					<label>子女数：</label>
					<input name="childnum" class="digits" type="text" size="30" value="${childnum}"/>
					</p>
																													<p>
					<label>流入原因：</label>
					<input name="inCause" class="digits" type="text" size="30" value="${inCause}"/>
					</p>
																													<p>
					<label>流入日期：</label>
					<input name="inDate" class="date " readonly="readonly" type="text" size="30" value="<fmt:formatDate value="${inDate}" pattern="yyyy-MM-dd"/>"/><a class="inputDateButton" href="javascript:void(0)">选择</a>
					</p>
																													<p>
					<label>是否持证：</label>
					<input name="haveStatus2" class="digits" type="text" size="30" value="${haveStatus2}"/>
					</p>
																													<p>
					<label>流入类型：</label>
					<input name="inType" class="digits" type="text" size="30" value="${inType}"/>
					</p>
																													<p>
					<label>配偶流入日期：</label>
					<input name="spouseInDate" class="date " readonly="readonly" type="text" size="30" value="<fmt:formatDate value="${spouseInDate}" pattern="yyyy-MM-dd"/>"/><a class="inputDateButton" href="javascript:void(0)">选择</a>
					</p>
																													<p>
					<label>避孕节育措施：</label>
					<input name="method" class="digits" type="text" size="30" value="${method}"/>
					</p>
																													<p>
					<label>配偶姓名：</label>
					<input name="nameh2"    type="text" size="30" value="${nameh2}" />
					</p>
																													<p>
					<label>配偶出生日期：</label>
					<input name="birthday2" class="date " readonly="readonly" type="text" size="30" value="<fmt:formatDate value="${birthday2}" pattern="yyyy-MM-dd"/>"/><a class="inputDateButton" href="javascript:void(0)">选择</a>
					</p>
																													<p>
					<label>配偶是否持证：</label>
					<input name="haveStatus" class="digits" type="text" size="30" value="${haveStatus}"/>
					</p>
																													<p>
					<label>是否共同流入：</label>
					<input name="isFamilyAllIn" class="digits" type="text" size="30" value="${isFamilyAllIn}"/>
					</p>
																													<p>
					<label>联系电话：</label>
					<input name="tel"    type="text" size="30" value="${tel}" />
					</p>
																													<p>
					<label>DOMICILE：</label>
					<input name="domicile"    type="text" size="30" value="${domicile}" />
					</p>
																													<p>
					<label>ADDRESS：</label>
					<input name="address"    type="text" size="30" value="${address}" />
					</p>
																													<p>
					<label>area：</label>
					<input name="area"    type="text" size="30" value="${area}" />
					</p>
																													<p>
					<label>DOMICILE_TYPE：</label>
					<input name="domicileType" class="digits" type="text" size="30" value="${domicileType}"/>
					</p>
																	</div>
			<div class="formBar">
				<ul>
					<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
					<li>
						<div class="button"><div class="buttonContent"><button type="Button" onclick="navTab.closeCurrentTab()">取消</button></div></div>
					</li>
				</ul>
			</div>
		</form>
	</div>
</div>