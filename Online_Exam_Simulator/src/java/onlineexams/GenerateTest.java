package onlineexams;

import java.util.*;

public class GenerateTest 
{
    private int subjectId;
    private int [][] questionSet;
    private double unitMarks;
    private int maxMarks, testTime, questionCount;
    
    public GenerateTest(int n)
    {
        this.unitMarks = 1;
        this.maxMarks = n;
        this.testTime = n;
        this.questionCount = n;
    }
    
    public void setSubjectId(int x)
    {
        subjectId = x;
    }
    
    
    private LinkedList<LinkedList<Integer>> fetchAllQuestions()
    {
        LinkedList<LinkedList<Integer>> allQuestionIds= new LinkedList<LinkedList<Integer>>();        
        LinkedList<Integer> topicIds;
        LinkedList<Integer> questions;
        int max, i, currentTopic;
        int availableQuestionCount;
        DBHandler ref;
        
        ref = DBHandler.getInstance();
        topicIds = ref.getTopicIdsSubjectwise(subjectId);
        max = topicIds.size();
        
        availableQuestionCount = 0;

        for(i =0 ; i< max; i++)
        {
            currentTopic = topicIds.get(i).intValue();
            questions = ref.getQuestionIdsTopicwise(currentTopic);
            availableQuestionCount += questions.size();
            allQuestionIds.add(questions);
        }

        if(availableQuestionCount < questionCount)
        {
            questionCount = availableQuestionCount;
            testTime = questionCount;
            unitMarks = (double)maxMarks / questionCount;
        }
        
        //free the topicIds linked list
        topicIds.clear();
        
        return allQuestionIds;
    }

    public void setQuestionPaper()
    {
        LinkedList<LinkedList<Integer>> allQuestionIds;
        int questionsPerTopic;
        int extraQuestionCount;
        int noOfTopics, currentQuestionNo;
        int i, j, indx, max, currentQuestion;
        LinkedList<Integer> topicwiseQuestionList;
        
        //fetch all questions
        allQuestionIds = fetchAllQuestions();

        //generate output matrix
        double temp = Math.sqrt(questionCount);
        int matSize = (int) temp;
        if(temp > matSize)
            matSize++;
        questionSet = new int[matSize][matSize];
        
        
        if(unitMarks == 1)
        {
            noOfTopics = allQuestionIds.size();
            questionsPerTopic =  questionCount / noOfTopics;
            extraQuestionCount = questionCount % noOfTopics;
            currentQuestionNo = 0;


            for(i =0 ; i< noOfTopics; i++)
            {
                topicwiseQuestionList = allQuestionIds.get(i);
                max = topicwiseQuestionList.size();

                if(max < questionsPerTopic)
                {
                    //pass on the difference to extraQuestionCount
                    extraQuestionCount += (questionsPerTopic - max);
                    //select all question
                    while(topicwiseQuestionList.size()> 0)
                    {
                        currentQuestion = topicwiseQuestionList.remove(0).intValue();
                        addQuestionToMatrix(currentQuestion, currentQuestionNo);
                        currentQuestionNo++;
                    }
                }
                else if(max == questionsPerTopic)
                {
                    //select all question
                    while(topicwiseQuestionList.size()> 0)
                    {
                        currentQuestion = topicwiseQuestionList.remove(0).intValue();
                        addQuestionToMatrix(currentQuestion, currentQuestionNo);
                        currentQuestionNo++;
                    }
                }
                else if(max > questionsPerTopic)
                {
                    indx = getStartPoint(max);
                    currentQuestion = topicwiseQuestionList.remove(indx).intValue();
                    //select this question
                    addQuestionToMatrix(currentQuestion, currentQuestionNo);
                    currentQuestionNo++;
                    max--;

                    for(j =1 ; j< questionsPerTopic; j++)
                    {
                        indx = getNextQuestionIndex(indx, max);
                        currentQuestion = topicwiseQuestionList.remove(indx).intValue();
                        //select this question
                        addQuestionToMatrix(currentQuestion, currentQuestionNo);
                        currentQuestionNo++;
                        max--;
                    }
                }
            }//for(i

            //deal with extraQuestion
            LinkedList<Integer> remainingQuestions = new LinkedList<Integer>();
            for(i =0 ; i< allQuestionIds.size(); i++)
            {
                remainingQuestions.addAll(allQuestionIds.get(i));
            }
            allQuestionIds.clear();

            max = remainingQuestions.size();

            indx = getStartPoint(max);
            currentQuestion= remainingQuestions.remove(indx).intValue();
            addQuestionToMatrix(currentQuestion, currentQuestionNo);
            currentQuestionNo++;
            max--;

            while(extraQuestionCount > 0)
            {
                indx = getNextQuestionIndex(indx, max);
                currentQuestion= remainingQuestions.remove(indx).intValue();
                addQuestionToMatrix(currentQuestion, currentQuestionNo);
                currentQuestionNo++;
                max--;
                extraQuestionCount--;
            }
        }
        else
        {//question to go into the question set
            currentQuestionNo  = 0;
            for(i =0; i< allQuestionIds.size(); i++)
            {
                for(j =0; j< allQuestionIds.get(i).size(); j++)
                {
                    addQuestionToMatrix(allQuestionIds.get(i).get(j).intValue() , currentQuestionNo);
                    currentQuestionNo++;
                }
            }
            
        }
    }
    
    private void addQuestionToMatrix(int qid, int currentQuestionNo)
    {
        //convert currentQuestionNo into x, y
        int x, y;
        x = currentQuestionNo/questionSet.length;
        y = currentQuestionNo % questionSet.length;
        //store the qid at x, y
        questionSet[x][y] = qid;
    }
    
    
    private int getStartPoint(int max)
    {
        Random r = new Random();
        return r.nextInt(max); //returns a random int in range 0 to max-1
    }

    private int getNextQuestionIndex(int current, int max)
    {//throws duplicate values
        return (current + current) % max;
    }
}
