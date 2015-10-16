class VotesController < ApplicationController
  respond_to :json, :html
  include VotesHelper
  
  def create

    if params[:bookmarked] == "true"
      vote_created = self.bookmark
    else
      current_user.votes.create!(votable_id: params[:votable_id], votable_type: params[:votable_type])
    end

    
    if params[:votable_type] == "Pitch"
      @voteData = { newVoteNum: Pitch.find(params[:votable_id]).votes.count,
                     pitchId: params[:votable_id],
                     voteCreated: vote_created }
    else 
      @voteData = { newVoteNum: Comment.find(params[:votable_id]).votes.count,
                     pitchId: params[:votable_id],
                     voteCreated: vote_created }
    end

    respond_with({ data: @voteData})
  end

end
