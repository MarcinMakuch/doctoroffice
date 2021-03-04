<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dodaj klienta</title>
</head>
<body>
<a href='<c:url value="/client"/>'>
    <button>WRÓĆ</button>
</a>

<form:form method="post" modelAttribute="client">
    Imie:
    <br>
    <form:input path="firstName"/>
    <form:errors path="firstName"/> <br>
    Nazwisko:
    <br>
    <form:input path="lastName"/>
    <form:errors path="lastName"/><br>
    PESEL:
    <br>
    <form:input type="number" path="pesel"/><br>
    <form:errors path="pesel"/><br>
    Email:
    <br>
    <form:input path="email"/><br>
    <form:errors path="email"/><br>
    Numer telefonu:
    <br>
    <form:input path="phoneNumber"/><br>
    <form:errors path="phoneNumber"/><br>
    Komentarz:
    <br>
    <form:input path="comments"/><br>
    <form:errors path="comments"/><br>
    <button type="submit">Zapisz</button>
</form:form>
</body>
</html>
