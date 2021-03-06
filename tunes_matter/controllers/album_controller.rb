require("sinatra")
require("sinatra/contrib/all")
require_relative("../models/album.rb")
require_relative("../models/artist.rb")
require_relative("../models/edition.rb")

# INDEX - READ (all)

get "/albums" do
  @albums = Album.all()
  erb (:"albums/index")
end

#NEW - CREATE (get form)

get "/albums/new" do
  @artists = Artist.all()
  erb(:"albums/new")
end

#CREATE - CREATE (make something)

post "/albums" do
  @album = Album.new(params)
  @album.save()
  erb(:"albums/create")
end

#SHOW - READ (one)
get "/albums/:id" do
  @album = Album.find(params[:id])
  @editions = @album.all_editions()
  erb(:"albums/show")
end

#EDIT UPDATE (get form)

get "/albums/:id/edit" do
  @album = Album.find(params[:id])
  @artists = Artist.all()
  erb(:"albums/edit")
end

#UPDATE UPDATE (make change)

post "/albums/:id" do
  @album = Album.new(params)
  @album.update()
  erb(:"albums/update")
end


#WARN DELETE

get "/albums/:id/warn-delete" do
  @album = Album.find(params[:id])
  @editions = @album.all_editions()
  erb(:"albums/warn-delete")
end

#DESTROY DELETE

post "/albums/:id/delete" do
  @album = Album.find(params[:id])
    @album.delete()
    erb(:"albums/destroy")
end
