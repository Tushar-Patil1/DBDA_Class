package day4;

public class Fun5 {

    int a;
    int b;

    void setValues(int x, int y){
        a=x;
        b=y;
    }

    void show(){
        System.out.println("Value of a :"+a);
        System.out.println("Value of b :"+b);
    }

    public static void main(String[] args) {
        Fun5 f = new Fun5();
        f.show();
        f.setValues(50,60);
        f.show();
    }
}
