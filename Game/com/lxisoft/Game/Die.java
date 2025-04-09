package com.lxisoft.Game;
public class Die
{
	private int result;
	
	
	public void setResult(int result)
	{
		this.result = result;
	}
	public int getResult()
	{
		return this.result;
	}

public void  throwDie()
{
		
	result = (int)(Math.random()*6)+1;
	
		
}


public String toString()
{
	return "RESULT : "+result;
}
}