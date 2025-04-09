package com.lxiSoft.snakeladder.model;

public class Die
{
	private int result;
	
	
	public int getResult(){
		return result;
	}
	
	public void setResult(int result){
		this.result= result;
	}
	
	
	public int throwDie(){
		result= (int)(Math.random()*6)+1;
		return result;
	}
	
	public String toString(){
		return "Result "+ result;
	}
}