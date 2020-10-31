/* SELF ASSESSMENT

 1. Did I use easy-to-understand meaningfu,l properly formatted, variable names and CONSTANTS?
        Mark out of 10: 8 
        Comment: i only have one constant
 2. Did I indent the code appropriately?
        Mark out of 5: 4
        Comment:   
 3. Did I implement the mainline correctly with a loop which continues using the user says "no" ?
       Mark out of 10: 
        Comment:  
 4. Did I obtain the relevant inputs from the user and produce the relevant outputs using the specified prompts & formats ?
       Mark out of 10: 10
        Comment:  10
 5. Did I implement the readDoubleFromUser function correctly and in a manner that can be easily understood (4 marks for function definition, 4 marks for function call and 12 marks for function implementation)?
       Mark out of 20: 18
        Comment:  
 6. Did I implement the calculateMonthlyRepayment function correctly in a manner that can be easily understood (4 marks for function definition, 4 marks for function call and 12 marks for function implementation)?
       Mark out of 20: 20
        Comment:  
 7. Did I implement the calculateMonthsToRepayMortgage function correctly in a manner that can be easilyunderstood (4 marks for function definition, 4 marks for function call and 12 marks for function implementation)?
       Mark out of 20: 13
        Comment:  It took me a long time to figure out to create the formula i made
 8. How well did I complete this self-assessment?
        Mark out of 5: 4
        Comment:
 Total Mark out of 100 (Add all the previous marks):87
*/

package week10;

import java.util.Scanner;

public class assignment {
	static Scanner input = new Scanner(System.in);
	public static final int MONTHS_IN_A_YEAR = 12;

	public static void main(String[] args) {
		boolean quit = false;

		do {
			System.out.println("Welcome to the mortgage calculator.");
			double mortgageAmount = readDoubleFromUser("Please enter the  mortgage amount: ");
			double annualInterestRate = readDoubleFromUser("Please enter the annual interest rate(APR): ");

			System.out.println("Assuming a 20 year term, the monthly repayments would be "
					+ calculateMonthlyRepayment(mortgageAmount, 20, annualInterestRate));
//Don't know how to round up. look at it next time
			double payMonthly = readDoubleFromUser("How much can you afford  to pay per month?");

			int monthsToRepayMortgage = calculateMonthsToRepayMortgage(mortgageAmount, payMonthly,
																					annualInterestRate);
			int convertionOfNoMonthsToYears = monthsToRepayMortgage / MONTHS_IN_A_YEAR;
			int remainingMonths = monthsToRepayMortgage % MONTHS_IN_A_YEAR;

			System.out.println("If you pay " + payMonthly + " per month your mortgage would be paid off in "
							+ convertionOfNoMonthsToYears + " years and " + remainingMonths + " months");

			System.out.print("Would you like to use the mortgage calcuator again?(yes/no)");
			if (input.hasNext("no")) {
				quit = true;
			} else if (input.hasNext("yes")) {
				quit = false;
			} else {
				System.out.println("Error!! I will take it as a yes.");
				input.next();
			}
		} while (!quit);
	}

	public static double readDoubleFromUser(String question) {

		while (true) {
			System.out.print(question);

			try {
				double amount = input.nextDouble();
				return amount;
			} catch (java.util.InputMismatchException e) {
				input.next();
			}
		}
	}

	public static double calculateMonthlyRepayment(double principal, int duration, double apr) {

		double denominatorOfEquation = Math.pow((double) ((1 + apr / MONTHS_IN_A_YEAR / 100)),
				((double) -duration * MONTHS_IN_A_YEAR));
		double monthlyRepayment = principal * (apr / MONTHS_IN_A_YEAR / 100) /
																			(1 - denominatorOfEquation);
		return monthlyRepayment;

	}

	public static int calculateMonthsToRepayMortgage(double mortgageAmount, double monthlyRepaid,
			double annualInterest) {
		int monthsToRepay = 1;

		for (int month = 1; mortgageAmount >= 0; month++) {
			mortgageAmount = mortgageAmount
					+ (mortgageAmount * (annualInterest / MONTHS_IN_A_YEAR / 100) - monthlyRepaid);

			monthsToRepay = month;
		}

		return monthsToRepay;
	}

}
