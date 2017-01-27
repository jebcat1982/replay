class AlbumsController < ApplicationController
  def show
    @artist = Artist.new(:name => params[:artist_name])
    @album  = Album.new(:artist => @artist, :name => "The Good Life")
    @songs  = @album.songs
  end

  def download
    artist_name = params[:artist_name]
    album_name  = params[:name]

    artist = Artist.new(:name => artist_name)
    album  = Album.new(:artist => artist, :name => album_name)
    path   = File.join(Play.music_path,artist_name,album_name)
    zipped = album.zipped(path)

    send_file(zipped, :disposition => 'attachment')
  end
end
