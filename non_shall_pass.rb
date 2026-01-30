# logging details
EMAIL="pakaya@example.com"
PASSWORD="Pakaya@123"
PASSWORD_VAULT = {
  aws: {username: "Ubetatta", password: "Bahukpn"},
  azure: {username: "Ubeappa", password:"Bahukpn"}
}

# welcome messages
def welcome_message 
  puts "Welcome to Non Shall Pass - A Password Manager"
end

# login instructions
def prompt_user_email
  puts "Please, sign in to continue"
  print "Enter Email: "
  gets.chomp # get input as user_email for EMAIL
end

# check whether user email is corect or wrong
def verify_user_email(user_email)
  if user_email!=EMAIL
    puts "Invaild Email"
    exit
  end
end

# prompt user for password
def prompt_user_for_password
  print "Enter Password: "
  gets.chomp
end

# check whether user password is correct or wrong
def verify_user_password(user_password)
  if user_password!=PASSWORD
    puts "Invalid Password"
    exit
  end
end

# greet user after successful login 
def greet_user(user_email)
  puts "Hello, #{user_email}."
  puts "What whould you like ro do?"
end

# display menu options
def menu_options
  puts "1. Add service credentials"
  puts "2. Retrieve and existing service credentials"
  puts "3. Exit"
end

# get user menu selection
def get_user_menu_selection
  gets.chomp
end

# handle user menu selection
def handle_user_selection(user_selection)
  # performing user selection according to the input
  case user_selection
  when "1"

    # Adding new service credentials
    new_service=set_new_service_name
    set_user_name_for(new_service)
    set_password_for(new_service)
   
  when "2"

    # Retrieving existing service credentials
    requested_service_name=retrieve_service_name
    credentials=retrieve_service_credentials_for(requested_service_name)
    display_service_credentials(requested_service_name, credentials)

  when "3"
    # Exiting the program
    exit_program
  else
    # Invalid selection
    puts "Invalid selection"
  end
end

# set new service name
def set_new_service_name
  print "Enter the name of the service: "
  new_service=gets.chomp
  PASSWORD_VAULT[new_service.to_sym]={}
  new_service 
end

# set username for new service
def set_user_name_for(service)
  print "Enter the username for new service: "
  new_service_user_name=gets.chomp 
  PASSWORD_VAULT[service.to_sym][:username]=new_service_user_name
  p PASSWORD_VAULT
end

# set password for new service
def set_password_for(service)
  print "Enter the password for new service: "
  new_service_password=gets.chomp
  PASSWORD_VAULT[service.to_sym][:password]=new_service_password
  p PASSWORD_VAULT
end

# retrieve service name
def retrieve_service_name 
  print "Please enter the name of the service you wish to access credentials for: "
  gets.chomp
end

# retrieve service credentials for a given service
def retrieve_service_credentials_for(service)
  PASSWORD_VAULT[service.to_sym]
end

# display service credentials
def display_service_credentials(service_name, credentials)
  puts "Here are the credentials for #{service_name}: "
    credentials.each do |key, val|
      puts "#{key}, #{val}."
    end
end

# exit program
def exit_program
  puts "Exiting the program. Goodbye motherfucker!"
  exit
end

# main program execution
welcome_message
user_email=prompt_user_email
verify_user_email(user_email)
user_password=prompt_user_for_password
verify_user_password(user_password)
greet_user(user_email)

# main program loop
loop do
  menu_options
  user_selection=get_user_menu_selection
  handle_user_selection(user_selection)
end
