# get input from the user

puts "Welcome to ceaser cipher encryption tool!"
print "Enter your message: "
user_message=gets.chomp

print "Enter shift number: "
shift_number=gets.chomp.to_i

# ceaser cipher encryption method
def encription (user_message, shift_number)
  encrypted_message=""
  user_message.each_char do |char|
    if char.match?(/[A-Za-z]/)
      base = char.ord < 91 ? 65 : 97
      encrypted_char = ((char.ord - base + shift_number) % 26 + base).chr
      encrypted_message += encrypted_char
    else
      encrypted_message += char
    end
  end
  encrypted_message
end

# encrypt the user message
encrypted_message = encription(user_message, shift_number)
puts "Encrypted message: #{encrypted_message}"

# ceaser cipher decryption method
def decryption(encrypted_message, shift_number)
  decrypted_message=""
  encrypted_message.each_char do |char|
    if char.match?(/[A-Za-z]/)
      base = char.ord < 91 ? 65 : 97
      decrypted_char = ((char.ord - base - shift_number) % 26 + base).chr
      decrypted_message += decrypted_char
    else
      decrypted_message += char
    end
  end
  decrypted_message
end
# decrypt the encrypted message
decrypted_message = decryption(encrypted_message, shift_number)
puts "Decrypted message: #{decrypted_message}"

