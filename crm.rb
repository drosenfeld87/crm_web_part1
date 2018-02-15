require_relative 'contact'
require 'sinatra'

get '/' do
  erb :index
end


get '/contacts' do
  @contacts = Contact.all
  erb :contacts
end

get '/aboutme' do
    @skills = ['graphic design', 'css', 'html']
    @interests = ['reading', 'art', 'music']

    erb :aboutme
  end

after do
  ActiveRecord::Base.connection.close
end
