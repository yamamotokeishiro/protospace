class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @prototypes = Prototype.find(params[:prototype_id])
    if @comment.save
      @comments = @prototypes.comments.length
      @comment.user.avatar
      respond_to do |format|
        format.html { redirect_to prototype_path(params[:prototype_id])  }
        format.json
      end
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(prototype_id: params[:prototype_id], user_id: current_user.id)
  end
end
