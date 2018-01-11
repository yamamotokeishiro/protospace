class TagsController < ApplicationController
  def index
    @tag_list = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.create(tag_params)
  end

  def show
    # binding.pry
    @tag = Tag.find(params[:id])
    @prototypes = Prototype.joins(:tags).includes(:tags).order('tags.name').page(params[:page]).per(4)
  end

  def destroy

  end

  def edit

  end

  def update

  end

  private
  def tag_params
    params.require(:tag_list).permit()
  end
end
