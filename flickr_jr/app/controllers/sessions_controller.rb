post '/login' do 
  session[:user_id] = User.authenticate(params[:username], params[:password]).id
  if current_user
    redirect "/users/#{@current_user.id}"
  else
    erb :index
  end
end


get '/logout' do 
  session.clear
  redirect '/'
end

def current_user
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
end
