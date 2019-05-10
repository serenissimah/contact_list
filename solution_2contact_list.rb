require "pry"

@contacts = [
  { name: "Spencer", phone: "801-123-4567" },
  { name: "Milo", phone: "801-455-3214" },
  { name: "Sam", phone: "801-678-9983" }
]

def main_menu
  puts "--- Ruby Contact List ---"
  puts "1) View Contacts"
  puts "2) Add Contact"
  puts "3) Update Contact"
  puts "4) Delete Contact"
  puts "5) Exit"
  puts
  print "> "
  case gets.strip
    when "1"
      view_contacts
      puts
      print "Hit Enter To Continue."
      gets
      main_menu
    when "2"
      add_contact
    when "3"
      update_contact
    when "4"
      delete_contact
    when "5"      
      print "Thanks for using the Ruby Contact List! "
      exit 
    else      
      print "Invalid input! "
      main_menu
  end
end

def view_contacts  
  puts "Contacts:"
  @contacts.each_with_index do |contact, i|
    print "#{i + 1}) "
    print "#{contact[:name]} "
    print "- "
    puts "#{contact[:phone]}"
  end
end

def add_contact
  contact = {}  

  puts "What is the name of the contact?"
  puts
  print "> "
  contact[:name] = gets.strip
  puts
  print "> "
  
  puts "What is the contact's phone number?"
  puts
  print "> "
  contact[:phone] = gets.strip
  
  @contacts << contact
  puts "Contact #{contact[:name]} - #{contact[:phone]} Added!"
  main_menu
end

def update_contact
  view_contacts
  puts
  puts "Which contact do you wish to update?"
  puts
  print "> "
  contact = @contacts[gets.to_i - 1]  
  
  puts "Update Contact: #{contact[:name]} - #{contact[:phone]}"
  puts
  print "What do you want to update the name to? (Hit ENTER to keep original name)"
  print "> "
  input = gets.strip
  input == "" ? nil : contact[:name] = input  

  puts "Update Contact: #{contact[:name]} - #{contact[:phone]}"
  puts 
  print "What do you want to update the phone number to? (Hit ENTER to keep original phone number)"
  print "> "
  input = gets.strip
  input == "" ? nil : contact[:phone] = input  
  puts "Contact #{contact[:name]} has been updated. "
  main_menu
end

def delete_contact
  view_contacts
  puts
  puts "Which contact do you wish to delete?"
  puts
  print "> "
  index = gets.to_i - 1
  contact = @contacts[index]  
  print "Are you sure you want to delete #{contact[:name]}? "
  puts "(y / n)"
  puts
  print "> "
  gets.strip == "y" ? nil : main_menu
  @contacts.delete_at(index)  
  puts "#{contact[:name]} has been deleted. "
  main_menu
end

main_menu
