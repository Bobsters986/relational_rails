class VenuesController < ApplicationController
  def index
    @venues = Venue.sort
  end

  def show
    @venue = Venue.find(params[:id])
  end
end