<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Usuwanie pliku</title>
</head>
<body>
<h4>Potwierdź usunięcie pliku</h4>
<a href='<c:url value="/file/remove/${file.getId()}"/>'><button>TAK</button></a>
<a href='<c:url value="/client"/>'><button>NIE</button></a>
</body>
</html>