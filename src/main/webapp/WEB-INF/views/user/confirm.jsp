<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Usuwanie użytkownika</title>
</head>
<body>
<h4>Potwierdź usunięcie użytkownika</h4>
<a href='<c:url value="/user/remove/${user.getId()}"/>'><button>TAK</button></a>
<a href='<c:url value="/user"/>'><button>NIE</button></a>
</body>
</html>
