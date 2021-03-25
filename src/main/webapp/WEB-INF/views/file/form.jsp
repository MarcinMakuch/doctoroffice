<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dodaj plik</title>
    <link href="<c:url value="/theme/css/sb-admin-2.css"/>" rel="stylesheet">
</head>
<body>
<a href='<c:url value="/client"/>'>
    <button type="button" class="btn btn-light">WRÓĆ</button>
</a>
<div>
    <form:form method="post" enctype="multipart/form-data" modelAttribute="file">
        Wybierz plik do przesłania:
        <br/>
        <input type="file" class="form-control-file" name="file"/>
        <br/>
        <input type="submit" value="Prześlij"/>
    </form:form>
</div>
<div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
        <thead>
        <tr>
            <th>Id</th>
            <th>Nazwa</th>
            <th>Typ</th>
            <th>Pobieranie</th>
            <th>Usuń</th>
        </tr>
        <c:forEach items="${files}" var="doc">

            <tr>
                <td><c:out value="${doc.id}"/></td>
                <td><c:out value="${doc.fileName}"/></td>
                <td><c:out value="${doc.fileType}"/></td>
                <td><a href="/file/download/${doc.getId()}"><button type="button" class="btn btn-link">Pobierz</button></a></td>
                <td><a href="/file/confirm/${doc.getId()}"><button type="button" class="btn btn-danger">Usuń</button></a></td>
            </tr>
        </c:forEach>
        </thead>
    </table>
        </div>
    </div>
</div>

</body>
</html>
