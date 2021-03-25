<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="<c:url value="/theme/css/sb-admin-2.css"/>" rel="stylesheet">
    <title>Dodaj klienta</title>
</head>
<body>
<a href='<c:url value="/client"/>'>
    <button type="button" class="btn btn-light">WRÓĆ</button>
</a>

<form:form method="post" modelAttribute="client">
    <div class="form-group">
        Imie:
        <form:input class="form-control" path="firstName"/>
        <form:errors path="firstName"/>
        Nazwisko:
        <form:input class="form-control" path="lastName"/>
        <form:errors path="lastName"/>
        PESEL:
        <form:input class="form-control" type="number" path="pesel"/>
        <form:errors path="pesel"/>
        Email:
        <form:input class="form-control" path="email"/>
        <form:errors path="email"/>
        Numer telefonu:
        <form:input class="form-control" path="phoneNumber"/>
        <form:errors path="phoneNumber"/>
        Komentarz:
        <form:input class="form-control" path="comments"/>
        <form:errors path="comments"/>
    </div>
    <button type="submit" class="btn btn-success">Zapisz</button>
</form:form>
</body>
</html>
