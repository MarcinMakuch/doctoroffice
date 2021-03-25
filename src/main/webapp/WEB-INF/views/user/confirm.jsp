<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="<c:url value="/theme/css/sb-admin-2.css"/>" rel="stylesheet">
    <title>Usuwanie użytkownika</title>
</head>
<body>
<h4>Potwierdź usunięcie użytkownika</h4>
<a href='<c:url value="/user/remove/${user.getId()}"/>'><button type="button" class="btn btn-danger">TAK</button></a>
<a href='<c:url value="/user"/>'><button type="button" class="btn btn-info">NIE</button></a>
</body>
</html>
