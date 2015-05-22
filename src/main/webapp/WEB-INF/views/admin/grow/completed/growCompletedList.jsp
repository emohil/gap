<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="/public/jsp/taglibs.jsp"%>

<html>
<head>
	<base href="<%=basePath%>">
	<title>已完成信息</title>
	<%@include file="/public/jsp/common.jsp"%>
</head>

<body>
	<form id="form1" method="post">
		<table width="100%">
			<tr>
				<td>
					<table border="0" cellspacing="0" cellpadding="0" class="subNav mCenter" style="width:100%;">
			      		<tr>
			        		<td class="font12Blue p10"><span class="font12Blue_B">您当前所在位置：已完成信息</td>
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
										<td style="25%">生产单元:</td>
										<td style="25%">描述:</td>
									</tr>
									<tr>
										<td>
											<select name="searcher.sfs['cellId'].value">
												<option value="">--全部--</option>
												<c:forEach items="${cellList}" var="cell">
													<option value="${cell.id}" <c:if test="${cell.id == searcher.sfs['cellId'].value}">selected</c:if>>${cell.code}</option>
												</c:forEach>
											</select>
											<input type="hidden" name="searcher.sfs['cellId'].name" value="cell_id"/>
											<input type="hidden" name="searcher.sfs['cellId'].op.code" value="8"/>
										</td>
										<td>
											<input type="text" name="searcher.sfs['description'].value" value="${searcher.sfs['description'].value}"/>
											<input type="hidden" name="searcher.sfs['description'].name" value="description"/>
											<input type="hidden" name="searcher.sfs['description'].op.code" value="1"/>
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
         					 <td class="dataListTitle"><span class="pl10">已完成信息</span></td>
       					</tr>
						<tr>
							<td align="left" valign="top">
								<table width="100%" border="0" cellspacing="0" cellpadding="0" class="dataList">
									<tr>
						                <th width="5%">编号</th>
						                <th width="8%">生产单元</th>
						                <th>描述</th>
						                <th>登记日期</th>
						                <th>登记人</th>
						                <th>种植状态</th>
						                <th>状态</th>
						                <th>农事活动</th>
						                <th>灌溉记录</th>
						                <th>投入品使用</th>
						                <th>收割记录</th>
						                <th>操作</th>
						            </tr>
						            <c:forEach items="${datas}" var="data" varStatus="status">
						              	<tr>
							                <td>${pager.start+status.index}</td>
							                <td>${data.disp.cellId}</td>
							                <td>${data.description}</td>
							                <td>${data.disp.regdate}</td>
							                <td>${data.person}</td>
							                <td>
							                	${data.disp.growstatus}
							                </td>
							                <td>${data.disp.status}</td>
							              	<td>
								                <a class=linkStyle href="<%=basePath%>admin/grow/farm/list.html?registerId=${data.id}">农事活动</a>
							                </td>
							                <td>
								                <a class=linkStyle href="<%=basePath%>admin/grow/irrigate/list.html?registerId=${data.id}">灌溉记录</a>
											</td>
							                <td>
							                	<a class=linkStyle href="<%=basePath%>admin/grow/manure/list.html?registerId=${data.id}">肥料</a>&nbsp;|&nbsp;
								                <a class=linkStyle href="<%=basePath%>admin/grow/pesticide/list.html?registerId=${data.id}">农药</a>
							                </td>
							                <td>
								                <a class=linkStyle href="<%=basePath%>admin/grow/harvest/list.html?registerId=${data.id}">收割记录</a>
							                </td>
							                <td>
							                	<a class=linkStyle href="<%=basePath%>admin/grow/register/archive.html?id=${data.id}" onclick="return confirm('确定归档吗?')">归档</a>
							                	&nbsp;|&nbsp;
							                	<a class=linkStyle href="<%=basePath%>admin/grow/register/disp.html?id=${data.id}">查看</a>
							                </td>
						              	</tr>
						        	</c:forEach>
								</table>
							</td>
						</tr>
					</table>	
				</td>
			</tr>
		</table>
	</form>	
</body>
</html>