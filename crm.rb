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
    if @contact
      erb :show_contact
    else
      raise Sinatra::NotFound
    end
  end

  get '/new' do
    erb :new
  end

  get '/aboutme' do
    @skills = ['graphic design', 'css', 'html']
    @interests = ['reading', 'art', 'music']
    erb :aboutme
  end

  post '/contacts' do
  Contact.create(
    first_name: params[:first_name],
    last_name:  params[:last_name],
    email:      params[:email],
    note:       params[:note]
  )
  redirect to('/contacts')
  end

  get '/contacts/:id/edit' do
    @contact = Contact.find_by(id: params[:id].to_i)
    if @contact
      erb :edit_contact
    else
      raise Sinatra::NotFound
    end
  end

  put '/contacts/:id' do
    @contact = Contact.find_by(id: params[:id].to_i)
    if @contact
      @contact.update(
      first_name: params[:first_name],
      last_name:  params[:last_name],
      email:      params[:email],
      note:       params[:note]
      )
      redirect to('/contacts')
    else
      raise Sinatra::NotFound
    end
  end


  delete '/contacts/:id/delete' do
    @contact = Contact.find_by(params[:id].to_i)
    if @contact
      # @contact.delete
      erb :delete_contact
      redirect to('/contacts')
    else
      raise Sinatra::NotFound
    end
  end



after do
  ActiveRecord::Base.connection.close
end
