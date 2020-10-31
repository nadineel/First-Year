/* SELF ASSESSMENT
   1. Did I use appropriate easy-to-understand, meaningful variables and CONSTANTS within the code? 
       Mark out of 10:
       Comment: 9
   2. Did I format the variable and CONSTANT names appropriate (in lowerCamelCase and UPPERCASE)?
       Mark out of 5:
       Comment:5
   3. Did I generate the computer's choice in each game correctly using a Random number generator?
       Mark out of 10:
       Comment:8
   4. Did I input the user's choice in each game correctly?
       Mark out of 10:
       Comment:8
   5. Did I correctly compare the choices and update the score appropriately?
       Mark out of 20:
       Comment:18
   6. Did I inform the user of who won each game (and why) correctly?
       Mark out of 10:
       Comment:10
   7. Did I use an appropriate for loop to allow the player to play 5 games?  There should be only one loop.
       Mark out of 20: 
       Comment:17
   8. Did I output the final scores correctly after the 5 games were played. 
       Mark out of 10: 
       Comment:9
   9. How well did I complete this self-assessment?
       Mark out of 5:
       Comment:4
   Total Mark out of 100 (Add all the previous marks):88
*/
package RPS;

import java.util.Random;
import java.util.Scanner;

public class RPS {

	public static void main(String[] args) {

		Scanner input = new Scanner(System.in);
		System.out.println("You have 5 chances to play a game of Rock-Paper-Scissors");

		final int TRIES = 5;
		final int ROCK = 1;
		final int PAPER = 2;
		final int SCISSORS = 3;
		int score = 0;
		int computerWin = 0;
		Random play = new Random();

		for (int counter = 1; counter <= TRIES; counter++) {
			int computerPlay = 1 + play.nextInt(3);
			
			System.out.print("Enter 1 (for Rock) or 2 (for Paper) or 3 (for Scissors):");
			int userPlay = input.nextInt();

			if (userPlay <= 0 || userPlay > 3) {
				System.out.println("Invalid number. Try again.");
				counter--;
			}
			else {
				if (userPlay == computerPlay) {
					if (computerPlay == ROCK) {
						System.out.println("This round was a draw as i picked rock too.");

					}
					else if (computerPlay == PAPER) {
						System.out.println("This round was a draw as i picked paper too.");

					}
					else {
						System.out.println("This round was a draw as i picked scissors too.");

					}
				} 
				else if (userPlay == ROCK && computerPlay == SCISSORS) {
					System.out.println("You won this round as I played scissors.");
					score++;
				}
				else if (computerPlay == ROCK && userPlay == SCISSORS) {
					System.out.println("I won this round as I played rock.");
					computerWin++;
				}
				else if (userPlay > computerPlay) {

					if (computerPlay == ROCK) {
						System.out.println("You won this round as I played rock");
						score++;
					}
					else {
						System.out.println("You won this round as I played paper");
						score++;
					}
				}
				else {
					if (computerPlay == SCISSORS) {
						System.out.println("I won this round as I played scissors");
						computerWin++;
					} 
					else {
						System.out.println("I won this round as I played paper");
						computerWin++;
					}
				}
			}

		}
		System.out.print("Final score was User : " + score + " Computer: " + computerWin);
		input.close();
	}
}