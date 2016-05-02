<%@page errorPage="error.jsp" contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="sub" scope="page" class="onlineexams.Subject"/>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Set Topic</title>
    <link rel="stylesheet" href="allstyles.css"/>

    <script>
        
        var req;

        function fetchTopics()
        {
            var data, url, val;
            try
            {
                val = document.f.sid.value;
                if(val == -1)
                {
                    document.getElementById("topicRegion").innerHTML = "";
                    return;
                }
                req = new XMLHttpRequest();
                data = "sid="+ val;                 
                url = "loadTopicsBySid.jsp";
                req.open("POST",url, true);
                req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                req.onreadystatechange=updateDisplay;
                req.send(data);
            }
            catch(ex)
            {
                alert("Err: " + ex);               
            }
        }
        
        function updateDisplay()
        {
           if(req.readyState === 4)
            {
                if(req.status === 200)
                {
                    var resp = req.responseText;
                    document.getElementById("topicRegion").innerHTML = resp;
                }
            }
        }

        function check()
        {
            if(document.getElementById("topics") == null)
            {
                alert("select a subject that has topics added");
                return false;
            }
            return true;
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
    <h1>Set Topic For Questions</h1>
    <table width="100%">
        <tr>
            <td> IMAGE HERE </td>
            <td>
            <form name ="f" method="post" action="getQuestionInfo.jsp" onsubmit="return check()">
                <table width="50%">
                    <tr>
                        <td>Subject</td>
                        <td>
                            <select name="sid" onchange="fetchTopics()" >
                                <option value ="-1">SELECT</option>
                                <%
                                java.util.LinkedList<java.util.LinkedList<Object>> allSubjects;
                                java.util.LinkedList<Object> current;
                                
                                allSubjects = sub.getAllSubjects();
                                
                                while(allSubjects.size() > 0)
                                {
                                    current = allSubjects.remove(0);
                                    out.println("<option value=\""+ current.get(0).toString()+ "\" > "+ current.get(1).toString()+" </option>");
                                }


                                %>
                            </select>

                        </td>
                        <td>&nbsp;</td>
                        <td>
                            <div id ="topicRegion"></div>
                        <td>
                    </tr>

                    <tr>
                        <td>&nbsp;</td>
                        <td><input type="submit" name ="bttnSubmit" value="Add Questions"/> </td>
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
