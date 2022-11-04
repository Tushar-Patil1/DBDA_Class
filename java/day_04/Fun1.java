class Fun1
{
	int a; 
	int b;
void SetValues(int x, int y)
{
 a=x;
 b=y;
}
void SetValues(int q)
{
a=q;
}
void show() //Function Defination
{
System.out.println("Value of a="+a);
System.out.println("Value of b="+b);
}

public static void main(String args[])
{
	Fun1 f1=new Fun1();
	Fun1 f2=new Fun1();
	f1.SetValues(40);
	f1.show(); //Function Calling
	//f2.show();
}
}  