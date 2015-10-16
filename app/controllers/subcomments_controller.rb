class SubcommentsController < ApplicationController
  respond_to :html, :json
  include SubcommentHelper
  def new
    @subcomment = Subcomment.new
    @user_id = User.find(session[:user_id])
    # respond_to do |format|
    #   format.json { render json: @subcomment }
    # end

    respond_with({ data: @subcomment, current_user: @user_id })
  end

  def create
    subcomment = Subcomment.new(subcomment_params)
    user_id = params[:subcomment]["user_id"]
    current_user = User.find(user_id)
      if subcomment.save!
        json_response = inject_extra_subcomment_props(subcomment)
        render json: json_response
      else
        render json: "noooooo"
      end
    # if current_user
    #   @subcomment = current_user.comments.build(subcomment_params)
    #   if @subcomment.save
    #     # respond_to do |format|
    #     #   format.json { render json: @subcomment }
    #     #   format.html { redirect_to pitch_path(@subcomment.pitch) }
    #     # end

    #     respond_with({ data: @subcomment })
    #   else
    #     status 422
    #   end
    # else
    #   status 503
    # end
  end

  def destroy
    @subcomment = Subcomment.find(params[:id])
    @subcomment.destroy

    # respond_to do |format|
    #   format.json { render json: "Success" }
    #   format.html { redirect_to :back }
    # end
    # redirect_to subcomments_path

    respond_with("Success")
  end

  private

  def subcomment_params
    params.require(:subcomment).permit(:content, :comment_id, :user_id)
  end

end
