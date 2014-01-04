<!DOCTYPE html>
<%--@elvariable id="artist" type="java.lang.String"--%>
<%--@elvariable id="genre" type="java.lang.String"--%>
<%--@elvariable id="tracks" type="List"--%>
<%--@elvariable id="frame" type="java.lang.String"--%>
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
    <%@ include file="trackheader.jspf" %>
    <c:choose>
        <c:when test="${not empty genre}">
            <h2>${genre} Songs</h2>
        </c:when>
        <c:when test="${not empty artist}">
            <h2>Songs By ${artist}</h2>
        </c:when>
        <c:otherwise>
            <h2>Click a Genre or Artist Letter Above</h2>
        </c:otherwise>
    </c:choose>

    <script type="text/javascript">
        // When someone clicks the '+' button in the track picker, send a message to the parent window
        function addTrack(id) {
            parent.postMessage(id, '*');
        }
    </script>

    <form id="form1" name="form1" method="post" action="">
        <table class="table">
            <c:forEach var="track" items="${tracks}">
                <tr>
                    <c:if test="${frame == 'true'}">
                        <td class="field_plus"><input type="button" name="add" value="+" onclick="addTrack('${track.track_id}')"/></td>
                    </c:if>
                    <td class="field_track">${track.track}</td>
                    <td class="field_genre">${track.genre}</td>
                    <td class="field_sec">
                        <fmt:formatNumber value="${track.track_length_in_seconds div 60}" minIntegerDigits="1" maxFractionDigits="0"/>:
                        <fmt:formatNumber value="${track.track_length_in_seconds % 60}" minIntegerDigits="2"/>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </form>
</section>
</body>
</html>
