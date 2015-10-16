class SubcommentsController < ApplicationController
  respond_to :html, :json

  def new
    @subcomment = Subcomment.new


    respond_with({ data: @subcomment })
  end

  def create
    if current_user
      @subcomment = current_user.comments.build(subcomment_params)
      if @subcomment.save

        respond_with({ data: @subcomment })
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


    respond_with("Success")
  end

  private

  def subcomment_params
    params.require(:subcomment).permit(:content, :comment_id)
  end

end
