//Backend
package onlineexams;

import java.sql.*;
import java.util.LinkedList;

public class DBHandler 
{
    private static DBHandler flag = null;
    
    private Connection conn;
    
    private final PreparedStatement pstmtValidateLogin;
    
    private final PreparedStatement pstmtAddSubject, pstmtGetAllSubjects, pstmtGetSubject, pstmtDeleteSubject;
    private final PreparedStatement pstmtAddTopic, pstmtGetAllTopics, pstmtGetTopic, pstmtGetTopicIdsSubjectwise, pstmtDeleteTopic, pstmtDeleteTopicSubjectwise;
    private final PreparedStatement pstmtGetQuestionIdsTopicwise;
    private final PreparedStatement pstmtAddUser, pstmtGetUsersCategorywise, pstmtDeleteUser;
    private final PreparedStatement pstmtAddLogin, pstmtDeleteLogin;
    private final PreparedStatement pstmtGetId;    
    private final PreparedStatement pstmtGetTopicsSubjectIdWise;
    
    private DBHandler() throws Exception
    {
        String driver, url, username, password;
        
        driver = "oracle.jdbc.OracleDriver";
        url = "jdbc:oracle:thin:@//localhost:1521/xe";

        username = "onlineexams";
        password = "data99";
        
        //load the database drivers in memory
        Class.forName(driver);
        //make connection
        conn = DriverManager.getConnection(url, username, password);
        //define prepared statements
        pstmtValidateLogin = conn.prepareStatement("select userid, logintype from login where lower(loginname) = lower(?) and loginpass = ? ");
                
        pstmtAddSubject = conn.prepareStatement("insert into subjects values(?,?)");
        pstmtGetAllSubjects = conn.prepareStatement("select * from subjects");
        pstmtGetSubject = conn.prepareStatement("select * from subjects where subjectid = ?");
        pstmtDeleteSubject = conn.prepareStatement("delete from subjects where subjectid = ?");
    
        pstmtAddTopic = conn.prepareStatement("insert into topics values (?,?,?)");
        pstmtGetAllTopics = conn.prepareStatement("select * from topics");
        pstmtGetTopic = conn.prepareStatement("select * from topics where topicid = ?");
        pstmtGetTopicIdsSubjectwise = conn.prepareStatement("select topicId from topics where subjectid = ? order by topicid");
        pstmtDeleteTopic = conn.prepareStatement("delete from topics where topicid = ?");
        pstmtDeleteTopicSubjectwise = conn.prepareStatement("delete from topics where subjectid = ?");
        
        pstmtGetQuestionIdsTopicwise = conn.prepareStatement("select qid from questions where topicid = ? order by qid");
       
        pstmtAddUser = conn.prepareStatement("insert into users values (?,?,?,?)");
        pstmtDeleteUser = conn.prepareStatement("delete from users where userid = ?");
        pstmtGetUsersCategorywise = conn.prepareStatement("select * from users where userid in (select userid from login where logintype = ?)");
        
        pstmtAddLogin = conn.prepareStatement("insert into login values (?,?,?,?)");
        pstmtDeleteLogin = conn.prepareStatement("delete from login where userid = ?");
                
        pstmtGetId = conn.prepareStatement("select userid from login where loginname = ?");
        pstmtGetTopicsSubjectIdWise = conn.prepareStatement("select topicid, topicname from topics where subjectid = ?");
                
    
    }//DBHandler()

    public static DBHandler getInstance()
    {
        try
        {
            if(flag == null)
                flag = new DBHandler();

            return flag;
        }
        catch(Exception ex)
        {
            return null;
        }
    }
    
    public String[] validateLogin(String lName, String lPass)
    {
        String arr[] = null;
        try
        {
            pstmtValidateLogin.setString(1, lName);
            pstmtValidateLogin.setString(2, lPass);
            ResultSet rs = pstmtValidateLogin.executeQuery();
            
            if(rs.next())
            {//login success
             //fetch userId and loginType
                arr = new String[2];
                arr[0] = rs.getString(1);//userId
                arr[1] = rs.getString(2);//loginType
            }
            rs.close();
            return arr;
        }
        catch(SQLException ex)
        {
            System.out.println(ex);
        }
        return arr;
    }
    
    int getNextId(String colName, String tableName)
    {//lookup approach to auto generate ids
        
        int id = 1;
        try
        {
            Statement s = conn.createStatement();
            String sql = "select max("+ colName +") from "+ tableName;
            ResultSet rs = s.executeQuery(sql);
            if(rs.next())
            {//data fetched
                id = rs.getInt(1);//get val from col 1
                id++;
            }
            rs.close();
            s.close();
        }
        catch(SQLException ex)
        {}
        return id;
        
    }

    public boolean addSubject(String subjectName)
    {
        try
        {
            int subjectid = getNextId("subjectid", "subjects");

            pstmtAddSubject.setInt(1, subjectid);
            pstmtAddSubject.setString(2, subjectName);
            pstmtAddSubject.executeUpdate();

            return true;
        }
        catch(SQLException ex)
        {
            return false;
        }
    }
    
    public boolean deleteSubject(int subjectId)
    {
        try
        {
            if(deleteTopicSubjectwise(subjectId))
            {
                pstmtDeleteSubject.setInt(1, subjectId);
                pstmtDeleteSubject.executeUpdate();
                return true;
            }
            return false;
        }
        catch(SQLException ex)
        {
            return false;
        }
    }
    
    public LinkedList<LinkedList<Object>> getAllSubjects()
    {
        LinkedList<LinkedList<Object>> allData = new LinkedList<LinkedList<Object>>();
        try
        {
            ResultSet rs = pstmtGetAllSubjects.executeQuery();

            LinkedList<Object> colList;
            int i, colCount;
            colCount = rs.getMetaData().getColumnCount();
            
            while(rs.next())
            {
                colList = new LinkedList<Object>();
                for(i =1; i<= colCount; i++)
                {
                    colList.add(rs.getObject(i));//get data from col i in Object form.
                }
                allData.add(colList);
            }//while
            rs.close();
        }
        catch(SQLException ex)
        {
            System.out.println("Err in getAllSubjects " + ex);
        }
        return allData;
    }
    
    public LinkedList<Object> getSubject(int subjectId)
    {
        LinkedList<Object> data = new LinkedList<Object>();
        try
        {
            pstmtGetSubject.setInt(1, subjectId);
            ResultSet rs = pstmtGetSubject.executeQuery();

            int i, colCount;
            colCount = rs.getMetaData().getColumnCount();
            
            if(rs.next())
            {
                for(i =1; i<= colCount; i++)
                {
                    data.add(rs.getObject(i));//get data from col i in Object form.
                }
            }//if
            rs.close();
        }
        catch(SQLException ex)
        {
            System.out.println("Err in getSubject " + ex);
        }
        return data;
    }
    
    public boolean addTopic(String topicName, int subjectId)
    {
        try
        {
            int topicid = getNextId("topicid", "topics");
            
            pstmtAddTopic.setInt(1, topicid);
            pstmtAddTopic.setString(2, topicName);
            pstmtAddTopic.setInt(3, subjectId);
            
            pstmtAddTopic.executeUpdate();
            
            return true;
        }
        catch(SQLException ex)
        {
            return false;
        }
    }
    
    public boolean deleteTopic(int topicId)
    {
        try
        {
            pstmtDeleteTopic.setInt(1, topicId);
            pstmtDeleteTopic.executeUpdate();
            return true;
        }
        catch(SQLException ex)
        {
            return false;
        }
    }

    public boolean deleteTopicSubjectwise(int subjectId)
    {
        try
        {
            pstmtDeleteTopicSubjectwise.setInt(1, subjectId);
            pstmtDeleteTopicSubjectwise.executeUpdate();
            return true;
        }
        catch(SQLException ex)
        {
            return false;
        }
    }

    public LinkedList<LinkedList<Object>> getAllTopics()
    {
        LinkedList<LinkedList<Object>> allData = new LinkedList<LinkedList<Object>>();
        try
        {
            ResultSet rs = pstmtGetAllTopics.executeQuery();

            LinkedList<Object> colList;
            int i, colCount;
            colCount = rs.getMetaData().getColumnCount();
            
            while(rs.next())
            {
                colList = new LinkedList<Object>();
                for(i =1; i<= colCount; i++)
                {
                    colList.add(rs.getObject(i));//get data from col i in Object form.
                }
                allData.add(colList);
            }//while
            rs.close();
        }
        catch(SQLException ex)
        {
            System.out.println("Err in getAllTopics " + ex);
        }
        return allData;
    }
    
    public LinkedList<Object> getTopic(int topicId)
    {
        LinkedList<Object> data = new LinkedList<Object>();
        try
        {
            pstmtGetTopic.setInt(1, topicId);
            ResultSet rs = pstmtGetTopic.executeQuery();

            int i, colCount;
            colCount = rs.getMetaData().getColumnCount();
            
            if(rs.next())
            {
                for(i =1; i<= colCount; i++)
                {
                    data.add(rs.getObject(i));//get data from col i in Object form.
                }
            }//if
            rs.close();
        }
        catch(SQLException ex)
        {
            System.out.println("Err in getTopic " + ex);
        }
        return data;
    }

    public LinkedList<Integer> getTopicIdsSubjectwise(int subjectId)
    {
        LinkedList<Integer> allData = new LinkedList<Integer>();
        try
        {
            pstmtGetTopicIdsSubjectwise.setInt(1, subjectId);
            ResultSet rs = pstmtGetTopicIdsSubjectwise.executeQuery();

            while(rs.next())
            {
                allData.add(new Integer(rs.getInt(1)));
            }//while
            rs.close();
        }
        catch(SQLException ex)
        {
            System.out.println("Err in getTopicsSubjectwise " + ex);
        }
        return allData;
    }
    
    public LinkedList<Integer> getQuestionIdsTopicwise(int topicId)
    {
        LinkedList<Integer> allData = new LinkedList<Integer>();
        try
        {
            pstmtGetQuestionIdsTopicwise.setInt(1, topicId);
            ResultSet rs = pstmtGetQuestionIdsTopicwise.executeQuery();

            while(rs.next())
            {
                allData.add(new Integer(rs.getInt(1)));
            }//while
            rs.close();
        }
        catch(SQLException ex)
        {
            System.out.println("Err in getQuestionIdsTopicwise " + ex);
        }
        return allData;
    }

    public boolean addUser(String name, String email, String phone, String uid, String pass, String utype)
    {
        try
        {
            int userid = getNextId("userid", "users");
            
            pstmtAddUser.setInt(1, userid);
            pstmtAddUser.setString(2, name);
            pstmtAddUser.setString(3, email);
            pstmtAddUser.setString(4, phone);
            pstmtAddUser.executeUpdate();

            pstmtAddLogin.setInt(1, userid);
            pstmtAddLogin.setString(2, uid);
            pstmtAddLogin.setString(3, pass);
            pstmtAddLogin.setString(4, utype);
            pstmtAddLogin.executeUpdate();
            
            return true;
        }
        catch(SQLException ex)
        {
            return false;
        }
    }
    
    public boolean deleteUser(int userId)
    {
        try
        {
            pstmtDeleteLogin.setInt(1, userId);
            pstmtDeleteLogin.executeUpdate();
            
            pstmtDeleteUser.setInt(1, userId);
            pstmtDeleteUser.executeUpdate();
            return true;
        }
        catch(SQLException ex)
        {
            return false;
        }
    }

    
    public LinkedList<LinkedList<Object>> getUsersCategorywise(String uType)
    {
        LinkedList<LinkedList<Object>> allData = new LinkedList<LinkedList<Object>>();
        try
        {
            pstmtGetUsersCategorywise.setString(1, uType);
            ResultSet rs = pstmtGetUsersCategorywise.executeQuery();

            LinkedList<Object> colList;
            int i, colCount;
            colCount = rs.getMetaData().getColumnCount();
            
            while(rs.next())
            {
                colList = new LinkedList<Object>();
                for(i =1; i<= colCount; i++)
                {
                    colList.add(rs.getObject(i));//get data from col i in Object form.
                }
                allData.add(colList);
            }//while
            rs.close();
        }
        catch(SQLException ex)
        {
            System.out.println("Err in getUsersCategorywise " + ex);
        }
        return allData;
    }

    public int getId(String uid)
    {
        int id = -1;
        try
        {
            pstmtGetId.setString(1, uid);
            ResultSet rs = pstmtGetId.executeQuery();
            if(rs.next())
            {
                id = rs.getInt(1);
            }
            rs.close();
        }
        catch(SQLException ex)
        {
            System.out.println("Error in getId " + ex);
        }
        return id;
    }    

    public LinkedList<String[]> getTopicsSubjectIdWise(int sid)
    {
        LinkedList<String[]> allData = new LinkedList<String[]>();
        try
        {
            pstmtGetTopicsSubjectIdWise.setInt(1, sid);
            ResultSet rs = pstmtGetTopicsSubjectIdWise.executeQuery();
            String arr[];
            while(rs.next())
            {
                arr = new String[2];
                arr[0] = rs.getString(1);//topicID
                arr[1] = rs.getString(2);//topicName
                allData.add(arr);
            }
            
            rs.close();
        }
        catch(SQLException ex )
        {
            System.out.println(ex);
        }
        return allData;
    }
}//DBHandler
