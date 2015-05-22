<%@ page language="java" pageEncoding="UTF-8"%>
<%@include file="/public/jsp/taglibs.jsp"%>
<html>
<head>
	<base href="<%=basePath%>">
    <title></title>
    <%@include file="/public/jsp/commonEntry.jsp"%>
    <script type="text/javascript">
		JGAP.on(window, 'load', function() {
	    	validator.regist({id : "companyno", name : "公司代码"}, "notnull");
	    	validator.regist({id : "companyname", name : "公司名称"}, "notnull");
	    	validator.regist({id : "type", name : "公司类型"}, "notnull");
	    	validator.bindForm("form1");
	   	});
    </script>
</head>
<body>
	<form id="form1" method="post">
		<input type="hidden" name="id" value="${data.id}"/>
		<table width="100%">
			<tr>
				<td>
					<table style="width:100%;">
						<tr>
							<td class="dataListTitle"><span class="pl10">公司维护</span></td>
						</tr>
						<tr>
							<td>
								<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="dataList">
									<tr>
										<td class=forumrow style="width:30%;"><div align="right">公司代码:</div></td>
										<td class=forumrow>
											<input type="text" id="companyno" name="companyno" value="${data.companyno }"/><font class=required>*</font>
										</td>
									</tr>
									<tr>
										<td class=forumrow><div align="right">公司名称:</div></td>
										<td class=forumrow>
											<input type="text" id="companyname" name="companyname" value="${data.companyname }"/><font class=required>*</font>
										</td>
									</tr>
									<tr>
										<td class=forumrow><div align="right">公司类型:</div></td>
										<td class=forumrow>
											<select id="type" name="type">
												<option value=""> 请选择公司类型</option>
												<option value="1" <c:if test="${1==data.type}">selected</c:if>>种植类</option>
												<option value="2" <c:if test="${2==data.type}">selected</c:if>>养殖类</option>
											</select><font class=required>*</font>
										</td>
									</tr>
									<tr>
										<td>&nbsp;</td>
										<td>
											<c:if test="${_action == 'add'}">
										      	<input type="button" class="btnStyle" value="确&nbsp;认" onclick="subform('save');"/>
								      		</c:if>
								      		<c:if test="${_action == 'edit'}">
								      			<input type="button" class="btnStyle" value="保&nbsp;存" onclick="subform('update');"/> 
								      		</c:if>
								      		<input type="button" class="btnStyle" value="返&nbsp;回" onclick="JGAP.goBack();"/>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
		</table>
	</form>
</body>
</html>