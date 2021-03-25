<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<script>
    function goBack() {
        window.history.back()
    }
</script>
<html>
<head>
    <link href="<c:url value="/theme/css/sb-admin-2.css"/>" rel="stylesheet">
    <title>Error Page</title>
</head>
<body>

<%--<div style="color: #3d4877;">
    <h3>Pojawił się błąd</h3>
</div>--%>
<div style="color: #3d4877;">
    <h3>
        <%= exception.getCause().getMessage() %>
    </h3>
</div>
<div style="color: #3d4877;">
    <button onclick="goBack()">Powrót</button>
</div>
</body>
</html>
