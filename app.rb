require'rubygems'
require'sinatra/reloader'
require'sinatra/activerecord'

#подключение к БД
set :database,"sqlite3:barbershop.db"

class Client < Activerecord::Base 
end



get'/' do 
	erb"Hello"
	
end