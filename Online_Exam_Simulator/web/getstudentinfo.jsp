<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@page errorPage="err.jsp"%>

<html>
  <head>
    <link rel="stylesheet" href="fcol.css">
      
    <title>Register Student</title>
    <script language ="javascript">
        var req;
        
        function validateUserName()
        {
            try
            {
                var x = document.f.uid.value;
                req = new XMLHttpRequest();//object used to exchange data with a server
                var data = "uid="+x;
                var url = "validateUid.jsp";
                req.open("POST", url, true);//specifies the type of request, the URL, and if the request should be handled asynchronously or not.

                //set function to be called automatically each time the readyState property changes
                //readyState Holds the status of the XMLHttpRequest. Changes from 0 to 4: 
                //0: request not initialized 
                //1: server connection established
                //2: request received 
                //3: processing request 
                //4: request finished and response is ready
                
                req.onreadystatechange=updateDisplay;
                req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                req.send(data);//Sends the POST request to the server.

                
            }
            catch(errMsg)
            {
                alert(errMsg);
            }
        }
  
        function updateDisplay()
        {
            
            //status
            //200: "OK"
            //404: Page not found
            if(req.readyState === 4)
            {
                if(req.status === 200)
                {
                    var resp = req.responseText; //get the response data as a string
                    if(resp.length > 0)
                    {
                        document.getElementById("resultUidChk").innerHTML = resp;
                    }
                }
            }
        }
        
        function chk()
        {
            var nm, em, ph, uid, ps, reps, flg;
            
            nm = document.f.name.value;
            em = document.f.email.value;
            ph = document.f.phone.value;
            
            uid = document.f.uid.value;
            ps = document.f.pass.value;
            reps = document.f.repass.value;
            flg = document.f.flag.value;
            
            if(nm.length === 0 || em.length === 0 || ph.length === 0 || uid.length === 0 || ps.length === 0 || reps.length === 0)
            {
                alert("Data missing ");
                return false;
            }
            else if(ps !== reps)
            {
                alert("Password/ReEntered Password Mismatch");
                return false;
            }
            else if(ps.length < 6)
            {
                alert("Password must be min 6 characters in length");
                return false;
            }            
            else if(flg === "false")
            {
                alert("This UserName is Not Available");
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
      <h2>Enter Student Information </h2>
      <form name="f" action="addstudent.jsp" method="POST" onsubmit="return chk()">
        <table border="0" align="center" width="75%">
            <tr>
                <td>Name</td>
                <td><input type="text" name="name" value="" width="100" /> </td>
            </tr>
            
            <tr>
                <td>Email</td>
                <td><input type="email" name="email" value="" width="100" /></td>
            </tr>
            <tr>
                <td>Phone</td>
                <td><input type="text" name="phone" value="" width="100" /></td>
            </tr>
            
            <tr>
                <td>
                    &nbsp;
                </td>
            </tr>
            
            <tr>
                <td>ID</td>
                <td>
                    <input type="text" name="uid" value="" width="100" onblur="validateUserName()" />
                    <div id="resultUidChk"></div>
                </td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input type="password" name="pass" value="" width="100" /></td>
            </tr>
            <tr>
                <td>ReEnter Password</td>
                <td><input type="password" name="repass" value="" width="100" /></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td><input type="submit" value="Register" name="bttnSubmit" /></td>
            </tr>
        </table>
    </form>

    </div>
</div>  
</body>
</html>
