<!DOCTYPE html>
﻿<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%--

DataStax Academy Sample Application

Copyright 2013 DataStax

--%>

<%--@elvariable id="cassandra_info" type="playlist.model.CassandraInfo"--%>
<%--@elvariable id="java_version" type="java.lang.String"--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en-us">
<head>
    <title>Playlist</title>
    <link rel="shortcut icon" href="images/favicon.png"/>
    <link rel="stylesheet" href="css/playlist.css">
</head>
<body>
	<header>
		<h1>Playlist</h1>
		<img class="dim" src="images/favicon.png"/>
		Welcome to the playlist application. <br/>
		Java version: ${java_version} <br/>
		Cassandra version: ${cassandra_info.cassandraVersion} <br/>
		Cluster name: ${cassandra_info.clusterName}
	</header>

	<section class="menu">
		<h1>Places to Go:</h1>
		<nav>
			<a href="playlists">My Playlists</a>
			<a href="tracks">Visit the Song Database</a>
			<a href="stats">Statistics</a>
		</nav>
	</section>
</body>
</html>
