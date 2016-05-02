<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    <script>
        function checkLoginForm()
        {
            var a, b;
            a = document.getElementById("txtUserName").value;
            b = document.getElementById("txtPassword").value;
            
            a = a.trim();
            b = b.trim();
            
            if(a.length === 0)
            {
                alert("UserName Missing");
                return false;
            }
            else if(b.length === 0)
            {
                alert("Password Missing");
                return false;
            }
            return true;
        }
    </script>
    <body>
    <div id ="outer">
        <div id = "titlebar">
            <jsp:include page="titlebar.jsp"/>
        </div>
        <div id ="navbar">
            <jsp:include page="navbar1.jsp"/>
        </div>
        <div id="pagecontent">
            <form name="f" action="validatelogin.jsp" method="post" onsubmit="return checkLoginForm()" >
                <table>
                    <tr>
                        <td> Username </td>
                        <td> <input type="text" id = "txtUserName" name ="txtUserName" /></td>
                        <td> *</td>
                    </tr>
                    <tr>
                        <td> Password </td>
                        <td> <input type="password" id ="txtPassword" name ="txtPassword" /></td>
                        <td> *</td>
                    </tr>
                    
                    <tr>
                        <td> &nbsp; </td>
                        <td> <input type="submit" name ="bttnSubmit" value = "LOGIN" /></td>
                        <td> &nbsp;</td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
        
    </body>
</html>
