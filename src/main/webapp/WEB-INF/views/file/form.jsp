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
    <form:form method="post" enctype="multipart/form-data" modelAttribute="file">
        Select file to upload:
        <br/>
        <input type="file" name="file"/>
        <br/>
        Pacjent: <br>
        <form:select path="client">
            <form:option value="0">-- wybierz --</form:option>
            <form:options items="${clients}" itemValue="id" itemLabel="lastName"/></form:select><br>
        <form:errors path="client"/><br>
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
                <td><a href="/file/download/${doc.getId()}">Pobierz</a></td>
            </tr>
        </c:forEach>
        </thead>
    </table>
</div>


</body>
</html>
