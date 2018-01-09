class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def create
    binding.pry
    @tag = Tag.create(tag_params)
  end

  def show

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
