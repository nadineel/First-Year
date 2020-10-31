package vertebrate;
import javax.swing.JOptionPane;

public class vertebrate {

	public static void main(String[] args) {
		
		int bloodAnswer= JOptionPane.showConfirmDialog(null,
									"Is this animal cold blooded?" );
		boolean cold = (bloodAnswer == JOptionPane.YES_OPTION);
		
		if (cold) {
			int coverAnswer= JOptionPane.showConfirmDialog(null,
                                            "Does it have moist skin?" );
             boolean cover = (coverAnswer == JOptionPane.YES_OPTION);
		
		  if (cover) 
			  JOptionPane.showMessageDialog(null, "This vertebrae is an amphibian");
		 
		  else 
		  {int finsAnswer= JOptionPane.showConfirmDialog(null,
                                             "Does it have fins?" );
		    boolean fins = (finsAnswer == JOptionPane.YES_OPTION);
		    if (fins)
		    	JOptionPane.showMessageDialog(null,"This vertebrae is a fish");
		    else {
		        JOptionPane.showMessageDialog(null,"This vertebrae is a reptile");
		    
		         }
		  }
       }
		
		
		else {
			int coverAnswer= JOptionPane.showConfirmDialog(null,
                                          "Does it have feathers?" );
            boolean cover = (coverAnswer == JOptionPane.YES_OPTION);
            
          if (cover) {
        	   JOptionPane.showMessageDialog(null,"This vertebrae is a bird.");
          }
        	  else {
        		  JOptionPane.showMessageDialog(null,"This vertebrae is a mammal.");
        	  }
          }
        	  
			
    }
}
