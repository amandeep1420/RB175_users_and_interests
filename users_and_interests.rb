require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"
require "yaml"

helpers do
  def count_interests
    interest_count = 0
    @database.each do |user, info_hash|
      interest_count += info_hash[:interests].size
    end
    interest_count
  end
end

before do
  @database       = YAML.load_file("users.yaml")
  @users          = @database.keys
  @user_count     = @users.size
  @interest_count = count_interests
end

not_found do
  redirect "/"
end

get "/" do
  redirect "/user_list"
end

get "/user_list" do
  erb :user_list
end

get "/users/:user" do
  @user      = params[:user].to_sym
  @class     = @user.class
  @email     = @database[@user][:email]
  @interests = @database[@user][:interests].join(', ')
  
  erb :user_profile_page
end
  