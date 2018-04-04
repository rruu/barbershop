#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'

configure do

    #@db = SQLite3::Database.new 'barbershop.db'
    #db = get_db
    #db.results_as_hash = true

    db = SQLite3::Database.new 'barbershop.db'

    db.execute 'CREATE TABLE IF NOT EXISTS "Users" (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name varchar NOT NULL,
        datestamp varchar NOT NULL,
        phone varchar NOT NULL,
        email varchar NOT NULL,
        barber varchar NOT NULL
    );'

end


get '/' do
    @title = 'Барбершоп - Главная страница'
    erb :index
end

get '/visit' do
    @title = 'Барбершоп - Записаться'
    @h1 = 'Запись на посещение'
    @add_header = true
    erb :visit
end

get '/contacts' do
    @title = 'Барбершоп - Контакты'
    @h1 = 'Наши контакты'
    erb :contacts
end

get '/barbers' do
    @title = 'Барбершоп - Наши барберы'
    @h1 = 'Наши барберы'
    erb :barbers
end

post '/visit' do



    @name = params[:name]
    @date = params[:date]
    @phone = params[:phone]
    @email = params[:email]
    @barber = params[:barber]

    @complete_to = "Поздравляем #{@name}, вы записались к барберу #{@barber}!"


        # open('public/contacts.txt', 'a') do |f|
        #     #f << "\nName: #{@name}, date: #{@date}, phone:#{@phone}, email:#{@email}, barber:#{@barber}"
        #     hh = {"Name"=> @name, "date"=> @date, "phone"=>@phone, "email"=>@email, "barber"=>@barber}
        #     f << hh
        # end

        db.execute 'insert into Users (name, datestamp, phone, email, barber) values (?,?,?,?,?)', [@name,@date,@phone,@email,@barber] 

      erb :visit

      if @error != ''
        return erb :visit
      end

end

def db
    return SQLite3::Database.new 'barbershop.db'
end
