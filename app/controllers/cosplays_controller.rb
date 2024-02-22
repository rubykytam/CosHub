class CosplaysController < ApplicationController
  before_action :set_cosplay, only: [:show]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @cosplays = Cosplay.all
    @pagy, @cosplays = pagy(@cosplays, items: 20)
  end

  def show
    @cosplay = Cosplay.find(params[:id])
  end

  def new
    @cosplay = Cosplay.new
  end

  def create
    @cosplay = Cosplay.new(cosplay_params)
    @cosplay.user = current_user
    if @cosplay.save
      redirect_to cosplay_path(@cosplay)
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
