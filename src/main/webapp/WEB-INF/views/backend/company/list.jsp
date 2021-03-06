<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="/public/jsp/taglibs.jsp"%>

<html>
<head>
	<base href="<%=basePath%>">
	<title>公司列表</title>
	<%@include file="/public/jsp/common.jsp"%>
</head>

<body>
	<form id="form1" method="post">
		<table width="100%">
			<tr>
				<td>
					<table border="0" cellspacing="0" cellpadding="0" class="subNav mCenter" style="width:100%;">
			      		<tr>
			        		<td class="font12Blue p10"><span class="font12Blue_B">您当前所在位置：公司维护</td>
			      		</tr>
			   		 </table>
				</td>
			</tr>
			
			<tr>
				<td>
					<table style="width:100%;">
						<tr>
							<td class="dataListTitle"><span class="pl10">查询</span></td>
						</tr>
						<tr>
							<td>
								<table style="width:100%;">
									<tr>
										<td style="25%">公司ID:</td>
										<td style="25%">公司名称</td>
										<td style="25%"></td>
										<td style="25%"></td>
									</tr>
									<tr>
										<td>
											<input/>
										</td>
										<td>
											<input/>
										</td>
										<td>
										</td>
										<td>
										</td>
									</tr>
									</tr>
										<td style="text-align:right" colspan="4">
											<input type="button" class="btnStyle" value="&nbsp;查&nbsp;询&nbsp;" onclick="doMethod('search');"/>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			
			<!-- list -->
			<tr>
				<td>
					<table cellpadding="0" cellspacing="0" style="width:100%;">
						<%@include file="/public/jsp/pager.jsp"%>
						<tr>
         					 <td class="dataListTitle"><span class="pl10">公司列表记录</span></td>
       					</tr>
						<tr>
							<td align="left" valign="top">
								<table width="100%" border="0" cellspacing="0" cellpadding="0" class="dataList">
									<tr>
						                <th>编号</th>
						                <th>公司编号</th>
						                <th>公司名称</th>
						                <th>公司类型</th>
						                <th>状态</th>
						                <th>操作</th>
						            </tr>
						            <c:forEach items="${datas}" var="data" varStatus="status">
						              	<tr>
							                <td>${pager.start+status.index}</td>
							                <td>${data.companyno}</td>
							                <td>${data.companyname}</td>
							                <td>
							                	<c:if test="${1==data.type}">种植类</c:if>
							                	<c:if test="${2==data.type}">养殖类</c:if>
							                </td>
							                <td>${data.disp.status}</td>
							                <td>
												<c:if test="${data.status == 0}">
							                		<a class=linkStyle href="<%=basePath%>backend/company/approve.html?id=${data.id}" onclick="return confirm('确定批准吗?这将为该公司初始化数据库，请稍等。。。')">批准</a>
							                		&nbsp;|&nbsp;
							                		<a class=linkStyle href="<%=basePath%>backend/company/edit.html?id=${data.id}">修改</a>
													&nbsp;|&nbsp;
							                		<a class=linkStyle href="<%=basePath%>backend/company/delete.html?id=${data.id}" onclick="return confirm('确定删除吗?')">删除</a>
							                	</c:if>
							                	<c:if test="${data.status == 2}">
							                		<a class=linkStyle href="<%=basePath%>backend/company/disp.html?id=${data.id}">查看</a>
							                		&nbsp;|&nbsp;
							                		<a class=linkStyle href="<%=basePath%>backend/company/nullify.html?id=${data.id}" onclick="return confirm('确定作废吗?')">作废</a>
							                	</c:if>
											</td>
						              	</tr>
						            </c:forEach>
								</table>
							</td>
						</tr>
					</table>	
				</td>
			</tr>
			<tr><td>&nbsp;</td></tr>
			<tr>
				<td style="text-align:right">
					<input type="button" class="btnStyle" value="新&nbsp;建" onclick="window.location.href='<%=basePath%>backend/company/add.html';"/>
				</td>
			</tr>
		</table>
	</form>	
</body>
</html>