package onlineexams;

public class Validator 
{
    private String txtUserName;
    private String txtPassword;
    
    public Validator()
    {}
    
    public void setTxtUserName(String val)
    {
        //any process on val
        txtUserName = val;
    }
    
    public void setTxtPassword(String val)
    {
        //any process on val
        txtPassword = val;
    }
    
    public String [] validateIt()
    {
      return DBHandler.getInstance().validateLogin(txtUserName, txtPassword);
    }
  
}
