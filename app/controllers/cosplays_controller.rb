class CosplaysController < ApplicationController
  before_action :set_cosplay, only: [:show]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
      @cosplays = Cosplay.all
    @pagy, @cosplays = pagy(@cosplays, items: 20)
    if params[:query].present?
      sql_subquery = "name ILIKE :query OR source_material ILIKE :query"
      @cosplays = @cosplays.where(sql_subquery, query: "%#{params[:query]}%")
      # redirect_to cosplays_path(query:params[:query])
    end
    if params[:price_range].present?
      sql_subquery = "price >= ? AND price <= ?"
      @cosplays = @cosplays.where(sql_subquery, params[:price_range].split(",")[0].to_i, params[:price_range].split(",")[1].to_i)
    end
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
    params.require(:cosplay).permit(:name, :size, :source_material, :price, images: [])
  end
end
