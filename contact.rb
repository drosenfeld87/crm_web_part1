gem 'activerecord', '=4.2.10'
require 'active_record'
require 'mini_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'crm.sqlite3')


class Contact < ActiveRecord::Base

# attr_accessor :first_name, :last_name, :email, :note, :id

  field :first_name, as: :string
  field :last_name,  as: :string
  field :email,      as: :string
  field :note,       as: :text

  def full_name
    "#{first_name} #{last_name}"
  end

end

Contact.auto_upgrade!

# new_contact1 = Contact.create('Deb', 'Rosenfeld', 'drosenfeld87@gmail.com', 'likes_cats',)
# new_contact2 = Contact.create('Devin', 'McCoy', 'devingmccoy@gmail.com', 'likes_gaming')
# new_contact3 = Contact.create('Meg', 'Pesant', 'megan@meganpesant.com', 'likes_photography')

# n= Contact.full_name(first_name, last_name)
# pp n
# p new_contact2.update('first_name','Dev')
