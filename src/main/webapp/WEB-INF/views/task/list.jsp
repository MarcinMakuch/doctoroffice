<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Wizyty</title>
</head>
<body>
<a href='<c:url value="/"/>'><button>WRÓĆ</button></a>
<br>
<a href='<c:url value="/task/add"/>'><button>Dodaj nową wizytę</button></a>
<p><c:out value="${message}"/></p>
<table border="1">
    <thead>
    <tr>
        <th>Rehabilitant</th>
        <th>Pacjent</th>
        <th>Data</th>
        <th>Godzina</th>
    </tr>
    <c:forEach items="${tasks}" var="task">
        <tr>
            <td><c:out value="${task.user.lastName}"/></td>
            <td><c:out value="${task.client.lastName}"/></td>
            <td><c:out value="${task.date}"/></td>
            <td><c:out value="${task.time}"/></td>
            <td><a href='<c:url value="/task/edit/${task.getId()}"/>'><button>Edytuj</button></a></td>
            <td><a href='<c:url value="/task/confirm/${task.getId()}"/>'><button>Usuń</button></a></td>
        </tr>
    </c:forEach>
    </thead>
</table>
</body>
</html>
