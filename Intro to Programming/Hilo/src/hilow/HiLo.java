/* SELF ASSESSMENT
   1. Did I use appropriate CONSTANTS instead of numbers within the code?
       Mark out of 5:5
       Comment:
   2. Did I use easy-to-understand, meaningful CONSTANT names formatted correctly in UPPERCASE?
       Mark out of 5:5
       Comment:
   3. Did I use easy-to-understand meaningful variable names?
       Mark out of 10:8
       Comment: 
   4. Did I format the variable names properly (in lowerCamelCase)?
       Mark out of 5:3
       Comment: 
   5. Did I indent the code appropriately?
       Mark out of 10:5
       Comment: 
   6. Did I use an appropriate loop to allow the user to enter their guesses until they win or lose?
       Mark out of 20: 20
       Comment: 
   7. Did I check the input to ensure that invalid input was handled appropriately?
       Mark out of 10: 9
       Comment: 
   8. Did I generate the cards properly using random number generation (assuming all cards are equally likely each time)?
       Mark out of 10: 10
       Comment: 
   9. Did I output the cards correctly as 2, 3, 4, ... 9, 10, Jack, Queen, King?
       Mark out of 10: 10
       Comment: 
   10. Did I report whether the user won or lost the game before the program finished?
       Mark out of 10:10
       Comment: 
   11. How well did I complete this self-assessment?
       Mark out of 5:5
       Comment: 
   Total Mark out of 100 (Add all the previous marks):94
*/
package hilow;
import java.util.Scanner;
import java.util.Random;

public class HiLo {

	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);
		Random generator = new Random(); 			//declaring a random

		final int JACK = 11;
		final int QUEEN = 12;
		final int KING = 13;
		final int ACE = 14;

		int card = 2 + generator.nextInt(13);		//generator from 0-12
		boolean correct = true;
		int guess = 1;

		while (correct && guess <= 4) {

			int nextCard = 2 + generator.nextInt(13);

			if (card == JACK) {
				System.out.println("The card is a Jack.");
			} 
			else if (card == QUEEN) {
				System.out.println("The card is a Queen.");
			} 
			else if (card == KING) {
				System.out.println("The card is a King.");
			} 
			else if (card == ACE) {
				System.out.println("The card is an Ace.");
			} 
			else {
				System.out.println("The card is a " + card);
			}

			System.out.print("Do you think the next card will be higher, lower or equal?");

			if (input.hasNext("higher") || input.hasNext("lower") || input.hasNext("equal")) {
				if (input.hasNext("higher")) {
					if (card < nextCard) {
						guess++;
					} 
					else {
						correct = false;
					}
					input.next();
				} 
				else if (input.hasNext("lower")) {
					if (card > nextCard) {
						guess++;
					} 
					else {

						correct = false;
					}
					input.next();
				} 
				else if (input.hasNext("equal")) {
					if (card == nextCard) {
						guess++;
					} 
					else {

						correct = false;
					}
					input.next();
				}

			} 
			else {
				System.out.print("Invalid answer");
				correct = false;
			}
			card = nextCard;

		}
		if (correct) {
			System.out.println("Congratulations.  You got them all correct.");
		} 
		else {
			System.out.println("Better luck next time!");

			if (card == JACK) {
				System.out.println("The card was a Jack.");
			} 
			else if (card == QUEEN) {
				System.out.println("The card was a Queen.");
			} 
			else if (card == KING) {
				System.out.println("The card was a King.");
			} 
			else if (card == ACE) {
				System.out.println("The card was an Ace.");
			} 
			else {
				System.out.println("The card was a " + card);
			}
		}
		input.close();
	}
}
