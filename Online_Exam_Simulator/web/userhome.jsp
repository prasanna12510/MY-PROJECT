<%@page errorPage="error.jsp" contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="allstyles.css"/>
    </head>
    <body>
    <%
    String userId= "";
    try
    {
        userId = session.getAttribute("userId").toString();
    }
    catch(Exception ex)
    {}
    
    if(userId.length() == 0)
    {
        response.sendRedirect("login.jsp");
    }
    %>    
        
    <div id ="outer">
        <div id = "titlebar">
            <jsp:include page="titlebar.jsp"/>
        </div>
        <div id ="navbar">
            <jsp:include page="navbar2.jsp"/>
        </div>
        <div id="pagecontent">
        <h1>USER HOME</h1>
        </div>
    </div>  
    </body>
</html>
