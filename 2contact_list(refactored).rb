@contacts = [
  { name: "Bob", phone: "000-000-0000"},
  { name: "Jill", phone: "111-111-1111"},
  { name: "Maria", phone: "222-222-2222"}, 
  { name: "Amanda", phone: "333-333-3333"},
  { name: "Jose", phone: "444-444-4444"},
  ]

def main_menu
  puts "--- Ruby Contact List ---"
  puts "1) Create Contact"
  puts "2) View Contacts"
  puts "3) Delete Contact"
  puts "4) Edit Contact"
  puts "5) Exit"
  puts "Pick a number to execute"
  input = gets.strip

  case input
    when "1"
      create_contact
    when "2"
      puts "View your all of contacts below:"
      view_contacts
    when "3"
      puts "Delete which contact?"
      delete_contacts
    when "4"
      puts "Which contact would you like to edit?"
      edit_contacts
    when "5"
      puts "Goodbye"
    else
      puts "Invalid input, try again!"
      main_menu
  end
end

def create_contact
  hash = {}
  puts "Add a contact: what is the first name?"
  hash[:name] = gets.strip
  puts "What is the phone number?"
  hash[:phone] = gets.strip
  @contacts << hash
  main_menu
end

def view_contacts
  #show all of the contacts
  @contacts.each do |c|
    puts "#{c[:name]} - #{c[:phone]}"
  end
  main_menu
end

def delete_contacts
  del_cont = gets.strip
  @contacts.each do |p|
    if p[:name] == del_cont
      @contacts.delete(p)
      puts "#{del_cont} has been deleted from your list."
    end
  end
  main_menu
end

def edit_contacts
  old_cont = gets.strip
  puts "What's the new name?"
  new_cont = gets.strip
  @contacts.each do |p|
    if p[:name] == old_cont
      p[:name] = new_cont
      puts "#{old_cont} has been erased and now it is #{new_cont}"
    end
  end
  main_menu
end
main_menu


  # edit contacts before the refactor (assignment 1)
  # def edit_contacts
  # new_index = @contacts.index(got_cont)
  # puts "What is the new contact info?"
  # got_cont = gets.strip
  # @contacts[new_index] = got_cont
  # puts "#{got_cont} is the new contact"


