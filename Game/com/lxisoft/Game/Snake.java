package com.lxisoft.Game;
public class Snake
{
	private int head;
	private int tail;
	
	public Snake(int head,int tail){
		this.head = head;
		this.tail = tail;
	}
	public void setHead(int head)
	{
		this.head=head;
		
	}
	public int getHead()
	{
    return head;
	}
	
	
	 public void setTail(int tail)
	 {
        this.tail = tail;
    }

    public int getTail()
	{
        return tail;
    }
	
	
	public String toString(){
		return "HEAD :"+head+"TAIL :"+tail;
	}
}