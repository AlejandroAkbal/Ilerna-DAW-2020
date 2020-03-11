package Package2;

public class Door {
    private int height = 0;
    private int width = 0;
    private String color = "";

   public Door(){
        height = 150;
        width = 200;
        color = "white";
    }

    public Door(int height, int width){
        this.height = height;
        this.width = width;
        color = "white";
    }

    public Door(int height, int width, String color){
        this.height = height;
        this.width = width;
        this.color = color;
    }

    public String toString() {
        return "Height: " + height + "\nWidth: " + width + "\nColor: " + color;
    }

    /* ------------- Video Tutoria 3 ------------- */

    /* --- Public, private and package --- */

    private void function_privada(String texto) {
       System.out.println(texto);
    }

    public void function_publica(String texto) {
       System.out.println(texto);
    }

    void function_package(String texto) {
       System.out.println(texto);
    }

    /* --- Getters y Setters --- */

    public int getHeight() {
        return height;
    }

    public int getWidth() {
        return width;
    }

    public void setHeight(int height) {
        if (height < 100) {
                System.err.println("Height must be bigger than 100");
                return;
        }
        this.height = height;
    }
}
