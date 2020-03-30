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

