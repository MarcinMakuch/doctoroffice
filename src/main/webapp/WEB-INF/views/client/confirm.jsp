<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Usuwanie Klienta</title>
</head>
<body>
<h4>Potwierdź usunięcie Klienta</h4>
<a href='<c:url value="/client/remove/${client.getId()}"/>'><button>TAK</button></a>
<a href='<c:url value="/client"/>'><button>NIE</button></a>
</body>
</html>
