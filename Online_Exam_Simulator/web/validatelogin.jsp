<jsp:useBean id="v" scope="page" class="onlineexams.Validator"/>
<jsp:setProperty name="v" property="*"/>

  
<%
    String arr[] = v.validateIt();
    if(arr != null)
    {
        session.setAttribute("userId", arr[0]);
        session.setAttribute("loginType", arr[1]);
//We use response.encodeURL or reponse.encodeRedirectURL
//so that the session id used to identify 
//users session object at the server side
//is appended to the URL and not stored as
//client side cookie.
//This allows session management even in case
//the browser doesnt support cookie writing at all.        
        response.sendRedirect( response.encodeRedirectURL("userhome.jsp"));
    }
    else
    {
        response.sendRedirect(response.encodeRedirectURL("loginfailed.jsp"));
    }
%>

<%--

<jsp:useBean id="v" scope="page" class="onlineexams.Validator"/>

useBean is an action tag that either 
creates a new object or gets handle to 
an existing object.

It will create a new object if object
with matching id, scope and class doesnt
exist.
Otherwise it gets handle to the existing
object.

--------------------------------------------

setproperty is an action tag that 
implicitly calls set properties of 
specified java bean.

Learn by example

case 1: 
<jsp:setProperty name="v" property="*"/>
Reads all request parameters and uses the
data to call all matching set properties
of the java bean.

case 2: 
<jsp:setProperty name="v" property="userName"/>
Reads request parameter "userName" and uses the
data to call set property "userName"
of the java bean.

case 3:
<jsp:setProperty name="v" param="uname" property="userName"/>
Reads request parameter "uname" and use the
data to call set property "userName"
of the java bean.

case 4:
<jsp:setProperty name="v" property="userName" value = "guest"/>
Uses explicit data "guest" to call set
property "userName".
Doesnt use any request parameter.

--%>