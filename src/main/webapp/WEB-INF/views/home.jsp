<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="<c:url value="/theme/css/sb-admin-2.css"/>" rel="stylesheet">
    <title>Doctor Office</title>
    <head>
        <title>Strona logowania</title>
    </head>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">Logo</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="<c:url value="/user"/>">Użytkownicy<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="<c:url value="/client"/>">Pajcenci<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="<c:url value="/task"/>">Wizyty<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="<c:url value="/logout"/>">Wyloguj<span class="sr-only">(current)</span></a>
            </li>
        </ul>
        <form:form action="/task/search" method="get" class="form-inline my-2 my-lg-0">
            <input type="text" name="question" class="form-control mr-sm-2" placeholder="Search" aria-label="Search">
            <button type="submit" class="btn btn-outline-success my-2 my-sm-0">Szukaj</button>
        </form:form>
    </div>
</nav>

</div>
<h3><p><c:out value="${message}"/></p></h3>
Dzisiejsze wizyty
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
                </tr>
            </c:forEach>
            </thead>
        </table>
    </div>
</div>

</body>
</html>

<%--<div>
    <div>
        <p><a href="<c:url value="/user"/>">
            <button type="button" class="btn btn-light">Użytkownicy</button>
        </a></p>
    </div>
    <div>
        <p><a href="<c:url value="/client"/>">
            <button type="button" class="btn btn-light">Pajcenci</button>
        </a></p>
    </div>
    <div>
        <p><a href="<c:url value="/task"/>">
            <button type="button" class="btn btn-light">Wizyty</button>
        </a></p>
    </div>
    <div>
        <p><a href="<c:url value="/logout"/>">
            <button type="button" class="btn btn-light">Wyloguj</button>
        </a></p>
    </div>--%>
<%--
<div>
    <form:form action="/task/search" method="get" class="form-inline my-2 my-lg-0">
        <input type="text" name="question" class="form-control mr-sm-2" placeholder="Search" aria-label="Search">
        <button type="submit" class="btn btn-outline-success my-2 my-sm-0">Szukaj</button>
    </form:form>
</div>--%>
