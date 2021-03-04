<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Doctor Office</title>
</head>
<body>
<div>
    <p><a href="<c:url value="/user"/>" name="">
        <button>Użytkownicy</button>
    </a></p>

    <p><a href="<c:url value="/client"/>" name="">
        <button>Pajcenci</button>
    </a></p>

    <p><a href="<c:url value="/task"/>" name="">
        <button>Wizyty</button>
    </a></p>
</div>

<%--<c:forEach var="category" items="${categories}" varStatus="status">
       <c:if test="${status.last}">${category.id}</c:if>
    </c:forEach>--%>

<div>

</div>
<div>
    <%--<table border="1">
        <c:forEach items="${lastFive}" var="item">
            <tr>
                <td>${item.id}</td>
                <td>${item.title}</td>
                <td>${item.author}</td>
                <td>${item.content}</td>
            </tr>
        </c:forEach>
    </table>--%>
</div>
</body>
</html>
