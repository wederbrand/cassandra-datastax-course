package playlist.controller;

import playlist.model.CassandraInfo;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * DataStax Academy Sample Application
 *
 * Copyright 2013 DataStax
 *
 */

public class HomeServlet extends HttpServlet {

  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    String javaVersion = System.getProperty("java.version");
    CassandraInfo cassandraInfo = new CassandraInfo();

    request.setAttribute("java_version", javaVersion);
    request.setAttribute("cassandra_info", cassandraInfo);
    getServletContext().getRequestDispatcher("/home.jsp").forward(request,response);

  }
}
