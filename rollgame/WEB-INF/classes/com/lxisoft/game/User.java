package com.lxisoft.game;

public class User{
private String name;
private Player playUser;
private int score;



public void setName(String name){
	
	this.name = name;
}
public String getName(){
	return  name;
}
public void setPlayUser(Player playUser){
	
	this.playUser = playUser;
}
public Player getPlayUser(){
	return  playUser;
}
public void setScore(int score){
	
	this.score = score;
}
public int getScore(){
	return score; 
}
public String toString() {
    return "Player Name: " + playUser+ "\nMy Score: " + score+"\nPlayer Two :" + name;
}


}

