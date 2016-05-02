<%@page errorPage="error.jsp" contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Add Question</title>
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
    <h1>Add Question</h1>
        <%
        //fetch request data and put in session
        String tid;
        tid = request.getParameter("tid");

        if(tid != null)
        {
            session.setAttribute("tid", tid);
        }
        else
        {
            tid = session.getAttribute("tid").toString();
        }
        %>
        
        
        <table width="100%" >
        <form name="f" action="addQuestion.jsp" method="post" onsubmit="return check()" >
            <tr>
                <td> Question</td>
                <td> <textarea name="question"></textarea></td>
                <td> &nbsp;</td>
            </tr>    
            <tr>
                <td> Option 1</td>
                <td> <input type="text" name="options"/></td>
                <td> <input type="radio" name="rad"</td>
            </tr>    
            <tr>
                <td> Option 2</td>
                <td> <input type="text" name="options"/></td>
                <td> <input type="radio" name="rad"</td>
            </tr>    
            <tr>
                <td> Option 3</td>
                <td> <input type="text" name="options"/></td>
                <td> <input type="radio" name="rad"</td>
            </tr>    
            <tr>
                <td> Option 4</td>
                <td> <input type="text" name="options"/></td>
                <td> <input type="radio" name="rad"</td>
            </tr>    
            <tr>
                <td> &nbsp;</td>
                <td> <input type="submit" name="submit" value="Add Question"/></td>
            </tr>    

        </form>
        </table>
    </div>
</div>  
</body>
</html>
