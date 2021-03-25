<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dodaj użytkownika</title>
    <link href="<c:url value="/theme/css/sb-admin-2.css"/>" rel="stylesheet">
</head>
<body>
<a href='<c:url value="/user"/>'><button type="button" class="btn btn-light">WRÓĆ</button></a>

<form:form method="post" modelAttribute="user">
    <label>Imię</label><br>
    <form:input path="firstName"/>
    <form:errors path="firstName"/> <br>
    <label>Nazwisko</label><br>
    <form:input path="lastName"/>
    <form:errors path="lastName"/><br>
    <label>Nazwa użytkownika</label><br>
    <form:input path="username"/>
    <form:errors path="username"/><br>
    <label>Hasło</label><br>
    <form:input path="password"/>
    <form:errors path="password"/><br>
    <label>ROLE</label><br>
    <form:input path="role"/>
    <form:errors path="role"/><br>
    <button type="submit" class="btn btn-success">Zapisz</button>
</form:form>
</body>
</html>
