package onlineexams;

import java.util.*;

public class Topics 
{
    private String topicName;
    private int sid;
    
    public void setTopicName(String s)
    {
        topicName = s;
    }
    
    public void setSid(int q)
    {
        sid = q;
    }
    
    public boolean addTopic()
    {
        DBHandler ref = DBHandler.getInstance();
        return ref.addTopic(topicName, sid);
    }
    
    LinkedList<Integer> getTopicIdsSubjectwise(int subId)
    {
        DBHandler ref =  DBHandler.getInstance();
        LinkedList<Integer> topicIds = ref.getTopicIdsSubjectwise(subId);
        return topicIds;
    }
    
    
    public boolean deleteTopic(int tid)
    {
        DBHandler ref = DBHandler.getInstance();
        return ref.deleteTopic(tid);
    }
    
    public void deleteTopics(String ids[])
    {
        int i;
        for(i =0; i< ids.length; i++)
        {
            deleteTopic(Integer.parseInt(ids[i]));
        }
    }
    
    public LinkedList<LinkedList<Object>> getAllTopics()
    {
        DBHandler ref = DBHandler.getInstance();
        return ref.getAllTopics();
    }
    
    public LinkedList<String> getHeader()
    {
        LinkedList<String> header = new LinkedList<String>();
        header.add("Id");
        header.add("Topic");
        header.add("Subject");
        
        return header;
    }
    
}
