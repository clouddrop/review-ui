package review

class Review {

static searchable ={
	url index: 'no'
		
}
	//static searchable = true 
    static constraints = {
    }
		  
		  
	int id	  
	String category
	int positive
	int negative
	int total
	String url
	String hash	
}
