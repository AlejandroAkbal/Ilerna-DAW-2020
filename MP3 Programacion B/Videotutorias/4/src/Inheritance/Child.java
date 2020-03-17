package Inheritance;

public class Child extends Human {

    private String module ;

    public Child() {
        module = "M03B";
    }

    public Child(String name, int age, String module) {
        // Super del constructor de la clase superior
        super(name, age);

        this.module = module;
    }
}
