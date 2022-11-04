package day4;

public class Sample6 {

    int a;
    int b;

    void setValues(int x, int y){
        a=x;
        b=y;
    }

    void setValues(int q){
        a=q;
        b=22;
    }

    void show(){
        System.out.println("Value of a :"+a);
        System.out.println("Value of b :"+b);
    }

    public static void main(String[] args) {

        Sample6 s = new Sample6();
        s.setValues(50,60);
        s.setValues(10);
    }
}
