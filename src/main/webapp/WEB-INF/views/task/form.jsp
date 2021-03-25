<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="<c:url value="/theme/css/sb-admin-2.css"/>" rel="stylesheet">
    <title>Dodaj wizytę</title>
</head>
<body>
<a href='<c:url value="/task"/>'>
    <button type="button" class="btn btn-light">WRÓĆ</button>
</a>
<p><c:out value="${message}"/></p>
<form:form method="post" modelAttribute="task">
    <form:hidden path="id"/>
    Rehabilitant: <br>
    <form:select path="user">
    <form:option value="0">-- wybierz --</form:option>
    <form:options items="${users}" itemValue="id" itemLabel="lastName"/></form:select><br>
    <form:errors path="user"/><br>
    Pacjent: <br>
    <form:select path="client">
    <form:option value="0">-- wybierz --</form:option>
    <form:options items="${clients}" itemValue="id" itemLabel="lastName"/></form:select><br>
    <form:errors path="client"/><br>
    Dzień: <br>
    <form:input type="date" path="date"/><br>
    <form:errors path="date"/><br>
    Godzina: <br>
    <form:input type="time" path="time" step="3600"/><br>
    <form:errors path="time"/><br>

    <button type="submit" class="btn btn-success">Zapisz</button>
</form:form>
</body>
</html>
