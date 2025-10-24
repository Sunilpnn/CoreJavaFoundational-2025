public class Vehicle {

    Car car; 

    private String name;
    private int airLevel;
    private int gripLevel;

    public Vehicle() {
        System.out.println("Vehicle is created");
    }
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAirLevel() {
        return airLevel;
    }

    public void setAirLevel(int airLevel) {
        this.airLevel = airLevel;
    }

    public int getGripLevel() {
        return gripLevel;
    }

    public void setGripLevel(int gripLevel) {
        this.gripLevel = gripLevel;
    }

    
    public String toString() {
        return "Vehicle: " +
               "Name=" + name + ", " +
               "Air Level=" + airLevel + ", " +
               "Grip Level=" + gripLevel;
    }
}
