<%@page errorPage="error.jsp" contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="top" scope="page" class="onlineexams.Topics"/>
<jsp:setProperty name="top" property="*"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Topic</title>
        <link rel="stylesheet" href="allstyles.css"/>

    </head>
    <body>
    <%
    String userId= "";
    String loginType= "";
    try
    {
        userId = session.getAttribute("userId").toString();
        loginType = session.getAttribute("loginType").toString();
    }
    catch(Exception ex)
    {}
    
    if(userId.length() == 0 || loginType.length() == 0)
    {
        response.sendRedirect("login.jsp");
        return;
    }
    if(!loginType.equalsIgnoreCase("Teacher"))
    {
        response.sendRedirect("login.jsp");
        return;
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
        <%
           if(top.addTopic())
           {
               out.println("<h1>Topic Added</h1>");
           }
           else
           {
               out.println("<h1>Topic Registeration Failed</h1>");
           }
        %>
        
            
        </div>
    </div>  
    </body>
</html>
