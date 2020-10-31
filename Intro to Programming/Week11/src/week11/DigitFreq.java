package week11;
import java.util.Scanner;
public class DigitFreq {

	

		public static final int NUMBER_OF_DIGITS = 10;
		public static void main(String[] args) {
			// Initialize frequencies
			int[] digitFrequencies = new int[NUMBER_OF_DIGITS];
			for (int index=0; index<NUMBER_OF_DIGITS; index++)
				digitFrequencies[index]=0;
			while (true)
			{
				Scanner input = new Scanner( System.in );
				System.out.print("Enter a number> ");
				if (input.hasNextInt())
				{
					int number = input.nextInt();
					countDigitFrequencies( number, digitFrequencies );
					printDigitFrequencies( digitFrequencies );
				}
				else input.next();
			}
			
		}
		
		public static void printDigitFrequencies( int[] frequencies )
		{
			System.out.print("Digit Frequencies: ");
			if (frequencies != null)
			{
				boolean commaNeeded = false;
				for (int index=0; index<NUMBER_OF_DIGITS; index++)
					if (frequencies[index] > 0)
					{
						System.out.print( (commaNeeded ? ", ":"") + index + "(" + frequencies[index] + ")" );
						commaNeeded = true;
					}
			}
			System.out.println();
		}
		
		public static void countDigitFrequencies( int number, int[] frequencies )
		{
			int remainingNumber = Math.abs(number);
			do
			{
				int digit = remainingNumber%10;
				remainingNumber /= 10;
				frequencies[digit]++;
			} while (remainingNumber > 0);
		}

	}