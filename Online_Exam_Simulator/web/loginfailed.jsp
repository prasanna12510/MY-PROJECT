<%@page errorPage="error.jsp" contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="allstyles.css"/>
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
        <h1>LOGIN FAILED</h1>
        </div>
    </div>  
    </body>
</html>
