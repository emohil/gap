<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<%
String path = request.getContextPath();
String basePath = path+"/";
%>
<!DOCTYPE HTML>
<script type="text/javascript">
	window.basePath = '<%=basePath%>';
</script>