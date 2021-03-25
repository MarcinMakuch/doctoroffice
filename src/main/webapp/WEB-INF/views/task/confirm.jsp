<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="<c:url value="/theme/css/sb-admin-2.css"/>" rel="stylesheet">
    <title>Usuwanie wizyty</title>
</head>
<body>
<h4>Potwierdź usunięcie wizyty</h4>
<a href='<c:url value="/task/remove/${task.getId()}"/>'><button type="button" class="btn btn-danger">TAK</button></a>
<a href='<c:url value="/task"/>'><button type="button" class="btn btn-info">NIE</button></a>
</body>
</html>
