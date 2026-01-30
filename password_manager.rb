# login credentials
EMAIL ="pakaya@sab.ac.lk"
PASSWORD="pakaya@foc_1234"
PASSWORD_VAULT={
  aws:{username: "ubetta", password: "ubhkpn"}
}

# main function
def main

  welcome_message
  user_email=get_email
  check_email(user_email)
  user_password=get_password
  check_password(user_password)
  greet(user_email)
  
  loop do
    menu
    user_selection=get_user_menu_selelction
    handle_user_selection(user_selection)
  end
end

# welcome message
def welcome_message
  puts "Wlcome to Password Manager!"
  puts  "Please login to continue."
end

# get email
def get_email
  print "Enter your email: "
  gets.chomp
end

# check whether email is valid or not
def check_email(user_email)
  if user_email!=EMAIL
    puts "Inavild Email!"
    exit
  end
end

#get password
def get_password
  print "Enter password: "
  gets.chomp
end

#check whether password is valid or not
def check_password(user_password)
  if user_password!=PASSWORD
    puts "Invalid Password"
    exit
  end
end

# greet user
def greet (user_email)
  puts "Welcome again #{user_email}!"
  puts "What you want to do today?"
end

# menu selection
def menu 
  print "1. Create new service credentials. \n"
  print "2. Retrieve exiting service credntials. \n" 
  print "3. Exit. \n"
end

# get user selection
def get_user_menu_selelction
  gets.chomp
end

# handle user slection
def handle_user_selection(user_selection)
  case user_selection
  when "1"
    
    new_service=set_new_service
    set_new_username(new_service)
    set_new_password(new_service)

  when "2"
    
    requested_service_name=retrieve_service_name
    credentials=retrieve_service_credentials_for(requested_service_name)
    display_service_credentials(requested_service_name, credentials)
  
  when "3"
    exit_program
  else
    puts "Invalid Input."
  exit
  end
end

# create new service
def set_new_service
  print "New service name: "
  new_service=gets.chomp
  PASSWORD_VAULT[new_service.to_sym]={}
  new_service
end

# set new username for service
def set_new_username(service)
  print "Enter the username: "
  new_username=gets.chomp
  PASSWORD_VAULT[service.to_sym][:username]=new_username
  p PASSWORD_VAULT
end

# set a new password for service
def set_new_password(service)
  print "Enter the password: "
  new_password=gets.chomp
  PASSWORD_VAULT[service.to_sym][:password]=new_password
  p PASSWORD_VAULT
end

# get name for retrieve service name
def name_for_retrieve_service_credentials
  print "What is the name for service that you want to get credentials for: "
  gets.chomp
end

# retrieve credentials
def retrieve_service_credentials(service)
  PASSWORD_VAULT[service.to_sym]
end

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
#  main function execution
main

