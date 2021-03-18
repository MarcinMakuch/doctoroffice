<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Użytkownicy</title>
</head>
<body>
<a href='<c:url value="/"/>'><button>WRÓĆ</button></a>
<br>
<a href='<c:url value="/user/add"/>'><button>Dodaj nowego użytkownika</button></a>
<p><c:out value="${message}"/></p>
<table border="1">
    <thead>
    <tr>
        <th>Imię</th>
        <th>Nazwisko</th>
    </tr>
    <c:forEach items="${users}" var="user">
        <tr>
            <td><c:out value="${user.firstName}"/></td>
            <td><c:out value="${user.lastName}"/></td>
            <td><a href='<c:url value="/user/edit/${user.getId()}"/>'><button>Edytuj</button></a></td>
            <td><a href='<c:url value="/user/confirm/${user.getId()}"/>'><button>Usuń</button></a></td>
                    </tr>
    </c:forEach>
    </thead>
</table>
</body>
</html>
