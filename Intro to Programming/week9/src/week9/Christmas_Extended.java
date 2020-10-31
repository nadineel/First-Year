/* SELF ASSESSMENT
 1. Did I use easy-to-understand meaningful,l properly formatted, variable names and CONSTANTS?
        Mark out of 10:7
        Comment:   
 2. Did I implement the getVerse function correctly and in a manner that can be understood (5 marks for function definition, 5 marks for function call and 15 marks for function implementation)?
       Mark out of 25:18
        Comment:  I am not too sure if I have implemented the function correctly or as expected but it worked.
 3. Did I implement the getChristmasGift function correctly using a switch statement and in a manner that can be understood (5 marks for function definition, 5 marks for function call and 15 marks for function implementation)?
       Mark out of 25: 20
        Comment:  I tried using just plain = for my cases but it didnt work. I am still figuring out why += worked for it.
 4. Did I implement the getOrdinalString function correctly using if or conditional operators and in a manner that can be understood (5 marks for function definition, 5 marks for function call and 15 marks for function implementation)?
       Mark out of 25:25
        Comment:  
 5. Does the program produce the output correctly?
       Mark out of 10:10
        Comment:  
 6. How well did I complete this self-assessment?
        Mark out of 5:5
        Comment: 
 Total Mark out of 100 (Add all the previous marks):85
*/
package week9;

public class Christmas_Extended {

	public static final int DAYS_IN_SONG = 12;
	static int giftPart = 1;

	public static void main(String[] args) {

		for (int dayOfChristmas = 1; dayOfChristmas <= DAYS_IN_SONG && giftPart <= DAYS_IN_SONG; dayOfChristmas++) {
			System.out.print(getVerse(dayOfChristmas));
		}
	}
	
	
	

	public static String getVerse(int dayOfChristmas) {
		String song = "";
		song = "On the " + getOrdinalString(dayOfChristmas) + " day of Christmas \nMy true love Sent to me:\n"
				+ getChristmasGift(dayOfChristmas);
		return song;
	}

	public static String getChristmasGift(int dayOfChristmas) {
		String giftOfDay = "";
		switch (giftPart) {
		case 12:
			giftOfDay += "12 Drummers Drumming,\n";
		case 11:
			giftOfDay += "Eleven Pipers Piping,\n";
		case 10:
			giftOfDay += "Ten Lords a Leaping,\n";
		case 9:
			giftOfDay += "Nine Ladies Dancing,\n";
		case 8:
			giftOfDay += "Eight Maids a Milking,\n";
		case 7:
			giftOfDay += "Seven Swans a Swimming,\n";
		case 6:
			giftOfDay += "Six Geese a Laying,\n";
		case 5:
			giftOfDay += "Five Golden Rings,\n";
		case 4:
			giftOfDay += "Four Calling Birds,\n";
		case 3:
			giftOfDay += "Three French Hens,\n";
			;
		case 2:
			giftOfDay += "Two Turtle Doves,\r\n" + "and a Partridge in a Pear Tree.\n\n";
			giftPart++;
			break;
		case 1:
			giftOfDay += "A Partridge in a Pear Tree.\n\n";
			giftPart++;
			break;
		default:
			break;
		}
		return giftOfDay;
	}

	public static String getOrdinalString(int dayOfChristmas) {

		String dayLyric = null;
		if (dayOfChristmas <= DAYS_IN_SONG) {
			if (dayOfChristmas == 1) {
				dayLyric = "first";
			} else if (dayOfChristmas == 2) {
				dayLyric = "second";
			} else if (dayOfChristmas == 3) {
				dayLyric = "third";
			} else if (dayOfChristmas == 4) {
				dayLyric = "fourth";
			} else if (dayOfChristmas == 5) {
				dayLyric = "fifth";
			} else if (dayOfChristmas == 6) {
				dayLyric = "sixth";
			} else if (dayOfChristmas == 7) {
				dayLyric = "seventh";
			} else if (dayOfChristmas == 8) {
				dayLyric = "eighth";
			} else if (dayOfChristmas == 9) {
				dayLyric = "ninth";
			} else if (dayOfChristmas == 10) {
				dayLyric = "tenth";
			} else if (dayOfChristmas == 11) {
				dayLyric = "eleventh";
			} else {
				dayLyric = "twelfth";
			}
		}
		return dayLyric;
	}
}
