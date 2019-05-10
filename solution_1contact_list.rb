@contacts = []

def get_menu_option
  puts "---My Contact List---"
  puts "1) Create a contact"
  puts "2) View All Contacts"
  puts "3) Exit"
  gets.strip.to_i
end


def create_contact
  puts "What is the contact name?"
  name = gets.strip
  if name.length > 0
    @contacts << name
    puts name + " was added to your list."
  else
    puts "invalid input"
    create_contact
  end
end


def view_contacts
  puts "Your contacts:"
  puts @contacts.join("\n")
end


def contact_list
  keep_going = true
  while keep_going
    user_choice = get_menu_option
    case user_choice
      when 1
        create_contact
      when 2
        view_contacts
      when 3
        keep_going = false
    else
      puts "Sorry, bad input"
    end
  end
  puts "Bye!"
end

contact_list
