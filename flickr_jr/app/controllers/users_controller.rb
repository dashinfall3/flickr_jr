get '/users/:users_id' do
  @user = User.find(params[:users_id])
  @albums = @user.albums
  erb :user_show
end

post '/users/' do
  user = User.new(:username => params[:username], :password => params[:password])
  session[:user_id] = user.id
  if user.save
    Album.create(:user_id => user.id, :name => "my first album", :description => "this is my first album")
    redirect "/users/#{user.id}"
  else
    erb :index
  end
end
