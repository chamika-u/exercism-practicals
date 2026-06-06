public class LogLevels {
    
    public static String message(String logLine) {
        int indexOF = logLine.indexOf(":");
        String newString=logLine.substring(indexOF + 1).trim();
        return newString;
    }

    public static String logLevel(String logLine) {
        int startIndex = logLine.indexOf("[");
        int endIndex = logLine.indexOf("]");
        String newString=logLine.substring(startIndex + 1, endIndex).toLowerCase();
        return newString;
    }

    public static String reformat(String logLine) {
        String newString=String.format("%s (%s)", message(logLine), logLevel(logLine));        
        return newString;
    }
}
