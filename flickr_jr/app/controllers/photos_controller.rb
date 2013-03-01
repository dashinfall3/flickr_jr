get '/albums/:album_id/:photos_id' do

end

post '/albums/:album_id/photos' do
  photo = Photo.new
  photo.image = params[:filename][:tempfile]
  photo.album_id = params[:album_id]
  photo.save

   # file = File.open('public/images/' + params[:filename][:filename], "w") do |f|
  #   f.write(params[:filename][:tempfile].read)
  # end
  redirect "albums/#{params[:album_id]}"
end

 
  
