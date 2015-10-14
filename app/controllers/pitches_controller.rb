class PitchesController < ApplicationController
  respond_to :html, :json

  def index
    # Send number of votes and relative time

    sort_type = params[:sort_type] || "hot"
    @pitches = Pitch.sort_pitches(sort_type)[0..14]

    p "*" * 80
    @json_response = JSON.parse(@pitches.to_json).map do |pitch|
      pitch["created_at"] = "#{time_ago_in_words(pitch["created_at"])} ago"
      pitch["vote_count"] = Pitch.find(pitch["id"]).votes.count
      pitch["comment_count"] = Pitch.find(pitch["id"]).comments.count
      pitch["author"] = Pitch.find(pitch["id"]).user.full_name
      pitch
    end
    p "*" * 80
    # respond_to do |format|
    #   format.json { render json: @pitches}
    #   format.html { render partial: 'pitch_list', content_type: 'text/html' }
    # end

    render json: @json_response
  end

  def show 
    @pitch = Pitch.find(params[:id])
    @pitch.num_votes = @pitch.votes.count
    @pitch_comments = @pitch.comments
    @subcomments = []


    @pitch_comments.each do |comment|
      @subcomments.concat(comment.subcomments)
    end

    @pitch_data = { pitch: @pitch, 
                    pitchComments: @pitch.comments, 
                    subcomments: @subcomments }
    # respond_to do |format|
    #   format.json { render json: 
    #                 { pitches: @pitches, pitchComments: @pitch_comments, subcomments: @subcomments} 
    #               }
    #   format.html { render 'show' } 
    # end

    respond_with({ data: @pitch_data })

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
      # respond_to do |format|
      #   format.json { render json: @pitch }
      #   format.html { redirect_to @pitch }
      # end

      respond_with({ data: @pitch })
    else
      status 422
    end
  end

  def destroy
    @pitch = Pitch.find(params[:id])
    @pitch.destroy

    # respond_to do |format|
    #   format.html { render json: "Success" }
    #   format.html { redirect_to pitches_path }
    # end

    respond_with("Success")
  end

  private

  def pitch_params
    params.require(:pitch).permit(:title,
      :tagline,
      :description,
      :media)
  end

end
