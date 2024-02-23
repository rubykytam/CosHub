class Vendor::BookingsController < ApplicationController
  def index
    @cosplays = current_user.cosplays
    @bookings = current_user.bookings_as_vendor
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      redirect_to vendor_bookings_path
    end
    #changing the selected booking to "accept/reject" status
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :start_date, :end_date)
  end
end
