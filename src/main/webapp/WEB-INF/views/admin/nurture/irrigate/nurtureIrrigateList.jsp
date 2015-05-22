<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="/public/jsp/taglibs.jsp"%>

<html>
<head>
	<base href="<%=basePath%>">
	<title>灌溉记录</title>
	<%@include file="/public/jsp/common.jsp"%>
</head>

<body>
	<form id="form1" method="post">
		<table width="100%">
			<tr>
				<td>
					<table border="0" cellspacing="0" cellpadding="0" class="subNav mCenter" style="width:100%;">
			      		<tr>
			        		<td class="font12Blue p10"><span class="font12Blue_B">您当前所在位置：灌溉记录</td>
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
         					 <td class="dataListTitle"><span class="pl10">灌溉记录</span></td>
       					</tr>
						<tr>
							<td align="left" valign="top">
								<table width="100%" border="0" cellspacing="0" cellpadding="0" class="dataList">
									<tr>
						                <th>序号</th>
						                <th>时间</th>
						                <th>灌溉方式</th>
						                <th>灌溉面积</th>
						                <th>灌溉量</th>
						                <th>负责人</th>
						                <th>备注</th>
						                <th>状态</th>
						                <th>操作</th>
						            </tr>
						            <c:forEach items="${datas}" var="data" varStatus="status">
						              	<tr>
						              		<td>${pager.start+status.index}</td>
						              		<td>${data.disp.date}</td>
						              		<td>${data.way }</td>
						              		<td>${data.area}</td>
						              		<td>${data.quantum }</td>
						              		<td>${data.manager }</td>
						              		<td>${data.disp.status}</td>
						              		<td>${data.comment }</td>
						              		<td>
						              			<c:if test="${data.status == 0}">
						              				<a class=linkStyle href="<%=basePath%>admin/nurture/irrigate/approve.html?id=${data.id}&registerId=${registerId}" onclick="return confirm('确定批准吗?')">批准</a>
													&nbsp;|&nbsp;
						              				<a class=linkStyle href="<%=basePath%>admin/nurture/irrigate/edit.html?id=${data.id}&registerId=${registerId}">修改</a>
													&nbsp;|&nbsp;
							                		<a class=linkStyle href="<%=basePath%>admin/nurture/irrigate/delete.html?id=${data.id}&registerId=${registerId}" onclick="return confirm('确定删除吗?')">删除</a>
						              			</c:if>
						              			<c:if test="${data.status == 2}">
						              				<a class=linkStyle href="<%=basePath%>admin/nurture/irrigate/disp.html?id=${data.id}&registerId=${registerId}">查看</a>
													&nbsp;|&nbsp;
							                		<a class=linkStyle href="<%=basePath%>admin/nurture/irrigate/nullify.html?id=${data.id}&registerId=${registerId}" onclick="return confirm('确定作废吗?')">作废</a>
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
			</tr>
				<td style="text-align:right">
					<input type="button" class="btnStyle" value="&nbsp;添&nbsp;加&nbsp;" onclick='window.location.href="<%=basePath%>admin/nurture/irrigate/add.html?registerId=${registerId}"'/>
				</td>
			</tr>
		</table>
	</form>	
</body>
</html>