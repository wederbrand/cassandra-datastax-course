<!DOCTYPE html>
<%--@elvariable id="error" type="java.lang.String"--%>
<%--

DataStax Academy Sample Application

Copyright 2013 DataStax

--%>
﻿<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Playlist</title>
    <link href="css/playlist.css" rel="stylesheet" type="text/css" />
    <link rel="shortcut icon" href="images/favicon.png" type="image/png"/>

</head>
<body>
<section class="menu small">
  <a href="<c:url value="home"/>">Home</a>
</section>
<c:if test="${not empty error}">
<p class="error">
    </c:if>
    ${error}
</p>
<form id="form1" name="form1" class="login_form" method="post" action="">
    <h1>PLAYLIST LOGIN</h1>
    <p>
        <label for="username">User Name</label>
        <input id="username" type="text" name="username" placeholder="Enter your user name here" required>
    </p>
    <p>
        <label for="password">Password</label>
        <input id="password" type="password" name="password" placeholder="Password" required>
    </p>

    <p>
        <button type="submit" name="button" id="login" value="login">Login</button>
        <button type="submit" name="button" id="register" value="newAccount">I Don't Have an Account</button>
    </p>
</form>

</body>
</html>
