<%@page import="com.company.gap.medicine.enumeration.MedicineResourceType"%>
<%@page import="com.company.gap.feed.enumeration.FeedResourceType"%>
<%@page import="com.company.gap.disinfectant.enumeration.DisinfectantResourceType"%>
<%@page import="com.company.gap.info.enumeration.InfoType"%>
<%@page import="com.company.gap.pesticide.enumeration.PesticideResourceType"%>
<%@page import="com.company.gap.manure.enumeration.ManureResourceType"%>
<%@page import="com.company.gap.resource.enumeration.DictType"%>
<%@page import="com.company.gap.resource.model.Dict"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="/public/jsp/taglibs.jsp"%>

<html>
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Homepage</title>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>public/css/reset.css" />
		<link rel="stylesheet" type="text/css" href="<%=basePath%>public/css/style.css" />
		<script type="text/javascript" src="<%=basePath%>public/js/menujs.js"></script>
		
		<script type="text/javascript">

			function shows(names) {
				document.getElementById(names).style.display='block';
			}
			function hiddens(names) {
				document.getElementById(names).style.display='none';
			}
			function shows2(names,ids) {
				document.getElementById(ids).className='current';		
				document.getElementById(names).style.display='block';
			}
			function hiddens2(names,ids) {
				document.getElementById(ids).className='';
				document.getElementById(names).style.display='none';
			}
			function expand(el) {
				childObj = document.getElementById("child" + el);
		
				if (childObj.style.display == 'none')
				{
					childObj.style.display = 'block';
				}
				else
				{
					childObj.style.display = 'none';
				}
				return;
			}
	</script>
	</head>
	<body>
		<!--头部-->
		<table border="0" cellspacing="0" cellpadding="0" class="w960 mCenter">
			<tr>
				<td align="left" valign="top" class="header_sub">
					<table width="260" border="0" cellspacing="0" cellpadding="0"
						class="userLoginBar">
						<tr>
							<td width="15" align="right">
								<img src="<%=basePath%>public/images/userLeft.gif" width="15" height="30" />
							</td>
							<td width="92" align="left" class="content font12White_B"
								nowrap="nowrap">
								当前管理员：
							</td>
							<td width="102" align="left" class="content font12White_B"
								nowrap="nowrap">
								${user.userName }
							</td>
							<td width="36" align="right" nowrap="nowrap"
								class="content font12White_B">
								<a href="<%=basePath%>admin/${user.companyno}/logout.html">退出</a>
							</td>
							<td width="15" align="right">
								<img src="<%=basePath%>public/images/userRight.gif" width="15" height="30" />
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="5"></td>
			</tr>
		</table>
		<table border="0" cellspacing="0" cellpadding="0" class="mCenter w960">

			<tr>
				<td width="10" colspan="3" class="mainNavBottomBg"></td>
			</tr>
		</table>
		<!--二级导航-->
		<!--内容菜单-->
		<table border="0" cellspacing="0" cellpadding="0" class="w960 mCenter">
			<tr>
				<td width="170" align="left" valign="top">
					<table height="100%" cellspacing="0" cellpadding="0" width="170"
						border="0" class="userMenu">
						<tr>
							<td width="169" align="center" valign="top">
								<table width="187" height="100%" border="0" align="center"
									cellpadding="0 " cellspacing="0">
									<tr>
										<td width="100%" height="1" valign="top">
											<table cellspacing="0" cellpadding="0 " width="187"
												border="0">
												<tbody>
													<tr>
														<td height="42" align="left" class="left_tit">
															<strong>菜单</strong>
														</td>
													</tr>
													<tr>
														<td align="left">
															<div id="menudiv1" class="shiyunlei2"
																onclick="zhedie('shiyunul1',this)">
																<p>
																	公司资料
																</p>
															</div>
															<ul id="shiyunul1" class="shiyunul">
																<li onclick="changeBgColor('shiyunul1',this)">
																	<img src="<%=basePath%>public/images/fangdian_06.gif" align="absmiddle" />
																	&nbsp;
																	<a href="<%=basePath%>admin/cinfo/edit.html?id=1" target="rightframe">&nbsp;公司简介</a>
																</li>
																<li onclick="changeBgColor('shiyunul1',this)">
																	<img src="<%=basePath%>public/images/fangdian_06.gif" align="absmiddle" />
																	&nbsp;
																	<a href="<%=basePath%>admin/cinfo/list.html?type=GSXW" target="rightframe">&nbsp;公司新闻</a>
																</li>
																<li onclick="changeBgColor('shiyunul1',this)">
																	<img src="<%=basePath%>public/images/fangdian_06.gif" align="absmiddle" />
																	&nbsp;
																	<a href="<%=basePath%>admin/cinfo/list.html?type=CPFW" target="rightframe">&nbsp;产品与服务</a>
																</li>
																<c:if test="${user.userId == 'ADMIN' || user.userId == 'admin'}">
																	<li onclick="changeBgColor('shiyunul1',this)">
	                                                                    <img src="<%=basePath%>public/images/fangdian_06.gif" align="absmiddle" />
	                                                                    &nbsp;
	                                                                    <a href="<%=basePath%>admin/user/list.html" target="rightframe">&nbsp;用户管理</a>
	                                                                </li>
	                                                            </c:if>    
															</ul>
															<div id="menudiv2" class="shiyunlei2"
																onclick="zhedie('shiyunul2',this)">
																<p>
																	生产单元管理
																</p>
															</div>
															<ul id="shiyunul2" class="shiyunul">
																<li onclick="changeBgColor('shiyunul2',this)">
																	<img src="<%=basePath%>public/images/fangdian_06.gif" align="absmiddle" />
																	&nbsp;
																	<a href="<%=basePath%>admin/cell/list.html" target="rightframe">&nbsp;生产单元信息</a>
																</li>
															</ul>
															
															<c:if test="${user.companyType == 2}">
															<div id="menudiv3" class="shiyunlei2"
																onclick="zhedie('shiyunul3',this)">
																<p>
																	养殖类
																</p>
															</div>
															<ul id="shiyunul3" class="shiyunul">
																<li onclick="changeBgColor('shiyunul4',this)">
																	<img src="<%=basePath%>public/images/fangdian_06.gif" align="absmiddle" />
																	&nbsp;
																	<a href="<%=basePath%>admin/nurture/register/add.html" target="rightframe">&nbsp;登记</a>
																</li>
																<li onclick="changeBgColor('shiyunul4',this)">
																	<img src="<%=basePath%>public/images/fangdian_06.gif" align="absmiddle" />
																	&nbsp;
																	<a href="<%=basePath%>admin/nurture/process/list.html" target="rightframe">&nbsp;养殖过程</a>
																</li>
																<li onclick="changeBgColor('shiyunul4',this)">
																	<img src="<%=basePath%>public/images/fangdian_06.gif" align="absmiddle" />
																	&nbsp;
																	<a href="<%=basePath%>admin/nurture/completed/list.html" target="rightframe">&nbsp;已完成信息</a>
																</li>
																<li onclick="changeBgColor('shiyunul4',this)">
																	<img src="<%=basePath%>public/images/fangdian_06.gif" align="absmiddle" />
																	&nbsp;
																	<a href="<%=basePath%>admin/nurture/archived/list.html" target="rightframe">&nbsp;已归档信息</a>
																</li>
															</ul>
															<div id="menudiv5" class="shiyunlei2"
																onclick="zhedie('shiyunul5',this)">
																<p>
																	饲料
																</p>
															</div>
															<ul id="shiyunul5" class="shiyunul">
																<li onclick="changeBgColor('shiyunul5',this)">
																	<img src="<%=basePath%>public/images/fangdian_06.gif" align="absmiddle" />
																	&nbsp;
																	<a href="<%=basePath%>admin/feed/instock/add.html" target="rightframe">&nbsp;饲料入库单</a>
																</li>
																<li onclick="changeBgColor('shiyunul5',this)">
																	<img src="<%=basePath%>public/images/fangdian_06.gif" align="absmiddle" />
																	&nbsp;
																	<a href="<%=basePath%>admin/feed/instock/list.html" target="rightframe">&nbsp;饲料入库记录</a>
																</li>
																<li onclick="changeBgColor('shiyunul5',this)">
																	<img src="<%=basePath%>public/images/fangdian_06.gif" align="absmiddle" />
																	&nbsp;
																	<a href="<%=basePath%>admin/feed/outstock/add.html" target="rightframe">&nbsp;饲料出库单</a>
																</li>
																<li onclick="changeBgColor('shiyunul5',this)">
																	<img src="<%=basePath%>public/images/fangdian_06.gif" align="absmiddle" />
																	&nbsp;
																	<a href="<%=basePath%>admin/feed/outstock/list.html" target="rightframe">&nbsp;饲料出库记录</a>
																</li>
																<li onclick="changeBgColor('shiyunul5',this)">
																	<img src="<%=basePath%>public/images/fangdian_06.gif" align="absmiddle" />
																	&nbsp;
																	<a href="<%=basePath%>admin/feed/stock/list.html" target="rightframe">&nbsp;饲料库存</a>
																</li>
																<%
																	for (FeedResourceType resourceType : FeedResourceType.values()) {
																%>
																<li onclick="changeBgColor('shiyunul5',this)">
																	<img src="<%=basePath%>public/images/fangdian_06.gif" align="absmiddle" />
																	&nbsp;
																	<a href="<%=basePath%>admin/feed/resource/list.html?type=<%=resourceType %>" target="rightframe">&nbsp;<%=resourceType.getTitle() %></a>
																</li>
																<%
																}
																 %>
															</ul>
															
															<div id="menudiv8" class="shiyunlei2"
																onclick="zhedie('shiyunul8',this)">
																<p>
																	兽药
																</p>
															</div>
															<ul id="shiyunul8" class="shiyunul">
																<li onclick="changeBgColor('shiyunul8',this)">
																	<img src="<%=basePath%>public/images/fangdian_06.gif" align="absmiddle" />
																	&nbsp;
																	<a href="<%=basePath%>admin/medicine/instock/add.html" target="rightframe">&nbsp;兽药入库单</a>
																</li>
																<li onclick="changeBgColor('shiyunul8',this)">
																	<img src="<%=basePath%>public/images/fangdian_06.gif" align="absmiddle" />
																	&nbsp;
																	<a href="<%=basePath%>admin/medicine/instock/list.html" target="rightframe">&nbsp;兽药入库记录</a>
																</li>
																<li onclick="changeBgColor('shiyunul8',this)">
																	<img src="<%=basePath%>public/images/fangdian_06.gif" align="absmiddle" />
																	&nbsp;
																	<a href="<%=basePath%>admin/medicine/outstock/add.html" target="rightframe">&nbsp;兽药出库单</a>
																</li>
																<li onclick="changeBgColor('shiyunul8',this)">
																	<img src="<%=basePath%>public/images/fangdian_06.gif" align="absmiddle" />
																	&nbsp;
																	<a href="<%=basePath%>admin/medicine/outstock/list.html" target="rightframe">&nbsp;兽药出库记录</a>
																</li>
																<li onclick="changeBgColor('shiyunul8',this)">
																	<img src="<%=basePath%>public/images/fangdian_06.gif" align="absmiddle" />
																	&nbsp;
																	<a href="<%=basePath%>admin/medicine/stock/list.html" target="rightframe">&nbsp;兽药库存</a>
																</li>
																<%
																	for (MedicineResourceType resourceType : MedicineResourceType.values()) {
																%>
																<li onclick="changeBgColor('shiyunul8',this)">
																	<img src="<%=basePath%>public/images/fangdian_06.gif" align="absmiddle" />
																	&nbsp;
																	<a href="<%=basePath%>admin/medicine/resource/list.html?type=<%=resourceType %>" target="rightframe">&nbsp;<%=resourceType.getTitle() %></a>
																</li>
																<%
																}
																 %>
															</ul>
															</c:if>
															<c:if test="${user.companyType == 1}">
															<div id="menudiv4" class="shiyunlei2"
																onclick="zhedie('shiyunul4',this)">
																<p>
																	种植类
																</p>
															</div>
															<ul id="shiyunul4" class="shiyunul">
																<li onclick="changeBgColor('shiyunul4',this)">
																	<img src="<%=basePath%>public/images/fangdian_06.gif" align="absmiddle" />
																	&nbsp;
																	<a href="<%=basePath%>admin/grow/register/add.html" target="rightframe">&nbsp;登记</a>
																</li>
																<li onclick="changeBgColor('shiyunul4',this)">
																	<img src="<%=basePath%>public/images/fangdian_06.gif" align="absmiddle" />
																	&nbsp;
																	<a href="<%=basePath%>admin/grow/process/list.html" target="rightframe">&nbsp;种植过程</a>
																</li>
																<li onclick="changeBgColor('shiyunul4',this)">
																	<img src="<%=basePath%>public/images/fangdian_06.gif" align="absmiddle" />
																	&nbsp;
																	<a href="<%=basePath%>admin/grow/completed/list.html" target="rightframe">&nbsp;已完成信息</a>
																</li>
																<li onclick="changeBgColor('shiyunul4',this)">
																	<img src="<%=basePath%>public/images/fangdian_06.gif" align="absmiddle" />
																	&nbsp;
																	<a href="<%=basePath%>admin/grow/archived/list.html" target="rightframe">&nbsp;已归档信息</a>
																</li>
															</ul>
															<div id="menudiv6" class="shiyunlei2"
																onclick="zhedie('shiyunul6',this)">
																<p>
																	肥料
																</p>
															</div>
															<ul id="shiyunul6" class="shiyunul">
																<li onclick="changeBgColor('shiyunul6',this)">
																	<img src="<%=basePath%>public/images/fangdian_06.gif" align="absmiddle" />
																	&nbsp;
																	<a href="<%=basePath%>admin/manure/instock/add.html" target="rightframe">&nbsp;肥料入库单</a>
																</li>
																<li onclick="changeBgColor('shiyunul6',this)">
																	<img src="<%=basePath%>public/images/fangdian_06.gif" align="absmiddle" />
																	&nbsp;
																	<a href="<%=basePath%>admin/manure/instock/list.html" target="rightframe">&nbsp;肥料入库记录</a>
																</li>
																<li onclick="changeBgColor('shiyunul6',this)">
																	<img src="<%=basePath%>public/images/fangdian_06.gif" align="absmiddle" />
																	&nbsp;
																	<a href="<%=basePath%>admin/manure/outstock/add.html" target="rightframe">&nbsp;肥料出库单</a>
																</li>
																<li onclick="changeBgColor('shiyunul6',this)">
																	<img src="<%=basePath%>public/images/fangdian_06.gif" align="absmiddle" />
																	&nbsp;
																	<a href="<%=basePath%>admin/manure/outstock/list.html" target="rightframe">&nbsp;肥料出库记录</a>
																</li>
																<li onclick="changeBgColor('shiyunul6',this)">
																	<img src="<%=basePath%>public/images/fangdian_06.gif" align="absmiddle" />
																	&nbsp;
																	<a href="<%=basePath%>admin/manure/stock/list.html" target="rightframe">&nbsp;肥料库存</a>
																</li>
																<%
																	for (ManureResourceType resourceType : ManureResourceType.values()) {
																%>
																<li onclick="changeBgColor('shiyunul6',this)">
																	<img src="<%=basePath%>public/images/fangdian_06.gif" align="absmiddle" />
																	&nbsp;
																	<a href="<%=basePath%>admin/manure/resource/list.html?type=<%=resourceType %>" target="rightframe">&nbsp;<%=resourceType.getTitle() %></a>
																</li>
																<%
																}
																 %>
															</ul>
															<div id="menudiv7" class="shiyunlei2"
																onclick="zhedie('shiyunul7',this)">
																<p>
																	农药
																</p>
															</div>
															<ul id="shiyunul7" class="shiyunul">
																<li onclick="changeBgColor('shiyunul7',this)">
																	<img src="<%=basePath%>public/images/fangdian_06.gif" align="absmiddle" />
																	&nbsp;
																	<a href="<%=basePath%>admin/pesticide/instock/add.html" target="rightframe">&nbsp;农药入库单</a>
																</li>
																<li onclick="changeBgColor('shiyunul7',this)">
																	<img src="<%=basePath%>public/images/fangdian_06.gif" align="absmiddle" />
																	&nbsp;
																	<a href="<%=basePath%>admin/pesticide/instock/list.html" target="rightframe">&nbsp;农药入库记录</a>
																</li>
																<li onclick="changeBgColor('shiyunul7',this)">
																	<img src="<%=basePath%>public/images/fangdian_06.gif" align="absmiddle" />
																	&nbsp;
																	<a href="<%=basePath%>admin/pesticide/outstock/add.html" target="rightframe">&nbsp;农药出库单</a>
																</li>
																<li onclick="changeBgColor('shiyunul7',this)">
																	<img src="<%=basePath%>public/images/fangdian_06.gif" align="absmiddle" />
																	&nbsp;
																	<a href="<%=basePath%>admin/pesticide/outstock/list.html" target="rightframe">&nbsp;农药出库记录</a>
																</li>
																<li onclick="changeBgColor('shiyunul7',this)">
																	<img src="<%=basePath%>public/images/fangdian_06.gif" align="absmiddle" />
																	&nbsp;
																	<a href="<%=basePath%>admin/pesticide/stock/list.html" target="rightframe">&nbsp;农药库存</a>
																</li>
																<%
																	for (PesticideResourceType resourceType : PesticideResourceType.values()) {
																%>
																<li onclick="changeBgColor('shiyunul7',this)">
																	<img src="<%=basePath%>public/images/fangdian_06.gif" align="absmiddle" />
																	&nbsp;
																	<a href="<%=basePath%>admin/pesticide/resource/list.html?type=<%=resourceType %>" target="rightframe">&nbsp;<%=resourceType.getTitle() %></a>
																</li>
																<%
																}
																 %>
															</ul>
															</c:if>
															<div id="menudiv9" class="shiyunlei2"
																onclick="zhedie('shiyunul9',this)">
																<p>
																	消毒剂
																</p>
															</div>
															<ul id="shiyunul9" class="shiyunul">
																<li onclick="changeBgColor('shiyunul9',this)">
																	<img src="<%=basePath%>public/images/fangdian_06.gif" align="absmiddle" />
																	&nbsp;
																	<a href="<%=basePath%>admin/disinfectant/instock/add.html" target="rightframe">&nbsp;消毒剂入库单</a>
																</li>
																<li onclick="changeBgColor('shiyunul9',this)">
																	<img src="<%=basePath%>public/images/fangdian_06.gif" align="absmiddle" />
																	&nbsp;
																	<a href="<%=basePath%>admin/disinfectant/instock/list.html" target="rightframe">&nbsp;消毒剂入库记录</a>
																</li>
																<li onclick="changeBgColor('shiyunul9',this)">
																	<img src="<%=basePath%>public/images/fangdian_06.gif" align="absmiddle" />
																	&nbsp;
																	<a href="<%=basePath%>admin/disinfectant/outstock/add.html" target="rightframe">&nbsp;消毒剂出库单</a>
																</li>
																<li onclick="changeBgColor('shiyunul9',this)">
																	<img src="<%=basePath%>public/images/fangdian_06.gif" align="absmiddle" />
																	&nbsp;
																	<a href="<%=basePath%>admin/disinfectant/outstock/list.html" target="rightframe">&nbsp;消毒剂出库记录</a>
																</li>
																<li onclick="changeBgColor('shiyunul9',this)">
																	<img src="<%=basePath%>public/images/fangdian_06.gif" align="absmiddle" />
																	&nbsp;
																	<a href="<%=basePath%>admin/disinfectant/stock/list.html" target="rightframe">&nbsp;消毒剂库存</a>
																</li>
																
																<%
																	for (DisinfectantResourceType resourceType : DisinfectantResourceType.values()) {
																%>
																<li onclick="changeBgColor('shiyunul9',this)">
																	<img src="<%=basePath%>public/images/fangdian_06.gif" align="absmiddle" />
																	&nbsp;
																	<a href="<%=basePath%>admin/disinfectant/resource/list.html?type=<%=resourceType %>" target="rightframe">&nbsp;<%=resourceType.getTitle() %></a>
																</li>
																<%
																}
																 %>
															</ul>
															<div id="menudiv10" class="shiyunlei2"
																onclick="zhedie('shiyunul10',this)">
																<p>
																	数据字典
																</p>
															</div>
															<ul id="shiyunul10" class="shiyunul">
															<%
															
															for (DictType dictType : DictType.values()) {
															%>
															
															<li onclick="changeBgColor('shiyunul10',this)">
																<img src="<%=basePath%>public/images/fangdian_06.gif" align="absmiddle" />
																&nbsp;
																<a href="<%=basePath%>admin/resource/dict/list.html?type=<%=dictType %>" target="rightframe">&nbsp;<%=dictType.getTitle() %></a>
															</li>
															<%
															}
															 %>
															</ul>
															
															<div id="menudiv11" class="shiyunlei2"
																onclick="zhedie('shiyunul11',this)">
																<p>
																	生产管理
																</p>
															</div>
															<ul id="shiyunul11" class="shiyunul">
																<li onclick="changeBgColor('shiyunul11',this)">
																	<img src="<%=basePath%>public/images/fangdian_06.gif" align="absmiddle" />
																	&nbsp;
																	<a target="rightframe">&nbsp;产品召回记录</a>
																</li>
																<li onclick="changeBgColor('shiyunul11',this)">
																	<img src="<%=basePath%>public/images/fangdian_06.gif" align="absmiddle" />
																	&nbsp;
																	<a target="rightframe">&nbsp;防护服使用清洗记录</a>
																</li>
																<li onclick="changeBgColor('shiyunul11',this)">
																	<img src="<%=basePath%>public/images/fangdian_06.gif" align="absmiddle" />
																	&nbsp;
																	<a target="rightframe">&nbsp;废弃物处理记录</a>
																</li>
																<li onclick="changeBgColor('shiyunul11',this)">
																	<img src="<%=basePath%>public/images/fangdian_06.gif" align="absmiddle" />
																	&nbsp;
																	<a target="rightframe">&nbsp;设施设备维修保养清洗记录</a>
																</li>
																<li onclick="changeBgColor('shiyunul11',this)">
																	<img src="<%=basePath%>public/images/fangdian_06.gif" align="absmiddle" />
																	&nbsp;
																	<a target="rightframe">&nbsp;有害生物控制检查记录</a>
																</li>
																<li onclick="changeBgColor('shiyunul11',this)">
																	<img src="<%=basePath%>public/images/fangdian_06.gif" align="absmiddle" />
																	&nbsp;
																	<a target="rightframe">&nbsp;消毒记录</a>
																</li>
																<li onclick="changeBgColor('shiyunul11',this)">
                                                                    <img src="<%=basePath%>public/images/fangdian_06.gif" align="absmiddle" />
                                                                    &nbsp;
                                                                    <a href="<%=basePath%>admin/pm/transport/list.html" target="rightframe">&nbsp;运输记录</a>
                                                                </li>
																<li onclick="changeBgColor('shiyunul11',this)">
																	<img src="<%=basePath%>public/images/fangdian_06.gif" align="absmiddle" />
																	&nbsp;
																	<a href="<%=basePath%>admin/pm/sale/list.html" target="rightframe">&nbsp;销售记录</a>
																</li>
																<li onclick="changeBgColor('shiyunul11',this)">
																	<img src="<%=basePath%>public/images/fangdian_06.gif" align="absmiddle" />
																	&nbsp;
																	<a target="rightframe">&nbsp;培训记录</a>
																</li>
																<li onclick="changeBgColor('shiyunul11',this)">
																	<img src="<%=basePath%>public/images/fangdian_06.gif" align="absmiddle" />
																	&nbsp;
																	<a target="rightframe">&nbsp;员工基本信息</a>
																</li>
																<li onclick="changeBgColor('shiyunul11',this)">
																	<img src="<%=basePath%>public/images/fangdian_06.gif" align="absmiddle" />
																	&nbsp;
																	<a target="rightframe">&nbsp;投诉建议</a>
																</li>
																<li onclick="changeBgColor('shiyunul11',this)">
																	<img src="<%=basePath%>public/images/fangdian_06.gif" align="absmiddle" />
																	&nbsp;
																	<a target="rightframe">&nbsp;法律法规</a>
																</li>
																<li onclick="changeBgColor('shiyunul11',this)">
																	<img src="<%=basePath%>public/images/fangdian_06.gif" align="absmiddle" />
																	&nbsp;
																	<a target="rightframe">&nbsp;抱怨处理</a>
																</li>
																
															</ul>
														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
								</table>
							</td>
							<td width="1" bgcolor="#d1e6f7"></td>
						</tr>
					</table>
				</td>
				<td width="790" align="left" valign="top" class="pl10">
					<!-- <table width="100%" border="0" cellspacing="0" cellpadding="0" class="subNav mCenter" style="width: 100%;">
						<tr>
							<td class="font12Blue p10">
								<span class="font12Blue_B">您当前所在位置：</span>首页
							</td>
						</tr>
					</table> -->
					<iframe id="rightframe" name="rightframe" frameborder="no" style="width:100%; height:600px; border:0;" scrolling="no"></iframe>
				</td>
			</tr>
		</table>
		<!--底部-->
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			class="footer">
			<tr>
				<td valign="middle">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="24" align="center">
								本网站由：中国质量认证中心产品认证七部&nbsp;&nbsp;北京中认环宇技术支持 <a href="<%=basePath%>CaptureActivity.apk" style="color:blue">安卓下载</a>
							</td>
						</tr>
						<tr>
							<td height="24" align="center">
								Copyright&nbsp;&copy;&nbsp;2000-2010&nbsp;&nbsp;&nbsp;&nbsp;中国质量认证中心&nbsp;京ICP证030724&nbsp;&nbsp;声明：各个企业发布的信息由企业自身负责法律责任
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</body>
</html>
