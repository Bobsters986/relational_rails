class ArtistsController < ApplicationController
  def index
    if params[:sort] == "only_bands"
      @artists = Artist.only_true
    else
      @artists = Artist.all
    end
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

  def destroy
    artist = Artist.find(params[:id])
    artist.destroy
    redirect_to '/artists'
  end

  private
  def artist_params
    params.permit(:name, :full_band, :cost)
  end
end