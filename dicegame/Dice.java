public class Dice{
	private int result;
	
	public int getResult(){
		return result;
	}
	
	public void setResult(int result){
		this.result = result; 
	}
	
	
	public int roll(){
		 result = (int)(Math.random()*6)+1;
		 return result;
	}
	public String toString(){
		return "Results"+ result;
	}
}