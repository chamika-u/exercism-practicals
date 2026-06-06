public class JedliksToyCar {
    private int distance = 0;
    private int battery = 100;
    
    public static JedliksToyCar buy() {
        return new JedliksToyCar();
    }

    public String distanceDisplay() {
        return String.format("Driven %d meters", distance);
    }

    public String batteryDisplay() {
        return battery <= 0 ? "Battery empty" : String.format("Battery at %d%%", battery);
    }

    public void drive() {
        if (battery > 0) {
            distance += 20; 
            battery--;      
        }
    }
}