class SqueakyClean {
    static String clean(String identifier) {
        StringBuilder result = new StringBuilder();
        boolean capitalizeNext = false;

        for (char ch : identifier.toCharArray()) {
            
            switch (ch) {
                case '4': ch = 'a'; break;
                case '3': ch = 'e'; break;
                case '0': ch = 'o'; break;
                case '1': ch = 'l'; break;
                case '7': ch = 't'; break;
            }

            if (ch == ' ') {
                result.append('_');
            } 
            else if (ch == '-') {
                capitalizeNext = true;
            } 
            else if (Character.isLetter(ch)) {
                if (capitalizeNext) {
                    result.append(Character.toUpperCase(ch));
                    capitalizeNext = false;
                } else {
                    result.append(ch);
                }
            }
        }
        
        return result.toString();
    }
}