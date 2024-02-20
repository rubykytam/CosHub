class CosplaysController < ApplicationController
  before_action :set_cosplay, only: [:show]

  def index
    @cosplays = Cosplay.all
  end

  def show
    @booking = Booking.new
  end

  private

  def set_cosplay
    @cosplay = Cosplay.find(params[:id])
  end
end
