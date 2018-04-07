#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'

def get_db
    db = SQLite3::Database.new 'barbershop.db'
    db.results_as_hash = true
    return db
end


def seed_db

configure do

    db = get_db
    db.execute 'CREATE TABLE IF NOT EXISTS "Users" (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name varchar NOT NULL,
        datestamp varchar NOT NULL,
        phone varchar NOT NULL,
        email varchar NOT NULL,
        barber varchar NOT NULL
    );'


    db.execute 'CREATE TABLE IF NOT EXISTS "Barbers" (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name varchar NOT NULL
    );'

end


def barbers db, name
    db = get_db
    db.execute 'select * from Users order by id desc;'
    return @barbers
end

get '/' do
    @title = 'Барбершоп - Главная страница'
    erb :index
end

get '/visit' do
    @title = 'Барбершоп - Записаться'
    @h1 = 'Запись на посещение'
    @datetimepicker = true
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

get '/list' do
    @title = 'Барбершоп - Лист записи'
    @h1 = 'Лист записи'

    db = get_db
    @result = db.execute 'select * from Users order by id desc'

    erb :list
end

post '/visit' do

    @name = params[:name]
    @date = params[:date]
    @phone = params[:phone]
    @email = params[:email]
    @barber = params[:barber]

    @complete_to = "Поздравляем #{@name}, вы записались к барберу #{@barber}!"

        # Запись информвции о заказе в файл
        # open('public/contacts.txt', 'a') do |f|
        #     #f << "\nName: #{@name}, date: #{@date}, phone:#{@phone}, email:#{@email}, barber:#{@barber}"
        #     hh = {"Name"=> @name, "date"=> @date, "phone"=>@phone, "email"=>@email, "barber"=>@barber}
        #     f << hh
        # end

        db = get_db
        db.execute 'insert into Users (name, datestamp, phone, email, barber) values (?,?,?,?,?)', [@name,@date,@phone,@email,@barber] 

      erb :visit

      if @error != ''
        return erb :visit
      end

# get '/list' do
#     db = get_db
#     @resitls = db.execute 'select * from Users order by id desc'

#     erb :list

#     end


end

