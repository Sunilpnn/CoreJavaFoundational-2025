package com.lxisoft.Game;
public class Board 
{
	Cell[] cells = new Cell[100];
	Ladder[] ladders =new Ladder[5];
	Snake[] snakes = new Snake[5];
	Player[] players = new Player[5];
	Die d;
	
	
	public void createSnake()
	{
		Board board = new Board();
		Snake s = new Snake();
		int temp;
		int head;
		int tail;
		boolean repeat = false;
		
		for(int j=0; j<5; j++)
		{

		do{
			 head = (int)(Math.random()*100)+1;
			 tail = (int)(Math.random()*100)+1;
			
			if(tail>head)
			{
				temp = head;
				head = tail;
				tail = temp;
				
			}
			
		for(int i=0; board.snakes[i]!=null; i++)
		{
			if((snakes[i].getHead())==(board.snakes[i].getHead()))
			repeat =  true;
		break;
		}	}
		
	
	
		while(repeat);
		}
		
			
}} 