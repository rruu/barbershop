#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
    @title = 'Барбершоп - Главная страница'
    erb :index
end

get '/visit' do
    @title = 'Барбершоп - Записаться'
    @h1 = 'Запись на посещение'
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

    @complete_to = "Поздравляем #{@name}, вы записались к баребру #{@barber}!"

    open('public/contacts.txt', 'a') do |f|
        f << "\nName: #{@name}, date: #{@date}, phone:#{@phone}, email:#{@email}, barber:#{@barber}"
        #erb :visitcomplete
      end

      erb :visit
end
