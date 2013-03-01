get '/albums/:album_id' do
  @album = Album.find(params[:album_id])
  erb :album_show
end

post '/albums' do
  album = Album.new(params)
  album.user = current_user
  if album.save
    redirect "/albums/#{album.id}"
  else
    erb :index
  end
end
