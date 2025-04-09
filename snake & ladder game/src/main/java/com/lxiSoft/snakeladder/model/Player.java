package com.lxiSoft.snakeladder.model;

public class Player
{
	private String playerName;
	private int position;
	
	public void player(String playerName,int position ){
		this.playerName= playerName;
		this.position= position;
	}
	
	
	public String getPlayerName(){
		return playerName;
	}
	
	public void setPlayerName(String PlayerName){
		this.playerName= playerName;
	}
	
	public int getPosition(){
		return position;
	}
	
	public void setPosition(int position){
		this.position= position;
	}
	
	public String toString(){
		return "Player name  : "+ playerName + "\n"
		+ "Player position  : " + position;
		
	}
	
}