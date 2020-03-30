require 'rubygems'
require 'sinatra'
require "sinatra/reloader" if development?

get '/' do
  erb 'Can you handle a secret?'
end

get '/about' do
  erb :about
end

get '/visit' do
  erb :visit
end

post '/visit' do
  # username, phone, datetime
  @username = params[:username]
  @phone = params[:phone]
  @datetime = params[:datetime]
  @baber = params[:barber]

  @title = "Thank you!"
  @message = "Уважаемый #{@username}, мы ждём вас #{@datetime} у выбранного парикмахера #{@barber}."

  # запишем в файл то, что ввёл клиент
  f = File.open 'users.txt', 'a'
  f.write "User: #{@username}, phone: #{@phone}, date and time: #{@datetime}. Baber: #{@barber}.\n"
  f.close

  erb :message
end
