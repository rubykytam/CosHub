class BookingsController < ApplicationController
  def index
    @bookings = current_user.bookings
  end

  def create
    @booking = Booking.new(booking_params)
    @cosplay = Cosplay.find(params[:cosplay_id])
    @booking.user = current_user
    @booking.cosplay = @cosplay
    if @booking.save
      redirect_to bookings_path
    else
      render "cosplays/show", status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
