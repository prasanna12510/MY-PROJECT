package onlineexams;
import java.util.LinkedList;

public class Subject 
{
    private String sname;
    
    public void setSname(String s)
    {
        sname = s;
    }
    
    public boolean addSubject()
    {
        DBHandler ref = DBHandler.getInstance();
        return ref.addSubject(sname);
    }
    
    public boolean deleteSubject(int sid)
    {
        DBHandler ref = DBHandler.getInstance();
        return ref.deleteSubject(sid);
    }
    
    public void deleteSubjects(String ids[])
    {
        int i;
        for(i =0; i< ids.length; i++)
        {
            deleteSubject(Integer.parseInt(ids[i]));
        }
    }
    
    public LinkedList<LinkedList<Object>> getAllSubjects()
    {
        DBHandler ref = DBHandler.getInstance();
        return ref.getAllSubjects();
    }
    
    public LinkedList<String> getHeader()
    {
        LinkedList<String> header = new LinkedList<String>();
        header.add("Id");
        header.add("Subject");
        
        return header;
    }
}
