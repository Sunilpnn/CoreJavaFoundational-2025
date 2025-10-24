public class Tdd {
    public static void main(String[] args){
        Garrage garrage = new Garrage();

        //garrage vehicle= new Vehicle();

       Vehicle vehicle = new Vehicle();
        vehicle.setName("BMW");
        vehicle.setAirLevel(100);
        vehicle.setGripLevel(80);

          garrage.vehicle = vehicle;


    }
}
