<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dodaj plik</title>
</head>
<body>
<a href='<c:url value="/client"/>'>
    <button>WRÓĆ</button>
</a>
<div>
    <form:form method="post" action="/file/upload" enctype="multipart/form-data">
        Select file to upload:
        <br/>
        <input type="file" name="file"/>
        <br/>
        <input type="submit" value="Upload"/>
    </form:form>
</div>
<div>
    <table border="1">
        <thead>
        <tr>
            <th>Id</th>
            <th>Nazwa</th>
            <th>Typ</th>
            <th>Pobieranie</th>
        </tr>
        <c:forEach items="${files}" var="doc">

            <tr>
                <td><c:out value="${doc.id}"/></td>
                <td><c:out value="${doc.fileName}"/></td>
                <td><c:out value="${doc.fileType}"/></td>
                <td><a href='c:url value=/file/download/${doc.getId()}'><button>Pobierz</button></a></td>
            </tr>
        </c:forEach>
        </thead>
    </table>
</div>


</body>
</html>
