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
			alert("파일이 업로드 되었습니다.");
			location.href = "extension";
		</script>
	</c:when>
	<c:when test="${index == 0}">
		<script>
			alert("파일이 업로드에 실패하였습니다.");
			location.href = "extension";
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("차단된 파일 확장자 입니다.");			
			location.href = "extension";
		</script>
	</c:otherwise>
</c:choose>
</body>
</html>