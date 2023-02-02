class Venues::ArtistsController < ApplicationController
  def index
    @venue = Venue.find(params[:venue_id])
    @artists = @venue.artists
  end
end