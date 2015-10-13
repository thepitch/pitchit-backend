class SubcommentsController < ApplicationController

  def new
    @subcomment = Subcomment.new
    respond_to do |format|
      format.json { render json: @subcomment }
    end
  end

  def create
    if current_user
      @subcomment = current_user.comments.build(subcomment_params)
      if @subcomment.save
        respond_to do |format|
          format.json { render json: @subcomment }
          format.html { redirect_to pitch_path(@subcomment.pitch) }
        end
      else
        status 422
      end
    else 
      status 503
    end
  end

  def destroy
    @subcomment = Subcomment.find(params[:id])
    @subcomment.destroy

    respond_to do |format|
      format.json { render json: "Success" }
      format.html { redirect_to :back }
    end 
    # redirect_to subcomments_path
  end

  private

  def subcomment_params
    params.require(:subcomment).permit(:content, :comment_id)
  end

end
