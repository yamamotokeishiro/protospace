class LikesController < ApplicationController
  def create
    @like = Like.create(user_id: current_user.id, prototype_id: params[:prototype_id])
    @likes = Like.where(prototype_id: params[:prototype_id])
    @prototype = Prototype.find(params[:prototype_id])
    @id_name = "#like-link-#{@prototype.id}"
@id_heart = "#heart-#{@prototype.id}"
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, prototype_id: params[:prototype_id])
    like.destroy
    @likes = Like.where(prototype_id: params[:prototype_id])
    @prototype = Prototype.find(params[:prototype_id])
    @id_name = "#like-link-#{@prototype.id}"
@id_heart = "#heart-#{@prototype.id}"
  end
end
