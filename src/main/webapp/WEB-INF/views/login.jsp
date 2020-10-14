<%--
  Created by IntelliJ IDEA.
  User: lukasz
  Date: 14.10.2020
  Time: 19:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>
    <title>Login</title>
</head>
<body>


<div class="login-page">
    <h2>Welcome</h2>
    <form action="/login" method="post">

        <div class="form-group">
            <label>
                <h4>login</h4>
                <input type="text" name="username" class="input" required autocomplete="off">
            </label>
        </div>

        <div class="form-group">
            <label>
                <h4>hasło</h4>
                <input type="password" name="password" class="input" required autocomplete="off">
            </label>
        </div>
            <div class="form-group--buttons">
                <input type="submit" value="Sign in" class="btn">
            </div>
        <sec:csrfInput/>
    </form>
</div>

</body>
</html>
