require "pry"
require "colorize"

@contacts = [
  { name: "Spencer", phone: "801-123-4567" },
  { name: "Milo", phone: "801-455-3214" },
  { name: "Sam", phone: "801-678-9983" }
]

@menu_items = [
  "View Contacts",
  "Add Contact",
  "Update Contact",
  "Delete Contact",
  "Exit"
]

def main_menu
  print `clear`
  print "--- ".colorize(:light_blue)
  print "Ruby Contact List ".colorize(:magenta)
  puts "--- ".colorize(:light_blue)
  @menu_items.each_with_index do |item, i|
    print "#{i + 1}) ".colorize(:light_yellow)
    puts item.colorize(:cyan)
  end
  puts
  print "> ".colorize(:cyan)
  case gets.strip
    when "1"
      view_contacts
      puts
      print "Hit Enter To Continue.".colorize(:light_yellow)
      gets
      main_menu
    when "2"
      add_contact
    when "3"
      update_contact
    when "4"
      delete_contact
    when "5"
      print `clear`
      print "Thanks for using the Ruby Contact List! ".colorize(:light_yellow)
      sleep(3)
      print `clear`
      exit 
    else
      print `clear`
      print "Invalid input! ".colorize(:red)
      sleep(2)
      main_menu
  end
end

def view_contacts
  print `clear`
  puts "Contacts:".colorize(:magenta)
  @contacts.each_with_index do |contact, i|
    print "#{i + 1}) ".colorize(:light_yellow)
    print "#{contact[:name]} ".colorize(:cyan)
    print "- ".colorize(:light_yellow)
    puts "#{contact[:phone]}".colorize(:light_blue)
  end
end

def add_contact
  contact = {}
  print `clear`

  puts "What is the name of the contact?".colorize(:light_yellow)
  puts
  print "> ".colorize(:cyan)
  contact[:name] = gets.strip
  puts
  print "> ".colorize(:cyan)

  print `clear`
  puts "What is the contact's phone number?".colorize(:light_yellow)
  puts
  print "> ".colorize(:cyan)
  contact[:phone] = gets.strip

  print `clear`
  @contacts << contact
  print "Contact ".colorize(:light_yellow)
  print contact[:name].colorize(:cyan)
  print " - ".colorize(:light_yellow)
  print contact[:phone].colorize(:cyan)
  print " Added! ".colorize(:light_yellow)
  sleep(3)
  main_menu
end

def update_contact
  view_contacts
  puts
  puts "Which contact do you wish to update?".colorize(:light_yellow)
  puts
  print "> ".colorize(:cyan)
  contact = @contacts[gets.to_i - 1]
  print `clear`
  
  puts "Update Contact: #{contact[:name]} - #{contact[:phone]}"
  puts
  print "What do you want to update the name to? "
  puts "(Hit ENTER to keep original name)".colorize(:cyan)
  print "> ".colorize(:cyan)
  input = gets.strip
  input == "" ? nil : contact[:name] = input
  print `clear`

  puts "Update Contact: #{contact[:name]} - #{contact[:phone]}"
  puts 
  print "What do you want to update the phone number to? "
  puts "(Hit ENTER to keep original phone number)".colorize(:cyan)
  print "> ".colorize(:cyan)
  input = gets.strip
  input == "" ? nil : contact[:phone] = input
  print `clear`
  print "Contact #{contact[:name]} has been updated. ".colorize(:light_yellow)
  sleep(3)
  print `clear`
  main_menu
end

def delete_contact
  view_contacts
  puts
  puts "Which contact do you wish to delete?".colorize(:light_yellow)
  puts
  print "> ".colorize(:cyan)
  index = gets.to_i - 1
  contact = @contacts[index]
  print `clear`
  print "Are you sure you want to delete #{contact[:name]}? ".colorize(:light_yellow)
  puts "(y / n)".colorize(:cyan)
  puts
  print "> ".colorize(:cyan)
  gets.strip == "y" ? nil : main_menu
  @contacts.delete_at(index)
  print `clear`
  print "#{contact[:name]} has been deleted. ".colorize(:red)
  sleep(2)
  print `clear`
  main_menu
end

main_menu
