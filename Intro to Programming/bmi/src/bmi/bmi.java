package bmi;
import javax.swing.JOptionPane;
import java.util.Scanner;
public class bmi {

	public static void main(String[] args) {
		
		String weightInput= JOptionPane.showInputDialog("weight in kg:");
		Scanner weightScanner = new Scanner(weightInput);
		double weight = weightScanner.nextDouble();
		String heightInput= JOptionPane.showInputDialog("height in metres:");
		Scanner heightScanner = new Scanner(heightInput);
		double height = heightScanner.nextDouble();
		
		double bmi = weight/(height*height);
		JOptionPane.showMessageDialog(null, "bmi is "+ bmi);
		
		heightScanner.close();
		weightScanner.close();
		



	}

}
