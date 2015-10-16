class PitchesController < ApplicationController
  respond_to :html, :json
  include PitchHelper

  def index
    sort_type = params[:sort_type] || "hot"
    pitches = Pitch.sort_pitches(sort_type)[0..14]
    json_response = inject_extra_index_props(pitches)


    render json: json_response
  end

  def show 
    pitch = Pitch.find(params[:id])

    json_response = inject_extra_show_props(pitch)

    p json_response



    respond_with(json_response)

  end

  def new 
    @pitch = Pitch.new

    respond_with(@pitch)
  end

  def edit
    @pitch = Pitch.find(params[:id])


    respond_with(@pitch)
  end

  def create


    @pitch = User.find(pitch_params[:user_id]).pitches.new(pitch_params)

    if @pitch.save
      render json: JSON.parse(@pitch.to_json)
    else
      status 422
    end
  end

  def destroy
    @pitch = Pitch.find(params[:id])
    @pitch.destroy

    redirect_to root_path
  end

  def pitch_of_the_week
    pitch_of_the_week = Pitch.where("created_at > :week", {week: 1.week.ago }).sort_pitches("score").first
    json_response = inject_extra_show_props(pitch_of_the_week)
    respond_with(json_response)
  end

  private

  def pitch_params
    params.require(:pitch).require(:pitch).permit(:title,
      :tagline,
      :description,
      :media,
      :user_id)

  end

end
