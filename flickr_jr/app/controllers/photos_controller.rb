get '/albums/:albums_id/:photos_id' do

end

post '/photos' do
  photo = Photo.new
  # file = File.open('public/images/' + params[:filename][:filename], "w") do |f|
  #   f.write(params[:filename][:tempfile].read)
  # end
  photo.image = params[:filename][:tempfile]
  puts photo.save
  return "The file was successfully uploaded!"
  redirect "/users/#{current_user.id}"
end

 
  
