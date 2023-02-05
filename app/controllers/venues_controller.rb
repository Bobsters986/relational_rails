class VenuesController < ApplicationController
  def index
    @venues = Venue.sort
  end

  def new
  end

  def create
    venue = Venue.create(venue_params)
    redirect_to '/venues'
  end

  def show
    @venue = Venue.find(params[:id])
  end

  private
  def venue_params
    params.permit(:name, :decible_limit, :rank)
  end
end