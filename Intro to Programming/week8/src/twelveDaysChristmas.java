/* SELF ASSESSMENT
   1. Did I use appropriate CONSTANTS instead of numbers within the code?
       Mark out of 5:5
   2. Did I use easy-to-understand, meaningful CONSTANT names formatted correctly in UPPERCASE?
       Mark out of 5:4
   3. Did I use easy-to-understand meaningful variable names formatted properly (in lowerCamelCase)?
       Mark out of 10:8
   4. Did I indent the code appropriately?
       Mark out of 10:10
   5. Did I use an appropriate loop (or loops) to produce the different verses?
       Mark out of 20: 15
   6. Did I use a switch to build up the verses?
       Mark out of 25: 25
   7. Did I avoid duplication of code and of the lines which make up the verses (each line should be referred to in the code only once (or twice))?
       Mark out of 10: 10
   8. Does the program produce the correct output?
       Mark out of 10: 10
   9. How well did I complete this self-assessment?
       Mark out of 5:4
   Total Mark out of 100 (Add all the previous marks):91
*/
package tutor;

public class twelveDaysChristmas {

	public static void main(String[] args) {
		final int DAYS_IN_SONG = 12;
		String secondLineOfSong = "My true love sent to me:";

		String numberDays = "";
		int verse = 1;
		for (int day = 1; day <= DAYS_IN_SONG && verse <= DAYS_IN_SONG; day++) {

			switch (day) {
			case 1:
				numberDays = "first";
				break;
			case 2:
				numberDays = "second";
				break;
			case 3:
				numberDays = "third";
				break;
			case 4:
				numberDays = "fourth";
				break;
			case 5:
				numberDays = "fifth";
				break;
			case 6:
				numberDays = "sixth";
				break;
			case 7:
				numberDays = "seventh";
				break;
			case 8:
				numberDays = "eighth";
				break;
			case 9:
				numberDays = "ninth";
				break;
			case 10:
				numberDays = "tenth";
				break;
			case 11:
				numberDays = "eleventh";
				break;
			case 12:
				numberDays = "twelfth";
				break;
			default:
				break;

			}
			System.out.println("On the " + numberDays + "\n" + secondLineOfSong);
		

		switch (verse) {
		case 12:
			System.out.println("12 Drummers Drumming ");
		case 11:
			System.out.println("Eleven Pipers Piping ");
		case 10:
			System.out.println("Ten Lords a Leaping ");
		case 9:
			System.out.println("Nine Ladies Dancing ");
		case 8:
			System.out.println("Eight Maids a Milking ");
		case 7:
			System.out.println("Seven Swans a Swimming ");
		case 6:
			System.out.println("Six Geese a Laying ");
		case 5:
			System.out.println("Five Golden Rings ");
		case 4:
			System.out.println("Four Calling Birds");
		case 3:
			System.out.println("Three French Hens ");
		case 2:
			System.out.println("Two Turtle Doves\r\n" + "and a Partridge in a Pear Tree. \n");
			verse++;
			break;
		case 1:
			System.out.println("A Partridge in a Pear Tree.\n");
			verse++;
			break;
		default:
			break;
		}
	}
}
}