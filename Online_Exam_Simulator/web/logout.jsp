<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page errorPage="err.jsp"%>

<html>
  <head>
    <link rel="stylesheet" href="fcol.css">
      
    <title>Logout</title>

  </head>
  <body>

<div id ="outer">
    <div id = "titlebar">
        <jsp:include page="titlebar.jsp"/>
    </div>
    <div id ="navbar">
        <jsp:include page="navbar1.jsp"/>
    </div>
    <div id="pagecontent">
        <%
            session.invalidate();
        %>

        <h2>You have successfully logged out of the system</h2>

    </div>
</div>  

</body>
</html>
