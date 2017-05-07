require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:barbershop.db"



before do 
	@barbers = Barber.all 
end

class Client < ActiveRecord::Base
	validates :name, presence: true
	validates :phone, presence: true
	validates :datestamp, presence: true
	validates :color, presence: true

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
        if c.save
        erb"Спaсибо ,Вы записались"
      else
      	@error = c.errors.full_messages.first
      	erb :visit
      end
 end