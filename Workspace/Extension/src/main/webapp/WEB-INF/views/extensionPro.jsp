<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title></title>
</head>
<body>
<c:choose>
	<c:when test="${index == 1}">
		<script>
			alert("������ ���ε� �Ǿ����ϴ�.");
			location.href = "extension";
		</script>
	</c:when>
	<c:when test="${index == 0}">
		<script>
			alert("������ ���ε忡 �����Ͽ����ϴ�.");
			location.href = "extension";
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("���ܵ� ���� Ȯ���� �Դϴ�.");			
			location.href = "extension";
		</script>
	</c:otherwise>
</c:choose>
</body>
</html>