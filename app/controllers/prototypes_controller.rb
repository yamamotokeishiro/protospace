class PrototypesController < ApplicationController
  before_action :set_prototype, only: :show

  def index
    @prototypes = Prototype.order("created_at ASC").page(params[:page]).per(4)
    @popular = Prototype.order('likes_count DESC').page(params[:page]).per(4)
  end

  def new
    @prototype = Prototype.new
    @prototype.captured_images.build
    @tags = Tag.new
  end

  def create
    binding.pry
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to :root, notice: 'New prototype was successfully created'
    else
      redirect_to ({ action: new }), alert: 'YNew prototype was unsuccessfully created'
    end
  end

  def show
    @likes = Like.where(prototype_id: params[:id])
    @tags = @prototype.tags
    @comments = @prototype.comments
    @comment = Comment.new
  end

  def destroy
    prototype = Prototype.find(params[:id])
    if prototype.user_id = current_user.id
      prototype.destroy
    end
    redirect_to root_path, notice: "削除しました"
  end

  def edit
    set_prototype
  end

  def update
    set_prototype
    if @prototype.update(prototype_params)
      redirect_to :root
    else
      render :edit
    end
  end

  private

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def prototype_params
    params.require(:prototype).permit(
      :title,
      :catch_copy,
      :concept,
      :user_id,
      captured_images_attributes: [:content, :status],
      tags_attributes: [:id, :name]
    )
  end
end
