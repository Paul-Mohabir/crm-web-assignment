require 'pry'

class Contact


  attr_accessor :first_name, :last_name, :email, :note
  attr_reader :id
  #Need to make a unique ID for each new contact added
  @@contacts = []
  @@id = 9000

  # This method should initialize the contact's attributes
  def initialize (first_name, last_name, email, note)
    @id = @@id
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
  end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create (first_name, last_name, email, note)
    new_contact = self.new(first_name, last_name, email, note)
    @@contacts << new_contact
    @@id += 1
    new_contact
  end

  # This method should return all of the existing contacts
  def self.all
    @@contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find (id)
    @@contacts.each do |contact|
      if contact.id == id
        #if local variable contact which is contact equals id int the array it will return the defined local varialble which is called contact.
        return  contact
      end
    end
    puts "Contact not found"
  end


  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(attribute, value)
    case attribute.to_s
    when "first name"
        @first_name = value
     when  "last name"
        @last_name = value
     when "email"
        @email = value
     when "note"
       @note = value
     end
   end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(attribute, value)
  @@contacts.each do |contact|
    return contact if attribute.to_sym == :first_name && contact.first_name == value
    return contact if attribute.to_sym == :last_name && contact.last_name == value
    return contact if attribute.to_sym == :email && contact.email == value
    return contact if attribute.to_sym == :note && contact.note == value
      end
      return nil
    end

  # This method should delete all of the contacts
  def self.delete_all
    @@contacts = []
  end

  def full_name
  "#{first_name} #{last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
    @@contacts.delete(self)
  end

  # Feel free to add other methods here, if you need them.

end
# Copy your entire Contact class from the old crm assignment here.
# Then, run the following at the command line:
#
#   ruby test/contact_test.rb
#
# If your implementation of the Contact class is 'right', then you should see that all tests pass!
