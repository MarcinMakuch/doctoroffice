<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Usuwanie wizyty</title>
</head>
<body>
<h4>Potwierdź usunięcie wizyty</h4>
<a href='<c:url value="/task/remove/${task.getId()}"/>'><button>TAK</button></a>
<a href='<c:url value="/task"/>'><button>NIE</button></a>
</body>
</html>
