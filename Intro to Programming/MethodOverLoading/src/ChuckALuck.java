/* SELF ASSESSMENT 
1. ResolveBet

I have correctly defined ResolveBet which takes the bet type (String) and the Wallet object, and a void return type [Mark out of 7: 7].
Comment:yes i did
My program presents the amount of cash in the wallet and asks the user how much he/she would like to bet [Mark out of 8:8 ].
Comment:yes
My program ensures the bet amount is not greater than the cash in the wallet [Mark out of 5: 3].
Comment:not sure if I implemented this correctly
My program creates three Dice objects, rolls them and creates a total variable with a summation of the roll values returned [Mark out of 15:15 ]..
Comment:yes it does
My program determines the winnings by comparing the bet type with the total and comparing the bet type with the dice faces for the triple bet [Mark out of 20:20 ].
Comment:yes it does
My program outputs the results (win or loss) and adds the winnings to the wallet if user wins or removes the bet amount from the wallet if the user loses [Mark out of 10:10 ].
Comment:yes it does

2. Main

I ask the user for the amount of cash he/she has, create a Wallet object and put this cash into it [Mark out of 15:15 ]
Comment:yes
My program loops continuously until the user either enters quit or the cash in the wallet is 0 [Mark out of 5:2 ]
Comment:It does but it still asks what bet the player wants and then ends the game/
I ask the user to enter any of the four bet types or quit [Mark out of 5:5 ].
Comment:yes
My program calls resolveBet for each bet type entered [Mark out of 5:5 ].
Comment:yes
At the end of the game my program presents a summary message regarding winnings and losses [Mark out of 5:2 ]
Comment:not sure if I output what was expected. I just showed my initial and final earnings from the game in the end

 Total Mark out of 100 (Add all the previous marks):92
*/

import java.util.Scanner;

public class ChuckALuck {

	public static void main(String[] args) {
		Scanner input = new Scanner(System.in);
		Wallet myMoney = new Wallet();

		boolean quit = false;
		double myCash = 0;
		System.out.print("How much do you have?");

		if (input.hasNextDouble()) {
			myCash = input.nextDouble();
			myMoney.put(myCash);

			while (!quit) {
				System.out.println(
						"Place your bet. \"Triple\", \"Field\", \"High\", or \"Low\"" + "\n Or enter \"quit\" to exit");
				if (input.hasNext("quit")) {
					quit = true;
				} else {
					if (input.hasNext("Triple") || input.hasNext("Field") || input.hasNext("High")
							|| input.hasNext("Low")) {
						String myBet = input.next();

						if (myMoney.check() > 0) {
							ResolveBet(myBet, myMoney);
							if (myMoney.check() <= 0) {
								quit = true;
							}
						}

					} else {
						System.out.println("Wrong input! Try again");
						input.next();
					}
				}

			}
			System.out.println("Initial amount in wallet: €" + myCash + "\nAfter the game: " + myMoney.toString());
		} else {
			System.out.println("Invalid input.");
		}
	}

	public static void ResolveBet(String bet, Wallet object) {
		Scanner input2 = new Scanner(System.in);
		System.out.println("Amount of money remaining in your wallet: €" + object.check());

		System.out.println("How much would you like to bet?");
		if(input2.hasNextDouble()) {
		double bettingMoney = input2.nextDouble();
		
		if (bettingMoney <= object.check()) {
			object.get(bettingMoney);
			Dice dice1 = new Dice();
			Dice dice2 = new Dice();
			Dice dice3 = new Dice();
			int diceTotal = dice1.roll() + dice2.roll() + dice3.roll();
			boolean triple = ((dice1.topFace() == dice2.topFace()) && dice2.topFace() == dice3.topFace()
					&& (diceTotal / 3 != 1 || diceTotal / 18 != 1));
			if (bet.equals("Triple")) {
				if (triple) {
					object.put(bettingMoney * 30 + bettingMoney);
					System.out.println("You won! 30:1 " + object.toString());
				} else {

					System.out.println("You lost the bet " + object.toString());
				}
			} else if (bet.equals("Field")) {
				if (diceTotal < 8 || diceTotal > 12) {
					object.put(bettingMoney * 2);
					System.out.println("You won 1:1 " + object.toString());
				} else {

					System.out.println("You lost the bet " + object.toString());
				}
			} else if (bet.equals("High")) {
				if (diceTotal > 10) {
					object.put(bettingMoney * 2);
					System.out.println("You won 1:1 " + object.toString());
				} else {

					System.out.println("You lost the bet " + object.toString());
				}
			} else if (bet.equals("Low")) {
				if (diceTotal < 11) {
					object.put(bettingMoney * 2);
					System.out.println("You won 1:1 " + object.toString());
				} else {

					System.out.println("You lost the bet " + object.toString());
				}
			}

		} else {
			System.err.println("Bet is less than your money in your wallet. Try again");
		}
		}
		else {
			System.err.println("Wrong input in the bet!");
		}
	}
}
