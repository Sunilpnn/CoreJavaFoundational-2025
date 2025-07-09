 package com.lxisoft.game;

public class Player{
	
private String name; 
private String avatar;
private int score;
private boolean active;

public void setName(String name){
	this.name=name;
	
}
public String getName(){
	return name;
}
public void setAvatar(String avatar){
	this.avatar=avatar;
}
public String getAvatar(){
	return avatar;
}

public void setScore(int score){
	this.score=score;
	
}
public int getScore(){
	return score;
}
	
	
public boolean isActive()
	{
		return active ;
	}
	
	public void setActive(boolean active)
	{
	
		this.active = active ;
	}

public String toString(){
	return "PlayerName :"+name+"\nProfilePicture"+avatar+"\nScore :"+score+"\nIsActive :"+active;
}
}
