
public class DiceGame{
	Player player1;
	Player player2;
	Dice dice;
	
	public DiceGame(Player player1, Player player2, Dice dice)
	{
		this.player1= player1;
		this.player2= player2;
		this.dice = dice;
	}
	
	
	public void startGame()
	{
		System.out.println("\t\t\t Welcome To The Dice Game ");
		
		int round= 5;
		
		for(int i= 0; i<round; i++)
		{
			
			System.out.println("\nRound " + (i+1));
			
			player1.diceroll(dice);
			player2.diceroll(dice);

		}
		
		System.out.println("\nGame Over!");
        System.out.println(player1.getName() + " Score: " + player1.getScore());
        System.out.println(player2.getName() + " Score: " + player2.getScore());

		if(player1.getScore() > player2.getScore())
		{
			System.out.println(player1.getName() + " win");
		}
		else {
			System.out.println(player2.getName() + " win");
		}
		
		if(player1.getScore() == player2.getScore())
		{
			System.out.println("draw match");
		}
		
	}
}