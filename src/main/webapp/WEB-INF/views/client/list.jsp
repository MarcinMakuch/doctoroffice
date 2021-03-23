<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Klienci</title>
</head>
<body>
<a href='<c:url value="/"/>'><button>WRÓĆ</button></a>
<br>
<a href='<c:url value="/client/add"/>'><button>Dodaj nowego klienta</button></a>
<h3><p><c:out value="${message}"/></p></h3>
<table border="1">
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
            <td><a href='<c:url value="/client/edit/${client.getId()}"/>'><button>Edytuj</button></a></td>
            <td><a href='<c:url value="/client/confirm/${client.getId()}"/>'><button>Usuń</button></a></td>
            <td><a href='<c:url value="/file/upload/${client.getId()}"/>'><button>Pliki</button></a></td>
        </tr>
    </c:forEach>
    </thead>
</table>
</body>
</html>
