require 'sinatra'
require 'sinatra/reloader'
require 'tilt/erubis'
require 'yaml'

before do
  @users = 

get "/" do
  redirect "user_list"
end

get "user_list" do
  