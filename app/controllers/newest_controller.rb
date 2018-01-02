class NewestController < ApplicationController
  def index
    @prototypes = Prototype.order("created_at ASC").page(params[:page]).per(4)
  end
end
