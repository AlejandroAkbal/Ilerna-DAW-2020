public class Main {

    public static void main(String[] args) {

        Door door1 = new Door();
        Door door2 = new Door(100, 200);
        Door door3 = new Door(100, 200, "red");

        System.out.println(door1.toString());
        System.out.println(door2.toString());
        System.out.println(door3.toString());

    }
}
