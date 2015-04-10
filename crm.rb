require_relative 'contact'
require_relative 'rolodex'
require 'sinatra'

$rolodex = Rolodex.new
@@rolodex = Rolodex.new

# Temporary fake data so that we always find contact with id 1000.
@@rolodex.add_contact(Contact.new("Johnny", "Bravo", "johnny@bitmakerlabs.com", "Rockstar"))


get '/' do
	erb :index
end

get '/contacts' do
  	erb :contacts
end

get '/contacts/new' do
	erb :new_contact
end

get "/contacts/1000" do
  @contact = @@rolodex.find(1000)
  erb :show_contact
end

post '/contacts' do
  new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:note])
  $rolodex.add_contact(new_contact)
  redirect to('/contacts')
end
