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
		
		for(int j=0; j<5; j++)
		{
			Snake  s;
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
			s = new Snake(head,tail);
			int i=0;
		for(; this.snakes[i]!=null; )
		{
			if(this.snakes[i].getHead()==s.getHead()){
		
			repeat =  true;
			
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