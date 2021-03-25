<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="<c:url value="/theme/css/sb-admin-2.css"/>" rel="stylesheet">
    <title>Wizyty</title>
</head>
<body>
<a href='<c:url value="/"/>'><button type="button" class="btn btn-light">WRÓĆ</button></a>
<br>
<a href='<c:url value="/task/add"/>'><button type="button" class="btn btn-light">Dodaj nową wizytę</button></a>
<p><c:out value="${message}"/></p>
<div class="card-body">
    <div class="table-responsive">
        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
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
            <td><a href='<c:url value="/task/edit/${task.getId()}"/>'><button type="button" class="btn btn-success">Edytuj</button></a></td>
            <td><a href='<c:url value="/task/confirm/${task.getId()}"/>'><button type="button" class="btn btn-danger">Usuń</button></a></td>
        </tr>
    </c:forEach>
    </thead>
</table>
    </div>
</div>
</body>
</html>
