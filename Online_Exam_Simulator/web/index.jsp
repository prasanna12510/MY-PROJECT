<%@page errorPage="error.jsp" contentType="text/html" pageEncoding="UTF-8"%>

<%!
 //this will be a member function of the
 //class (servlet) that will generate from
 //the current JSP
 String getProjectHeading()
 {
     return "Online Examination System";
 }
%>
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
        <%--
        <h1> 
        <% 
            String s = getProjectHeading();
            out.println(s);
        %> 
        </h1>
        --%>
        
        <h1><%=getProjectHeading()%></h1>
        </div>
    </div>  
    </body>
</html>
