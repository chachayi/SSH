package testHibernate;

public class testJava {

    public static void main(String[] args) {

        new Z();
    }
}

    class X {


        public X() {
            Y y = new Y();
            System.out.println("X");
        }
    }

    class Y {
        public Y() {
            System.out.println("Y");
        }
    }

     class Z extends X {
        Y y = new Y();

        public Z() {
            System.out.println("Z");
        }
    }


