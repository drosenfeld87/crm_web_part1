require_relative 'contact'
require 'sinatra'

get '/' do
  @contacts = Contact.all
  erb :contacts
end


get '/contacts' do
  @contacts = Contact.all
  erb :contacts
end


get '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
  erb :show_contact
end



# get '/contacts' do
#   @contacts = Contact.all
#
#   erb :contacts
# end

get '/aboutme' do
    @skills = ['graphic design', 'css', 'html']
    @interests = ['reading', 'art', 'music']

    erb :aboutme
  end

after do
  ActiveRecord::Base.connection.close
end
