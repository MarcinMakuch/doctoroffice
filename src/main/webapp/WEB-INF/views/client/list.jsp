<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="<c:url value="/theme/css/sb-admin-2.css"/>" rel="stylesheet">
    <title>Klienci</title>
</head>
<body>
<a href='<c:url value="/"/>'><button type="button" class="btn btn-light">WRÓĆ</button></a>
<br>
<a href='<c:url value="/client/add"/>'><button type="button" class="btn btn-light">Dodaj nowego klienta</button></a>
<h3><p><c:out value="${message}"/></p></h3>
<div class="card-body">
    <div class="table-responsive">
        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
    <thead>
    <tr>
        <th>Imię</th>
        <th>Nazwisko</th>
        <th>Pesel</th>
        <th>Email</th>
        <th>Telefon</th>
        <th>Info</th>
    </tr>
    <c:forEach items="${clients}" var="client">
        <tr>
            <td><c:out value="${client.firstName}"/></td>
            <td><c:out value="${client.lastName}"/></td>
            <td><c:out value="${client.pesel}"/></td>
            <td><c:out value="${client.email}"/></td>
            <td><c:out value="${client.phoneNumber}"/></td>
            <td><c:out value="${client.comments}"/></td>
            <td><a href='<c:url value="/client/edit/${client.getId()}"/>'><button type="button" class="btn btn-success">Edytuj</button></a></td>
            <td><a href='<c:url value="/client/confirm/${client.getId()}"/>'><button type="button" class="btn btn-danger">Usuń</button></a></td>
            <td><a href='<c:url value="/file/upload/${client.getId()}"/>'><button type="button" class="btn btn-link">Pliki</button></a></td>
        </tr>
    </c:forEach>
    </thead>
</table>
    </div>
</div>
</body>
</html>
