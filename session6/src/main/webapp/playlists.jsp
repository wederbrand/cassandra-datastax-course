<!DOCTYPE html>
<%--@elvariable id="username" type="java.lang.String"--%>
<%--@elvariable id="playlist_names" type="java.util.List"--%>
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
</head>
<body>
<section class="menu small">
    <a href="home">Home</a>
    <a href="<c:url value="login"><c:param name="button" value="logout"/></c:url>">Logout</a> <br/>
    <h2>Playlists for ${username}</h2>

    <form id="form1" class="playlist_form" name="form1" method="post" action="">
    <label for="pl">New Playlist Name</label>
        <input id="pl" type="text" name="pl"/>
        <input type="submit" name="button" id="add" value="Add" />
        <br/>

    <table>
        <c:forEach var="playlist_name" items="${playlist_names}">
            <tr>
                <td>
                    <a href="<c:url value="playlists"><c:param name="button" value="deletePlaylist"/><c:param name="pl" value="${playlist_name}"/></c:url>">-</a>
                </td>
                <td>
                    <a href="<c:url value="playlist_tracks"><c:param name="pl" value="${playlist_name}"/></c:url>">${playlist_name}</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    </form>
</section>
</body>
</html>
