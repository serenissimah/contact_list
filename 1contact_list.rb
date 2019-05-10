@contacts = ["Bob", "Jill"]

def main_menu
  puts "--- Ruby Contact List ---"
  puts "1) Create Contact"
  puts "2) View Contacts"
  puts "3) Delete Contact"
  puts "4) Exit"
  puts "Pick a number to execute:"
  input = gets.strip
  case input
    when "1"
      puts "Add a contact:"
      create_contact
    when "2"
      puts "View your contact list below:"
      view_contacts
    when "3"
      puts "Delete which contact."
      delete_contacts
    when "4"
      puts "Goodbye!"
    else
      puts "Invalid input, try again!"
      main_menu
  end
end

def create_contact
  create_cont = gets.strip
  @contacts << create_cont 
  puts "#{@contacts.last} has been added on your Contact List."
  main_menu
end

def view_contacts
  #show all of the contacts
  @contacts.each do |c|
    puts c
  end
  main_menu
end

def delete_contacts
  del_cont = gets.strip
  @contacts.delete(del_cont)
  puts "#{del_cont} has been deleted from your Contact List."
  main_menu
end

main_menu


