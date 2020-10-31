package week11;

import java.util.Scanner;

public class highscores {
   public static void main(String[] args) {
      Scanner inputScanner = new Scanner(System.in);
      System.out.println("How many scores do you want to maintain? ");
      if (!inputScanner.hasNextInt()) {
         System.out.println("Invalid Input! Please try again ");
         System.exit(0);												//to end it
      }

      int inputCounter = inputScanner.nextInt();
      if (inputCounter <= 0) {
         System.out.println("Invalid Input!");
         System.exit(0);
      }

      int[] highScoreArray = new int[inputCounter];						// the length of array
      initialiseHighScore(highScoreArray, inputCounter);
      int counter = 0;

      while(counter < highScoreArray.length) {
         System.out.println("Input score: ");
         if (!inputScanner.hasNextInt()) {
            System.out.println("Invalid Input!");
            System.exit(0);
         } else {
            counter++;
            int inputNumber = inputScanner.nextInt();
            if (higherThan(inputNumber, highScoreArray)) {
               insertScore(inputNumber, highScoreArray, inputCounter);
            } else {
               inputCounter--;
            }
         }
      }

      printHighScores(highScoreArray, inputCounter);
      inputScanner.close();
   }

   public static void initialiseHighScore(int[] highScoreArray, int inputCounter) {
    
      if (highScoreArray != null) {
    	  for(int index=0; index<inputCounter;index++) {
    		 highScoreArray[index]=0; 
        
         }

      }
   }

   public static void printHighScores(int[] highScoreArray, int inputCounter) {
      if (inputCounter == 1) {
         System.out.print("The high score is ");
      } else {
         System.out.print("The high scores are ");
      }

      System.out.print(highScoreArray[0]);

      for(int index = 1; index < inputCounter; index++) {
         System.out.print(", " + highScoreArray[index]);
      }

      System.out.print(".");
   }

   public static boolean higherThan(int inputNumber, int[] highScoreArray) {
     

      boolean isHigher=false;
      for( int counter = 0; /*isHigher &&*/ counter < highScoreArray.length; counter++) {
         if (inputNumber > highScoreArray[counter]) {
            isHigher = true;
         }
      }

      return isHigher;
   }

   public static void insertScore(int inputNumber, int[] highScoreArray, int inputCounter) {
      int counter;
      for(counter = 0; inputNumber < highScoreArray[counter]; counter++) {     //goes out if input number> the elements in the array
      }

      if (highScoreArray[counter] != 0) {
         for(int previousCounter = inputCounter - 2/*bc we need previous c and fact that array starts at 0*/;
        		 								previousCounter >= counter; previousCounter--) {
            highScoreArray[previousCounter + 1] = highScoreArray[previousCounter]; 						//shifts to the left
         }
      }

      highScoreArray[counter] = inputNumber;
   }
}