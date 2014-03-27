# Note: the name of this file (app.rb) is irrelevant.

# Require config/environment.rb
require ::File.expand_path('../config/environment',  __FILE__)

set :app_file, __FILE__

get '/' do
  photos = Photo.reverse_order(:created_at).all
  erb :index, :locals => {:photos => photos}
end

get '/todo' do
  erb :todo
end
#deletes the post
post '/photos/:id/delete' do 
  photo = Photo.where(:id=>params[:id]).first
  photo.delete

  File.unlink("./public/uploads/#{photo.filename}")

  redirect to('/')
end

#uploads a picture and description.
post '/upload' do
  filename = params[:file][:filename]
  file = params[:file][:tempfile]
  description = params[:description]
  title = params[:title]
  
  # here:
  # change filename in some way to guarantee
  # that it doesn't collide with any
  # previously-uploaded filenames

  # Either of these will (reasonably) make
  # sure that we don't accidentally overwrite
  # old files

  # filename = (some random gibberish) + filename
  # filename = "#{SecureRandom.hex(3)}_#{filename}"

  # filename = (the current time to the second) + filename
  # filename = "#{Time.now.to_i}_#{filename}"

  # Both
  filename = "#{Time.now.to_i}_#{SecureRandom.hex(3)}_#{filename}"

  File.open("./public/uploads/#{filename}", 'wb') do |f|
    f.write(file.read)
  end

  Photo.create(:filename => filename, :description => description, :title=>title)
	
  redirect to('/')
end

post '/photos/:id/comments' do
  Comment.create(:photo_id =>params[:id], :contents => params[:contents])
  redirect to('/')
end