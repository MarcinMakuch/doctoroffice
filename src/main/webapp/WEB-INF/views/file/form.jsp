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

<form:form method="post" modelAttribute="file" action="/file/upload" enctype="multipart/form-data">
    Select file to upload:
    <br />
    <input type="file" name="file"  />
    <br />
    Description:
    <br />
    <input type="text" name="description" size="44" />
    <br />
    <br />
    <input type="submit" value="Upload" />
    </form>
</form:form>
</body>
</html>
