class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @cosplay = Cosplay.find(params[:cosplay_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @cosplay = Cosplay.find(params[:cosplay_id])
    @booking.user = current_user
    @booking.cosplay = @cosplay
    if @booking.save
      redirect_to bookings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
