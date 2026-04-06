module SavingsAccount
  def self.interest_rate(balance)
    if balance < 0
      3.213
    elsif balance < 1000
      0.5
    elsif balance < 5000
      1.621
    else
      2.475
    end
  end

  def self.annual_balance_update(balance)
    balance + (balance * (interest_rate(balance) / 100.0))
  end

  def self.years_before_desired_balance(current_balance, desired_balance)
    years = 0
    
    while current_balance < desired_balance
      # Update the balance to the new amount for the year
      current_balance = annual_balance_update(current_balance)
      # Increment the year counter
      years += 1
    end
    
    # Implicitly return the total number of years
    years
  end
end