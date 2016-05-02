<%@page import="java.util.concurrent.LinkedBlockingDeque"%>
<%
String sid = request.getParameter("sid");
onlineexams.DBHandler ref = onlineexams.DBHandler.getInstance();
java.util.LinkedList<String[]> topics;
topics = ref.getTopicsSubjectIdWise(Integer.parseInt(sid));
String arr[];

if(topics.size() == 0)
{
    out.println(" No Topics Added ");
}
else
{
    out.println(" Topics ");
    out.println("<td> <select id = \"topics\" name =\"tid\" >");
    while(topics.size() > 0)
    {
        arr = topics.remove(0);
        out.println("<option value=\""+ arr[0]+"\" > "+ arr[1]+" </option>");
    }

    out.println("</select> </td>");
}
%>