package week11;
import java.util.Scanner;
public class tryStudentAgain {

public static void main(String[] args) {
		
		boolean end = false;
		double[] marks = null;
		
		do
		{
			System.out.print("Enter a student percentage >> ");
			Scanner input = new Scanner( System.in );
				if (input.hasNextDouble())
				{
					double[] newMarks = new double[(marks==null)? 1:marks.length+1]; 
					//initially there's a space in the new marks because of this condition
					newMarks[newMarks.length - 1] = input.nextDouble();
					//the inputs will always go to newMarks first, it is then copied to the marks
					
					if (marks != null)
						System.arraycopy(marks, 0, newMarks, 0, marks.length);
					
					marks = newMarks;
					//initially, newMarks.length is copies to marks 
					int numberOfFirstClassHonours = countFirstClassHonours(marks);
					
					System.out.println( numberOfFirstClassHonours + " student" + ((numberOfFirstClassHonours== 1)?"":"s")
							+ " obtained first class honours. " + "The highest mark was: " + determineBestMark(marks) + "%." );
				}
				else
				{
					System.out.println( "Invalid input. Please enter a valid double. ");
				}
				input.close();
		}
		while (!end);
	}
	
	public static double determineBestMark( double[]marks )
	{
		double bestMark = 0;
		for ( double markToCheck : marks )
		{
			if ( markToCheck > bestMark )
				bestMark = markToCheck;
		}
		return( bestMark );
	}
	
	public static int countFirstClassHonours( double[]marks )
	{
		int numberOfFirstClassHonours = 0;
		
		for ( double markToCheck : marks )
		{
			if ( markToCheck >= 70 )
				numberOfFirstClassHonours++;
		}
		return ( numberOfFirstClassHonours );
	}

}