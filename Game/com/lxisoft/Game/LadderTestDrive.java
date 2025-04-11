package com.lxisoft.Game;
public class LadderTestDrive
{
	public static void main(String[]args)
	{
		Board board = new Board();
		Cell cells = new Cell();
		Ladder ladders = new Ladder();
		Player players = new Player();
	    Die die = new Die();
	
	for(int i=0; i<5; i++)
		{
		die.throwDie();
		System.out.println(die);
	}
	
	board.createSnakes();
	for(int i=0; i<5; i++)
	{
	System.out.println(board.snakes[i]);
	}
	}
	
}