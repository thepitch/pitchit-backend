class CommentsController < ApplicationController
  respond_to :html, :json

  def new
    @comment = Comment.new


    respond_with({ data: @comment })
  end

  def create
    if current_user
      @comment = current_user.comments.build(comment_params)
      if @comment.save
        respond_with({ data: @comment })
      else
        status 422
      end
    else 
      status 503
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  

    respond_with("Success")
  end

  private
 
  def comment_params
    params.require(:comment).permit(:content, :pitch_id)
  end
end
