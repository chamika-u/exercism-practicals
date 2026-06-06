public class SalaryCalculator {
    public double salaryMultiplier(int daysSkipped) {
        if (daysSkipped<5){
            return 1.0;
        }
        else{
            return 0.85;
        }
    }

    public int bonusMultiplier(int productsSold) {
        if (productsSold>=20){
            return 13;
        } 
        else {
            return 10;
        }
    }

    public double bonusForProductsSold(int productsSold) {
        return bonusMultiplier(productsSold)*productsSold;
    }

    public double finalSalary(int daysSkipped, int productsSold) {
        double finalSalary = salaryMultiplier(daysSkipped)*(bonusForProductsSold(productsSold)+1000);
        if (finalSalary>=2000){
            return 2000;
        }
        else{
            return finalSalary;
        }
    } 
}
