<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Wyszukiwanie ... </title>
</head>
<body>


<table border="1">
    <thead>
    <tr>
        <th>Rehabilitant</th>
        <th>Pacjent</th>
        <th>Data</th>
        <th>Godzina</th>
    </tr>
    <c:forEach items="${searchname}" var="search">

        <tr>
            <td><c:out value="${search.user.lastName}"/></td>
            <td><c:out value="${search.client.lastName}"/></td>
            <td><c:out value="${search.date}"/></td>
            <td><c:out value="${search.time}"/></td>
        </tr>
    </c:forEach>
    </thead>
</table>

</body>
</html>
