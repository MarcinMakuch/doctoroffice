<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Użytkownicy</title>
    <link href="<c:url value="/theme/css/sb-admin-2.css"/>" rel="stylesheet">
</head>
<body>
<div><a href='<c:url value="/"/>'><button type="button" class="btn btn-light">WRÓĆ</button></a></div>
<br>
<div><a href='<c:url value="/user/add"/>'><button type="button" class="btn btn-light">Dodaj nowego użytkownika</button></a></div>
<div><p><c:out value="${message}"/></p></div>
<div class="card-body">
    <div class="table-responsive">
        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
    <thead>
    <tr>
        <th>Imię</th>
        <th>Nazwisko</th>
        <th>Uprawnienia</th>
    </tr>
    <c:forEach items="${users}" var="user">
        <tr>
            <td><c:out value="${user.firstName}"/></td>
            <td><c:out value="${user.lastName}"/></td>
            <td><c:out value="${user.role}"/></td>
            <td><a href='<c:url value="/user/edit/${user.getId()}"/>'><button type="button" class="btn btn-success">Edytuj</button></a></td>
            <td><a href='<c:url value="/user/confirm/${user.getId()}"/>'><button type="button" class="btn btn-danger">Usuń</button></a></td>
                    </tr>
    </c:forEach>
    </thead>
</table>
    </div>
</div>
</body>
</html>
