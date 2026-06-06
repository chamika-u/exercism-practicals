class BirdWatcher {
    private final int[] birdsPerDay;

    public BirdWatcher(int[] birdsPerDay) {
        this.birdsPerDay = birdsPerDay.clone();
    }

    public static int[] getLastWeek() {
        // Renamed variable to standard camelCase
        int[] lastWeek = {0, 2, 5, 3, 7, 8, 4};
        return lastWeek;
    }

    public int getToday() {
        // Guard against an empty array to prevent exceptions
        if (this.birdsPerDay.length == 0) return 0;
        return this.birdsPerDay[this.birdsPerDay.length - 1]; 
    }

    public void incrementTodaysCount() {
        if (this.birdsPerDay.length > 0) {
            this.birdsPerDay[this.birdsPerDay.length - 1]++;
        }
    }

    public boolean hasDayWithoutBirds() {
        for (int count : this.birdsPerDay) {
            if (count == 0) {
                return true;
            }
        }
        return false;
    }

    public int getCountForFirstDays(int numberOfDays) {
        int sum = 0;
        // Ensure we don't try to check more days than we have data for
        int limit = Math.min(numberOfDays, this.birdsPerDay.length);
        
        for (int i = 0; i < limit; i++) {
            sum += this.birdsPerDay[i];
        }
        
        return sum;
    }

    public int getBusyDays() {
        int busyCount = 0;
        
        // Loop through the array and count days with 5 or more birds
        for (int count : this.birdsPerDay) {
            if (count >= 5) {
                busyCount++;
            }
        }
        
        return busyCount;
    }
}