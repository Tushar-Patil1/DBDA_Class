package day4;

public class Fun4 {

    int a;
    int b;

    void show(){
        System.out.println(a);
        System.out.println(b);
    }

    public static void main(String[] args) {
        Fun4 f1 = new Fun4();
        Fun4 f2 = new Fun4();
        Fun4 f3 = new Fun4();
        f1.a=20;
        f1.b=30;
        f1.show();
        f2.show();
        f3.a=50;
        f3.show();
    }
}
