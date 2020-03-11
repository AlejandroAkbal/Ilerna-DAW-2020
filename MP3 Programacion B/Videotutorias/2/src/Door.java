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
}
