<!DOCTYPE html>
<%--@elvariable id="username" type="java.lang.String"--%>
<%--@elvariable id="playlist" type="playlist.model.PlaylistDAO"--%>
<%--@elvariable id="playlist_tracks" type="playlist.model.PlaylistDAO.PlaylistTrack"--%>
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

    <script type="text/javascript">
        function listener(event){
           var track_id_input = document.getElementById("track_id") ;
           track_id_input.setAttribute("value", event.data) ;
           addplaylist = document.getElementById("addplaylist").submit();
        }

        if (window.addEventListener){
            addEventListener("message", listener, false)
        } else {
            attachEvent("onmessage", listener)
        }
    </script>


</head>

<body>
<%--Hidden form to post adding the playlist--%>
<form id="addplaylist" style="display: hidden" action="<c:url value="${playlist_tracks}"><c:param name="pl" value="${playlist.playlist_name}"/></c:url>" method="POST">
    <input type="hidden" id="pl" name="pl" value="${playlist.playlist_name}"/>
    <input type="hidden" id="track_id" name="track_id"/>
    <input type="hidden" id="button" name="button" value="addTrack"/>
</form>

<section class="tracks">
    <a href="home">Home</a>
    <a href="<c:url value="login"><c:param name="button" value="logout"/></c:url>">Logout</a> <br/>
    <a href="playlists">Back to My Playlists</a> <br/>
    <h2>Playlist ${playlist.playlist_name} for ${username}</h2>
    <h2>Total length:
        <fmt:formatNumber value="${playlist.playlist_length_in_seconds div 60}" minIntegerDigits="1" maxFractionDigits="0"/>:
        <fmt:formatNumber value="${playlist.playlist_length_in_seconds % 60}" minIntegerDigits="2"/>
    </h2>
    <form id="form1" name="form1" method="get" action="">
    <input type="hidden" name="pl" value="${playlist.playlist_name}"/>
    <div id="playlist_tracks" style="height:auto;width:500px;float:left;">
        <table class="tracktable">
            <tr>
                <th></th>
                <th>Track Name</th>
                <th>Artist</th>
                <th>Genre</th>
                <th>Length (s)</th>
            </tr>
            <c:forEach var="playlistTrack" items="${playlist.playlistTrackList}">
                <tr>
                    <td><button type="submit" name="deleteTrack" value="${playlistTrack.sequence_no}">-</button></td>
                    <td>${playlistTrack.track_name}</td>
                    <td>${playlistTrack.artist}</td>
                    <td>${playlistTrack.genre}</td>
                    <td>
                        <fmt:formatNumber value="${playlistTrack.track_length_in_seconds div 60}" minIntegerDigits="1" maxFractionDigits="0"/>:
                        <fmt:formatNumber value="${playlistTrack.track_length_in_seconds % 60}" minIntegerDigits="2"/>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>

    <div id="picker" style="height:800px;width:800px;">
        <h2>Song Picker: </h2>
        <iframe src="tracks?frame=true" height="auto" width="400"></iframe>
    </div>
    </form>
</section>
</body>
</html>
