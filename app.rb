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

        @username = params[:username]
        @phone = params[:phone]
        @datetime = params[:datetime]
        @barber = params[:barber]
        @color = params[:color]

        c = Client.new
        c.name = @username
        c.phone = @phone
        c.barber = @barber
        c.datestamp = @datetime
        c.color = @color
        c.save
        erb"Спсибо ,Вы записались"
 end