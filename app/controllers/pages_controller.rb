class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @cosplays = Cosplay.all
    @pagy, @cosplays = pagy(@cosplays, items: 20)
  end
end
