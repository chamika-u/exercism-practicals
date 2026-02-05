class TwoFer
  def self.two_fer(name = "you")
    "One for #{name}, one for me."
  end
end

def get_friend_name
  print "Enter your friend's name: "
  name = gets.chomp
  name.empty? ? nil : name
end

def printing(name)
  if name
    puts "One for #{name}, one for me."
  else
    puts "One for you, one for me."
  end
end

def main 
  name = get_friend_name
  printing(name)
end

TwoFer.two_fer
TwoFer.two_fer('Alice')
TwoFer.two_fer('Bob')
