package com.lxisoft.game;
 
    public class Dice {
 
     private int result;

     public int roll(){ 
		
        int N = 6;
        result = (int)(Math.random() * N) + 1;
        return result;
    }

    public String toString(){
		
        return "DiceRandomNum : " + result;
    }

   
}
