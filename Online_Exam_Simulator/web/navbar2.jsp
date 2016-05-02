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
    else
    {
        
%>
    
    <table bgcolor="#EEEEEE" width = "100%" >
<%
        if(loginType.equalsIgnoreCase("Admin"))
        {
%>
        <tr>
            <td><a href = "getteacherinfo.jsp"> Add Teacher</a> </td>
            <td><a href = "getstudentinfo.jsp"> Add Student</a> </td>
            <td><a href = "manageTeachers.jsp"> Manage Teachers</a> </td>
            <td><a href = "manageStudents.jsp"> Manage Students</a> </td>
            <td><a href = "logout.jsp"> Logout</a> </td>
        
        </tr>
<%
        }
        else if(loginType.equalsIgnoreCase("Teacher"))
        {
%>
        <tr>
            <td><a href = "getSubjectInfo.jsp">Add Subject</a> </td>
            <td><a href = "getTopicInfo.jsp">Add Topic</a> </td>
            <td><a href = "setTopicForQuestions.jsp">Add Questions</a> </td>
            <td><a href = "manageSubjects.jsp">Manage Subjects</a> </td>
            <td><a href = "manageTopics.jsp">Manage Topics</a> </td>
            <td><a href = "viewalltests.jsp">View Questions</a> </td>
            <td><a href = "logout.jsp"> logout</a> </td>
        
        </tr>
<%
        }
        else if(loginType.equalsIgnoreCase("Student"))
        {
%>
        
        <tr>
            <td><a href = "viewtests2.jsp"> View Tests</a> </td>
            <td><a href = "viewprofile.jsp"> View Profile</a> </td>
            <td><a href = "logout.jsp"> logout</a> </td>
        
        </tr>
        
<%
        }
%>
        
    </table>
<%
    }
%>