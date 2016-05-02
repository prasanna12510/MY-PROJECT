package onlineexams;

import java.util.*;

public class PatternwiseReader 
{
 int mat[][];
 
 LinkedList<Integer> readLeftToRight(int row, int colFrom, int colTo)
 {
     int i;
     LinkedList<Integer> temp = new LinkedList<Integer>();
     for(i =colFrom; i<colTo; i++ )
     {
        if(mat[row][i] == 0)
             continue;
        temp.add(new Integer(mat[row][i]));
     }
     return temp;
 }
 
 LinkedList<Integer> readRightToLeft(int row, int colFrom, int colTo)
 {
     int i;
     LinkedList<Integer> temp = new LinkedList<Integer>();
     for(i =colFrom; i>=colTo; i-- )
     {
         if(mat[row][i] == 0)
             continue;
         temp.add( new Integer(mat[row][i]));
     }
     return temp;
 }

 LinkedList<Integer> readTopToBottom(int rowFrom, int rowTo, int col)
 {
     int i;
     LinkedList<Integer> temp = new LinkedList<Integer>();
     for(i =rowFrom; i<rowTo; i++ )
     {
        if(mat[i][col] == 0)
            continue;
        temp.add(new Integer(mat[i][col]));
     }
     return temp;
 }
 
 LinkedList<Integer> readBottomToTop(int rowFrom, int rowTo, int col)
 {
     int i;
     LinkedList<Integer> temp = new LinkedList<Integer>();
     for(i =rowFrom; i>=rowTo; i-- )
     {
         if(mat[i][col] == 0)
             continue;
         temp.add( new Integer(mat[i][col]));
     }
     return temp;
 }
 
 LinkedList<Integer> readDiagonalF(int x, int y)
 {
     int i,j;
     LinkedList<Integer> temp = new LinkedList<Integer>();
     
     for(i=x, j=y; i>=y; i--,j++ )
     {
        if(mat[i][j] == 0)
             continue;
        temp.add(new Integer(mat[i][j]));
     }
     return temp;
 }

 LinkedList<Integer> readDiagonalG(int x, int y)
 {
     int i,j, cnt;
     LinkedList<Integer> temp = new LinkedList<Integer>();
     
     for(i=x, j = y, cnt = 0; cnt < mat.length-x-y; cnt++, i++,j++ )
     {
        if(mat[i][j] == 0)
             continue;
        temp.add(new Integer(mat[i][j]));
     }
     return temp;
 }

 LinkedList<Integer> getQuestionsPatternAwise()
 {
     LinkedList<Integer> questions = new LinkedList<Integer>();
     LinkedList<Integer> temp;
     
     int i;
     for(i =0 ; i<= mat.length/2; i++)
     {
         temp = readLeftToRight(i, i, mat.length-i);// row, colFrom, colTo
         questions.addAll(temp);
         temp = readTopToBottom(i+1, mat.length-i, mat.length-i-1);//rowFrom ,rowTo, col
         questions.addAll(temp);
         temp = readRightToLeft(mat.length -i-1, mat.length-i-2, i);//row, colFrom, colTo
         questions.addAll(temp);
         temp = readBottomToTop(mat.length-i-2, i+1, i);//rowFrom, rowTo, col
         questions.addAll(temp);
     }
     
     return questions;
 }

 LinkedList<Integer> getQuestionsPatternBwise()
 {
     LinkedList<Integer> questions = new LinkedList<Integer>();
     LinkedList<Integer> temp;
     
     int i;
     for(i=0;i< mat.length; i++)
     {
         if(i%2 == 0)
         {
            temp = readBottomToTop(mat.length-1,0,i); //rowFrom, rowTo, int col
            questions.addAll(temp);
         }
         else
         {
            temp = readTopToBottom(0, mat.length,i);// rowFrom, rowTo, col
            questions.addAll(temp);
         }
     }
     
     return questions;


 }

 LinkedList<Integer> getQuestionsPatternCwise()
 {

    LinkedList<Integer> questions = new LinkedList<Integer>();
    LinkedList<Integer> temp;
     
    int i;
    for(i=0;i< mat.length; i++)
    {
        if(i%2 == 0)
        {
            temp = readLeftToRight(i,0, mat.length); //row, colFrom, colTo
            questions.addAll(temp);
         }
         else
         {
            temp = readRightToLeft(i, mat.length-1,0);// row, colFrom, colTo
            questions.addAll(temp);
         }
     }
     
     return questions;


 }

 LinkedList<Integer> getQuestionsPatternDwise()
 {
     LinkedList<Integer> questions = new LinkedList<Integer>();
     LinkedList<Integer> temp;
     
     int i;
     for(i =0 ; i< mat.length; i++)
     {
         temp = readLeftToRight(i, 0, mat.length);// row, colFrom, colTo
         questions.addAll(temp);
     }
     
     return questions;

 }

 LinkedList<Integer> getQuestionsPatternEwise()
 {
    LinkedList<Integer> questions = new LinkedList<Integer>();
    LinkedList<Integer> temp;
     
    int i;
    for(i =0 ; i<= mat.length/2; i++)
    {
        temp = readTopToBottom(i, mat.length-i, i);//rowFrom ,rowTo, col
        questions.addAll(temp);    
        temp = readLeftToRight(mat.length-i-1, i+1, mat.length-i);// row, colFrom, colTo
        questions.addAll(temp);               
        temp = readBottomToTop(mat.length-i-2, i, mat.length-i-1);//rowFrom, rowTo, col
        questions.addAll(temp);
        temp = readRightToLeft(i, mat.length-i-2, i+1);//row, colFrom, colTo
        questions.addAll(temp);
        
    }
     
    return questions;
 
 }

 LinkedList<Integer> getQuestionsPatternFwise()
 {
     LinkedList<Integer> questions = new LinkedList<Integer>();
     LinkedList<Integer> temp;
     
     int i;
     for(i =0 ; i< mat.length; i++)
     {
         temp = readDiagonalF(i, 0);//x,y
         questions.addAll(temp);
     }
     for(i =1 ; i< mat.length; i++)
     {
         temp = readDiagonalF(mat.length-1, i);//x,y
         questions.addAll(temp);
     }
     return questions;
 }

 LinkedList<Integer> getQuestionsPatternGwise()
 {
     LinkedList<Integer> questions = new LinkedList<Integer>();
     LinkedList<Integer> temp;
     
     int i;
     for(i =mat.length-1 ; i>=0; i--)
     {
         temp = readDiagonalG(0,i);//x,y
         questions.addAll(temp);
     }
     for(i =1 ; i< mat.length; i++)
     {
         temp = readDiagonalG(i, 0);//x,y
         questions.addAll(temp);
     }
     return questions;

 }

 LinkedList<Integer> getQuestionsPatternHwise()
 {
     LinkedList<Integer> questions = new LinkedList<Integer>();
     LinkedList<Integer> temp;
     
     int i;
     for(i =0 ; i< mat.length; i++)
     {
         temp = readTopToBottom(0, mat.length,i);// rowFrom, rowTo, col
         questions.addAll(temp);
     }
     
     return questions;

 }

 public LinkedList<Integer> getQuestionsPatternwise(int mat[][], int x)
 {
  this.mat = mat;
  switch(x)
  {
   case 0:
    return getQuestionsPatternAwise();
   case 1:
    return getQuestionsPatternBwise();
   case 2:
    return getQuestionsPatternCwise();
   case 3:
    return getQuestionsPatternDwise();
   case 4:
    return getQuestionsPatternEwise();
   case 5:
    return getQuestionsPatternFwise();
   case 6:
    return getQuestionsPatternGwise();
   case 7:
    return getQuestionsPatternHwise();
   default:
    return null;// illegal case number
  }//switch
  
 }//getQuestionsPatternwise()

}
