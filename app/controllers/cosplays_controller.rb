class CosplaysController < ApplicationController
  before_action :set_cosplay, only: [:show]

  def index
    @cosplays = Cosplay.all
  end

  def show
    @booking = Booking.new
  end

  def new
    @cosplay = Cosplay.new
  end

  def create
    @cosplay = Cosplay.new(cosplay_params)
    @cosplay.user = @user
    if @cosplay.save
        # redirect_to MY COSPLAYS ???
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_cosplay
    @cosplay = Cosplay.find(params[:id])
  end

  def cosplay_params
    params.require(:cosplay).permit(:name, :size, :source_material, :price, :image)
  end
end
