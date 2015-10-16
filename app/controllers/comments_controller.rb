class CommentsController < ApplicationController
  respond_to :html, :json
  include CommentHelper
  def new
    @comment = Comment.new
    # respond_to do |format|
    #   format.json { render json: @comment }
    #   format.html { render 'new' }
    # end

    respond_with({ data: @comment })
  end

  def create
    comment = Comment.new(comment_params)
    user_id = params[:comment]["user_id"]
    current_user = User.find(user_id)
      if comment.save!
        json_response = inject_extra_comment_props(comment)
        render json: json_response
      else
        render json: "noooooo"
      end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    # respond_to do |format|
    #   format.json { render json: "Success" }
    #   format.html { redirect_to :back }
    # end

    respond_with("Success")
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :pitch_id, :user_id)
  end
end
