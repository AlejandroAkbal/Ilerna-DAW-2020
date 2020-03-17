package Inheritance;

public class Human {

    private String name;
    private int age;

    public Human() {
        name = "Jose";
        age = 22;
    }

    public Human(String name, int age) {
        this.name = name;
        this.age = age;
    }

    @Override
    public String toString() {
        return "Im overriding the inherited toString function";
    }
}
