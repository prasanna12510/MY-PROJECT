<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page errorPage="err.jsp"%>

<jsp:useBean id="stud"  class="onlineexams.User" scope="page" />
<jsp:setProperty name="stud" property="*" />
<jsp:setProperty name="stud" property="utype" value="Student" />


<html>
    <head>
        <link rel="stylesheet" href="fcol.css">
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Registration</title>
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
    if(!loginType.equalsIgnoreCase("admin"))
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

          if(stud.addUser())
          {    
            out.println("Student Registration Success");
          }
          else
          {
            out.println("Student Registration Failed");
          }
        %>

    </div>
</div>  


</body>
</html>
