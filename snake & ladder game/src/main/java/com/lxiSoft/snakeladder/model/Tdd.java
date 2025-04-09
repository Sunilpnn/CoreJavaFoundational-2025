package com.lxiSoft.snakeladder.model;


public class Tdd{
	public static void main(String[] args){
		
		Cell cell= new Cell();
		Die die= new Die();
		for(int i=0; i< 5; i++){
			die.throwDie();
			System.out.println(die);
		}
		
		
	}
}