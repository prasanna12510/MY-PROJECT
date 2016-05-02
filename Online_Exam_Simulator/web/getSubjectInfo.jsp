<%@page errorPage="error.jsp" contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Subject</title>
        <link rel="stylesheet" href="allstyles.css"/>

        <script>
            function check()
            {
                var a;
                a = document.f.sname.value;
                a = a.trim();
                
                if(a.length === 0)
                {
                    document.getElementById("divSubjectName").innerHTML= "<b>* Subject Name MISSING</b>";
                    document.getElementById("sname").focus();
                    return false;//block submit
                }
                return true;//allow submit
            }
        </script>
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
        <h1>Add Subject</h1>
        <table width="100%">
            <tr>
                <td> IMAGE HERE </td>
                <td>
                    <form name ="f" method="post" action="registerSubject.jsp" onsubmit="return check()">
                        <table width="50%">
                            <tr>
                                <td>Subject Name</td>
                                <td><input id = "sname" type="text" name ="sname" value=""/> </td>
                                <td><div id="divSubjectName">*</div></td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td><input type="submit" name ="bttnSubmit" value="Register"/> </td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        
                    </form>
                </td>
            </tr>
        </table>
               
        </div>
    </div>  
    </body>
</html>
