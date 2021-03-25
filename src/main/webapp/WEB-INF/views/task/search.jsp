<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    function goBack() {
        window.history.back()
    }
</script>

<html>
<head>
    <title>Wyszukiwanie ... </title>
</head>
<body>

<p>Wizyty dla pacjenta: <%= request.getParameter("question")%></p>
<h3><p><c:out value="${message}"/></p></h3>

<table border="1">
    <thead>
    <tr>
        <th>Rehabilitant</th>
        <th>Pacjent</th>
        <th>Data</th>
        <th>Godzina</th>
    </tr>
    <c:forEach items="${searchbar}" var="search">

        <tr>
            <td><c:out value="${search.user.lastName}"/></td>
            <td><c:out value="${search.client.lastName}"/></td>
            <td><c:out value="${search.date}"/></td>
            <td><c:out value="${search.time}"/></td>
        </tr>
    </c:forEach>
    </thead>
</table>

<div style="color: #3d4877;">
    <button onclick="goBack()">Powrót</button>
</div>

</body>
</html>
