<!DOCTYPE html>
<%--@elvariable id="error" type="java.lang.String"--%>
<%--

DataStax Academy Sample Application

Copyright 2013 DataStax

--%>
﻿<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--@elvariable id="genres" type="java.util.List"--%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Playlist</title>
    <link href="css/playlist.css" rel="stylesheet" type="text/css" />
    <link rel="shortcut icon" href="images/favicon.png" type="image/png"/>

</head>
<body>

<%@ include file="lists.jspf" %>

<section class="menu small">
    <a href="home">Home</a>
</section>
<c:if test="${not empty error}">
<p class="error">
    </c:if>
    ${error}
</p>
<form id="form1" name="form1" class="login_form" method="post" action="tracks">
    <h1>Add A Track</h1>
    <p>
        <label for="music_file">Track Id</label>
        <input id="music_file" type="text" name="music_file" placeholder="Enter the Music File Name" required>
    </p>
    <p>
        <label for="artist">Artist</label>
        <input id="artist" type="text" name="artist" placeholder="Artist name" required>
    </p>
    <p>
        <select id="genre" name="genre">
            <c:forTokens items="${genres}" delims="," var="g">
                <option value="${g}">${g}</option>
            </c:forTokens>
        </select>
        <label for="genre">Genre</label> Genre
    </p>
    <p>
        <label for="track_name">Track Name</label>
        <input id="track_name" type="text" name="track_name" placeholder="Track name" required>
    </p>
    <p>
        <label for="track_length_in_seconds">Track Name</label>
        <input id="track_length_in_seconds" type="text" name="track_length_in_seconds" placeholder="Track Length (s)" required>
    </p>

    <p>
        <button type="submit" name="button" id="addTrack" value="addTrack">Add Track</button>
        <button type="reset" id="reset">Clear Form</button>
    </p>
</form>

</body>
</html>
