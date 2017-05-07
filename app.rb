require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:barbershop.db"



before do 
	@barbers = Barber.all 
end

class Client < ActiveRecord::Base
end

class Barber < ActiveRecord::Base
end

class Contact < ActiveRecord::Base
end

get'/' do 
	@barbers = Barber.all
	erb :index
	
end


get '/visit' do
        erb :visit
end

post '/visit' do

       c = Client.new params[:client]
       c.save
        
        erb"Спaсибо ,Вы записались"
 end