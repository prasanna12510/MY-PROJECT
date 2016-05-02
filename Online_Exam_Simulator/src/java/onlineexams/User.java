package onlineexams;

import java.util.LinkedList;

public class User 
{
    private String name, email, phone;
    private String uid, pass, utype;
    
    public User()
    {}
    
    public void setName(String s)
    {
        name = s;
    }
    
    public void setEmail(String s)
    {
        email = s;
    }
    
    public void setPhone(String s)
    {
        phone = s;
    }
    
    public void setUid(String s)
    {
        uid = s;
    }
    
    public void setPass(String s)
    {
        pass = s;
    }
    
    public void setUtype(String s)
    {
        utype = s;
    }
    
    public boolean addUser()
    {
        DBHandler ref = DBHandler.getInstance();
        return ref.addUser(name, email, phone, uid, pass, utype);
    }
    
    public boolean deleteUser(int userid)
    {
        DBHandler ref = DBHandler.getInstance();
        return ref.deleteUser(userid);
    }
    
    public void deleteUsers(String ids[])
    {
        int i;
        for(i =0; i< ids.length; i++)
        {
            deleteUser(Integer.parseInt(ids[i]));
        }
    }
    
    public LinkedList<LinkedList<Object>> getUsersCategorywise(String utype)
    {
        DBHandler ref = DBHandler.getInstance();
        return ref.getUsersCategorywise(utype);
    }
    
    public LinkedList<String> getHeader()
    {
        LinkedList<String> header = new LinkedList<String>();
        header.add("Id");
        header.add("Name");
        header.add("Email");
        header.add("Phone");
        
        return header;
    }
    
}

