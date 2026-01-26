# logging details
EMAIL="pakaya@example.com"
PASSWORD="Pakaya@123"
PASSWORD_VAULT = {aws: {username: "Ubetatta", password: "Bahukpn"}}

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

# check whether user input is corect or wrong
def verify_user_email(user_email)
  if user_email!=EMAIL
    puts "Invaild Email"
    exit
  end
end

def prompt_user_for_password
  print "Enter Password: "
  gets.chomp
end

def verify_user_password(user_password)
  if user_password!=PASSWORD
    puts "Invalid Password"
    exit
  end
end

# if password is right then these messages will display 
def greet_user(user_email)
  puts "Hello, #{user_email}."
  puts "What whould you like ro do?"
end

def menu_options
  puts "1. Add service credentials"
  puts "2. Retrieve and existing service credentials"
  puts "3. Exit"
end

def get_user_menu_selection
  gets.chomp
end

def handle_user_selection(user_selection)
  # performing user selection according to the input
  case user_selection
  when "1"

    new_service=set_new_service_name
    set_user_name_for(new_service)
    set_password_for(new_service)
   

  when "2"
    requested_service_name=retrieve_service_name
    credentials=retrieve_service_credentials_for(requested_service_name)
    display_service_credentials(requested_service_name, credentials)

  when "3"
    exit_program
  else
    puts "Invalid selection"
  end
end

def set_new_service_name
  print "Enter the name of the service: "
  new_service=gets.chomp
  PASSWORD_VAULT[new_service.to_sym]={}
  new_service 
end

def set_user_name_for(service)
  print "Enter the username for new service: "
  new_service_user_name=gets.chomp 
  PASSWORD_VAULT[service.to_sym][:username]=new_service_user_name
  p PASSWORD_VAULT
end

def set_password_for(service)
  print "Enter the password for new service: "
  new_service_password=gets.chomp
  PASSWORD_VAULT[service.to_sym][:password]=new_service_password
  p PASSWORD_VAULT
end

def retrieve_service_name 
  print "Please enter the name of the service you wish to access credentials for: "
  gets.chomp
end

def retrieve_service_credentials_for(service)
  PASSWORD_VAULT[service.to_sym]
end

def display_service_credentials(service_name, credentials)
  puts "Here are the credentials for #{service_name}: "
    credentials.each do |key, val|
      puts "#{key}, #{val}."
    end
end

def exit_program
  puts "Exiting the program. Goodbye motherfucker!"
  exit
end

welcome_message
user_email=prompt_user_email
verify_user_email(user_email)
user_password=prompt_user_for_password
verify_user_password(user_password)
greet_user(user_email)

loop do
  menu_options
  user_selection=get_user_menu_selection
  handle_user_selection(user_selection)
end
