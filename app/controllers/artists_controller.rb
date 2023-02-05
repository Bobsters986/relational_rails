class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    artist = Artist.find(params[:id])
    artist.update(artist_params)

    redirect_to "/artists/#{artist.id}"
  end

  def show
    @artist = Artist.find(params[:id])
  end

  private
  def artist_params
    params.permit(:name, :full_band, :cost)
  end
end