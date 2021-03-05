<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Doctor Office</title>
</head>
<body>
<div>
    <p><a href="<c:url value="/user"/>" name="">
        <button>Użytkownicy</button>
    </a></p>

    <p><a href="<c:url value="/client"/>" name="">
        <button>Pajcenci</button>
    </a></p>

    <p><a href="<c:url value="/task"/>" name="">
        <button>Wizyty</button>
    </a></p>

    <p><a href="<c:url value="/logout"/>" name="">
        <button>Wyloguj</button>
    </a></p>

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
