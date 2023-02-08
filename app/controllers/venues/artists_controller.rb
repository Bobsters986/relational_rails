class Venues::ArtistsController < ApplicationController
  def index
    @venue = Venue.find(params[:venue_id])
    if params[:sort] == "alphabetically"
      @artists = @venue.artists.sort_alphabetically
    elsif params[:cost].present?
      @artists = @venue.artists.artist_cost_over(params[:cost])
    else
      @artists = @venue.artists
    end
  end

  def new
    @venue = Venue.find(params[:venue_id])
  end

  def create
    venue = Venue.find(params[:venue_id])
    artist = venue.artists.create!(artist_params)
    redirect_to "/venues/#{venue.id}/artists"
  end

  private
  def artist_params
    params.permit(:name, :full_band, :cost)
  end
end