class CommentsController < ApplicationController
  respond_to :html, :json

  def new
    @comment = Comment.new
    respond_to do |format|
      format.json { render json: @comment }
      format.html { render 'new' }
    end
  end

  def create
    if current_user
      @comment = current_user.comments.build(comment_params)
      if @comment.save
        respond_to do |format|
          format.json { render json: @comment }
          format.html { redirect_to pitch_path(@comment.pitch) }
        end
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
    
    respond_to do |format|
      format.json { render json: "Success" }
      format.html { redirect_to :back }
    end
  end

  private
 
  def comment_params
    params.require(:comment).permit(:content, :pitch_id)
  end
end