public class Lasagna {
    
    public int expectedMinutesInOven() {
        return 40;  
    }

    public int remainingMinutesInOven(int actualMinutesInOven) {
        return expectedMinutesInOven() - actualMinutesInOven;
    }
    
    public int preparationTimeInMinutes(int layers) {
       
        int minutesPerLayer = 2;

        return layers * minutesPerLayer;
    }

    public int totalTimeInMinutes(int layers, int actualMinutesInOven) {
        return preparationTimeInMinutes(layers) + actualMinutesInOven;
    }
    
}