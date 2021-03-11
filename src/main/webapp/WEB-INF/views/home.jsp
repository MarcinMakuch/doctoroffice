<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Doctor Office</title>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Strona logowania</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
        <link href="https://getbootstrap.com/docs/4.0/examples/signin/signin.css" rel="stylesheet" crossorigin="anonymous">
    </head>
</head>
<body>
<div class="container">
    <form class="form-user" method="" action="/user">
        <button class="btn btn-primary btn-block" type="submit">Użytkownicy</button>
    </form>

    <form class="form-client" method="" action="/client">
        <button class="btn btn-primary btn-block" type="submit">Pacjenci</button>
    </form>

    <form class="form-task" method="" action="/task">
        <button class="btn btn-primary btn-block" type="submit">Wizyty</button>
    </form>

    <form class="form-logout" method="get" action="/logout">
        <button class="btn btn-primary btn-block" type="submit">Wyloguj</button>
    </form>
</div>
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

<%--<c:forEach var="task" items="${tasks}" varStatus="status">
       <c:if test="${status.last}">${task.id}</c:if>
    </c:forEach>--%>

<div>
<%--    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    <jsp:useBean id="now" class="java.util.Date"/>
    <fmt:formatDate value="${now}" dateStyle="long"/>
    <fmt:formatDate value="${now}" pattern="dd-MM-yyyy HH:mm:ss a z" />--%>

</div>
<div>
    <%--<table border="1">
        <c:forEach items="${lastFive}" var="item">
            <tr>
                <td>${item.id}</td>
                <td>${item.title}</td>
                <td>${item.author}</td>
                <td>${item.content}</td>
            </tr>
        </c:forEach>
    </table>--%>
</div>
</body>
</html>
