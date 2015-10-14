class PitchesController < ApplicationController
  respond_to :html, :json
  include PitchHelper

  def index
    sort_type = params[:sort_type] || "hot"
    pitches = Pitch.sort_pitches(sort_type)[0..14]
    json_response = inject_extra_index_props(pitches)
    # respond_to do |format|
    #   format.json { render json: @pitches}
    #   format.html { render partial: 'pitch_list', content_type: 'text/html' }
    # end

    respond_with(json_response)
  end

  def show 
    pitch = Pitch.find(params[:id])

    json_response = inject_extra_show_props(pitch)

    p json_response


    # @pitch.num_votes = @pitch.votes.count
    # @pitch_comments = @pitch.comments
    # @subcomments = []


    # @pitch_comments.each do |comment|
      # @subcomments.concat(comment.subcomments)
    # end

    # @pitch_data = { pitch: @pitch, 
                    # pitchComments: @pitch.comments, 
                    # subcomments: @subcomments }
    # respond_to do |format|
    #   format.json { render json: 
    #                 { pitches: @pitches, pitchComments: @pitch_comments, subcomments: @subcomments} 
    #               }
    #   format.html { render 'show' } 
    # end

    respond_with(json_response)

  # What do with @pitch.video.to_json ?
  end

  def new 
    @pitch = Pitch.new

    # respond_to do |format|
    #   format.json { render json: @pitch }
    # end

    respond_with({ data: @pitch })
  end

  def edit
    @pitch = Pitch.find(params[:id])

    # respond_to do |format|
    #   format.json { render json: @pitch }
    # end

    respond_with({ data: @pitch })
  end

  def create
    @pitch = current_user.pitches.new(pitch_params)

    if @pitch.save
      respond_with({ data: @pitch })
    else
      status 422
    end
  end

  def destroy
    @pitch = Pitch.find(params[:id])
    @pitch.destroy

    redirect_to root_path
  end

  private

  def pitch_params
    params.require(:pitch).permit(:title,
      :tagline,
      :description,
      :media)
  end

end
