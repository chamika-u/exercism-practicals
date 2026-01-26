# logging details
EMAIL="pakaya@example.com"
PASSWORD="Pakaya@123"
PASSWORD_VAULT = {aws: {username: "Ubetatta", password: "Bahukpn"}}

# welcome messages
def welcom_essage 
  puts "Welcome to Non Shall Pass - A Password Manager"
end

# login instructions
def prompt_user_for_email
  puts "Please, sign in to continue"
  print "Enter Email: "
  user_email=gets.chomp # get input as user_email for EMAIL
end

# check whether user input is corect or wrong
def verify_email(user_email)
  if user_email==EMAIL
    print "Enter Password: "
    user_password=gets.chomp
  else
    puts "Invaild Email"
    exit
  end
end

# if password is right then these messages will display 
unless user_password != PASSWORD
  puts "Hello, #{user_email}."
  puts "What whould you like ro do?"
  puts "1. Add service credentials"
  puts "2. Retrieve and existing service credentials"
  puts "3. Exit"
  user_selection = gets.chomp

else # if password is wrong
    puts "Invalid Password"
    exit
end

# performing user selection according to the input
case user_selection
when "1"
  
  # create a new service 
  puts "This will create new service credentials"
  print "Enter the name of the service: "
  new_service=gets.chomp
  PASSWORD_VAULT[new_service]={}
  p PASSWORD_VAULT

  # gets username for the created service
  print "Enter the username for new service: "
  new_service_user_name=gets.chomp 
  PASSWORD_VAULT[new_service]["username"]=new_service_user_name
  p PASSWORD_VAULT

  # gets password for the created service
  print "Enter the password for new service: "
  new_service_password=gets.chomp
  PASSWORD_VAULT[new_service]["password"]=new_service_password
  p PASSWORD_VAULT

when "2"
  puts "This will retrieve existing service credentials"
  print "Please enter the name of the service you wish to access credentials for: "
  requested_service_name=gets.chomp
  credentials=PASSWORD_VAULT[requested_service_name.to_sym]
  puts "Here are the credentials for #{requested_service_name}: "
  credentials.each do |key, val|
    puts "#{key}, #{val}."
  end
when "3"
  puts "Exiting the program. Goodbye motherfucker!"
else 
  puts "Invalid Input. Please put the option number only.(Ex: 1)"
  exit
end