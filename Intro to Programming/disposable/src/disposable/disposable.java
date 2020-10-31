/* SELF ASSESSMENT
   1. Did I use easy-to-understand meaningful variable and CONSTANT names? 
       Mark out of 10:
       Comment: 7
   2. Did I format the variable and CONSTANT names properly (in lowerCamelCase and UPPERCASE_WITH_UNDERSCORES)?
       Mark out of 10:
       Comment: 10
   3. Did I indent the code appropriately?
       Mark out of 10:
       Comment: 7
   4. Did I read the input correctly from the user using appropriate questions?
       Mark out of 15:
       Comment: 14
   5. Did I computer the disposable income and disposable income percentage correctly, and output it in the correct format?
       Mark out of 15:
       Comment: 15
  6. Did I use an appropriate series of if statements to generate the income analysis to the user?
       Mark out of 25:
       Comment: 20
   7. Did I provide the correct output for each possibility in an easy to read format?
       Mark out of 10:
       Comment: 9
   8. How well did I complete this self-assessment?
       Mark out of 5:
       Comment: 4
   Total Mark out of 100 (Add all the previous marks):86
*/
package disposable;
import java.util.Scanner;
public class disposable {
	
	public static void main(String[] args) {
    	
		Scanner input = new Scanner(System.in); 
		System.out.print("How much are you paid a month before tax?");
		double beforetax = input.nextDouble();
		System.out.print("rent?");
		double rent = input.nextDouble();
		System.out.print("transport?");
		double transport = input.nextDouble();
		System.out.print("food?");
		double food = input.nextDouble();
		
		final double TAX = 0.35;
		final double PERCENT = 100.0;
		
		double disposableincome = (beforetax - beforetax * TAX - rent - transport - food) ;
		double salary = (disposableincome / beforetax * PERCENT);
		int roundedsalary = (int) Math.round(salary);
		
		System.out.println("Your monthly disposable income is €" + disposableincome +
				                        " which is " + roundedsalary + "% of your salary.");
		
		input.close();
		
		final double AVGINCOME = 500.0;
		
		boolean morethanavg = (disposableincome>AVGINCOME);
		
		if (morethanavg){
			boolean muchmorethanavg = (disposableincome > AVGINCOME*0.5 + AVGINCOME);
			if (muchmorethanavg) {
				System.out.println("You have much more than the average disposable"
						                                             + " income per month.");
			}
			else {
				System.out.println("You have more than the average disposable income"
						                                                    + " per month.");
			}
		}
		else {
			boolean noincome = (disposableincome <= 0);
			if(noincome) {
				System.out.println("You have no disposable income");
			}
			else {
				boolean muchlessthanavg = (disposableincome < AVGINCOME - AVGINCOME*0.5);
				if (muchlessthanavg) {
					System.out.println("You have much less than the average "
							                                      + "disposable per month.");
				}
				else {
					System.out.println("You have less than the average "
							                                      + "disposable per month.");
				}
			}
			}
            
 }
}