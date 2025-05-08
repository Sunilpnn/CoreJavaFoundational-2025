package com.lxisoft.Game;
public class Board
{
	Cell[] cells = new Cell[100];
	Ladder[] ladders =new Ladder[5];
	Snake[] snakes = new Snake[5];
	Player[] players = new Player[5];
	Die d;
	
	
	public void createSnakes()
	{
		boolean repeat = false;
		
		for(int j=0; j<5; j++)     //create 5 snakes
		{
			
           outerLoop:
		   do{
			 int head = (int)(Math.random()*100)+1;
			 int tail = (int)(Math.random()*100)+1;
			
			if(tail>head)
			{
				int temp = head;
				head = tail;
				tail = temp;
				
			}
			Snake  s = new Snake(head,tail);    // use to set snake head and snake tail
			int i=0;
		for(; this.snakes[i]!=null; )
		{
			if(this.snakes[i].getHead()==s.getHead()){
		
			repeat =  true;                //repeat helps us control whether to re-run the loop or not.If we find a snake with the same head already in the 
			                                // array, we set repeat = true, which means "this snake is invalid, try again".If there's no conflict, 
											 //we set repeat = false, meaning the snake is unique and can be added to the array.
											 
		break outerLoop;
			}
            i++;			
			}
		if(this.snakes[i]==null){
			this.snakes[i]=s;
			repeat = false;
			
		}
	        }
	
		while(repeat);
		}
		
			
}} 