class Vendor::CosplaysController < ApplicationController

def index
  @cosplays = current_user.cosplays
end

end
