<%
    
    String uid = request.getParameter("uid");

    onlineexams.DBHandler ref = onlineexams.DBHandler.getInstance();
    int result = ref.getId(uid);
    if(result == -1 && uid.length() > 0)
    {
        out.println("<b>User Name Available</b>");
        out.println("<input type = \"hidden\" name = \"flag\" value = \"true\">");
    }
    else
    {
        out.println("<b>User Name Not Available</b>");
        out.println("<input type = \"hidden\" name = \"flag\" value = \"false\">");
    }
%>