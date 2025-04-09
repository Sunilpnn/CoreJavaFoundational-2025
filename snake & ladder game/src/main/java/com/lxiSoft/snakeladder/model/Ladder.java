package com.lxiSoft.snakeladder.model;

public class Ladder{
	private int top;
	private int bottom;
	
	
	public Ladder(int top, int bottom){
		this.top= top;
		this.bottom= bottom;
	}
	
	public int getTop(){
		return top;
	}
	
	public void setTop(int top){
		this.top= top;
	}
	
	public int bottom(){
		return bottom;
	}
	
	public void setBottom(int bottom){
		this.bottom= bottom;
	}
	
	public String toString(){
		return "Top number  :" + this.top+ "/n"
		       + "Bottom Number  :" + this.bottom;
	}
}