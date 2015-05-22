<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="/public/jsp/taglibs.jsp"%>
<html>
<head>
	<base href="<%=basePath%>">
    <title></title>
    <%@include file="/public/jsp/commonEntry.jsp"%>
    <script type="text/javascript">
  		JGAP.on(window, 'load', function() {
	    	validator.regist({id : "activitydate", name : "活动时间"}, "date");
	    	validator.regist({id : "scale", name : "农事活动规模(亩)"}, "notnull", "number");
	    	validator.regist({id : "persons", name : "参与人员数量"}, "notnull", "number");
	    	validator.bindForm("form1");
	   	});
    </script>
</head>
<body>
	<form id="form1" name="form1" method="post">
		<input type="hidden" name="id" value="${data.id}"/>
		<input type="hidden" name="registerId" value="${registerId}"/>
		<table width="100%">
			<tr>
				<td>
					<table border="0" cellspacing="0" cellpadding="0" class="subNav mCenter" style="width:100%;">
			      		<tr>
			        		<td class="font12Blue p10"><span class="font12Blue_B">您当前所在位置：农事活动</td>
			      		</tr>
			   		 </table>
				</td>
			</tr>
			<tr>
				<td>
					<table style="width:100%;">
						<tr>
							<td class="dataListTitle"><span class="pl10">农事活动</span></td>
						</tr>
						<tr>
							<td>
								<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="dataList">
								    <tr> 
								   	 	<td class=forumrow style="70%"><div align="right">活动时间:</div></td>
										<td class=forumrow>
											<input type="text" id="activitydate" name="activitydate" value="${data.disp.activitydate }" class="Wdate" onClick="WdatePicker()"/>
										</td>
								    </tr>
								    <tr>
										<td class=forumrow><div align="right">农事活动内容:</div></td>
										<td class=forumrow>
											<textarea name="content" cols="50" rows="4">${data.content}</textarea>
										</td>
									</tr>
								    <tr>
										<td class=forumrow><div align="right">农事活动规模(亩):</div></td>
										<td class=forumrow>
											<input type="text" id="scale" name="scale" value="${data.scale }"/><font class=required>*</font>
										</td>
									</tr>
								    <tr>
										<td class=forumrow><div align="right">参与人员数量:</div></td>
										<td class=forumrow>
											<input type="text" id="persons" name="persons" value="${data.persons }"/><font class=required>*</font>
										</td>
									</tr>
								    <tr>
										<td class=forumrow><div align="right">负责人:</div></td>
										<td class=forumrow>
											<input type="text" name="manager" value="${data.manager }"/>
										</td>
									</tr>
								    <tr>
										<td class=forumrow><div align="right">备注:</div></td>
										<td class=forumrow>
											<textarea name="comment" cols="50" rows="4">${data.comment}</textarea>
										</td>
									</tr>
								    <tr> 
								      	<td>&nbsp;</td>
										<td>
											<c:if test="${_action == 'add'}">
										      	<%@include file="/public/jsp/btn/save.jsp"%>
										      	<%@include file="/public/jsp/btn/empty.jsp"%>
								      		</c:if>
								      		<c:if test="${_action == 'edit'}">
								      			<%@include file="/public/jsp/btn/update.jsp"%>
								      		</c:if>
								      		<%@include file="/public/jsp/btn/back.jsp"%>
										</td>
								    </tr>
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