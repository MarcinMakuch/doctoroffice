<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Doctor Office</title>
    <head>
        <title>Strona logowania</title>
    </head>
</head>
<body>
<div>
    <p><a href="<c:url value="/user"/>" >
        <button>Użytkownicy</button>
    </a></p>
    <p><a href="<c:url value="/client"/>" >
        <button>Pajcenci</button>
    </a></p>
    <p><a href="<c:url value="/task"/>" >
        <button>Wizyty</button>
    </a></p>
    <p><a href="<c:url value="/logout"/>" >
        <button>Wyloguj</button>
    </a></p>
</div>
<h3><p><c:out value="${message}"/></p></h3>
Dzisiejsze wizyty
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
        </tr>
    </c:forEach>
    </thead>
</table>
<div>
    <form:form action="/task/search" method="get">
        <input type="text" name="question">
        <button type="submit">Szukaj</button>
    </form:form>
</div>
</body>
</html>
