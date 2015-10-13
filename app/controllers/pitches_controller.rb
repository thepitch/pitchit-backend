class PitchesController < ApplicationController
  respond_to :html, :json

  def index
    sort_type = params[:sort_type] || "hot"
    @pitches = Pitch.sort_pitches(sort_type)[0..14]
    # respond_to do |format|
    #   format.json { render json: @pitches}
    #   format.html { render partial: 'pitch_list', content_type: 'text/html' }
    # end

    respond_with(@pitches)
  end

  def show 
    @pitch = Pitch.find(params[:id])
    @pitch_comments = @pitch.comments
    @subcomments = []

    @pitch_comments.each do |comment|
      @subcomments.concat(comment.subcomments)
    end

    # respond_to do |format|
    #   format.json { render json: 
    #                 { pitches: @pitches, pitchComments: @pitch_comments, subcomments: @subcomments} 
    #               }
    #   format.html { render 'show' } 
    # end

    respond_with(@pitch, @pitch_comments, @subcomments)

  # What do with @pitch.video.to_json ?
  end

  def new 
    @pitch = Pitch.new

    respond_to do |format|
      format.json { render json: @pitch }
    end
  end

  def edit
    @pitch = Pitch.find(params[:id])

    respond_to do |format|
      format.json { render json: @pitch }
    end
  end

  def create
    @pitch = current_user.pitches.new(pitch_params)

    if @pitch.save
      respond_to do |format|
        format.json { render json: @pitch }
        format.html { redirect_to @pitch }
      end
    else
      status 422
    end
  end

  def destroy
    @pitch = Pitch.find(params[:id])
    @pitch.destroy

    respond_to do |format|
      format.html { render json: "Success" }
      format.html { redirect_to pitches_path }
    end
  end

  private

  def pitch_params
    params.require(:pitch).permit(:title,
      :tagline,
      :description,
      :media)
  end

end
