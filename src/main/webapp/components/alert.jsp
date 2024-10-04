<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
 
	<%
	String message = (String) request.getAttribute("message");
	String type = (String) request.getAttribute("type");

	if (message != null && type != null) {
	%>

	<script type="text/javascript">
	Swal.fire({
		title: "<%=message%>",
		icon: "<%=type%>"
		});
	</script>

	<%
	}
	%>  