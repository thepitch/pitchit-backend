module VotesHelper
  def bookmark

    @vote = Vote.where(user_id: current_user, votable_id: params[:votable_id], votable_type: params[:votable_type]).first
    if @vote
      @vote.update(bookmarked: !@vote.bookmarked)
      return false
    else
      @vote = current_user.votes.create!(votable_id: params[:votable_id], votable_type: params[:votable_type], bookmarked: true)
      return true
    end
  end

  def vote_params
    params
  end
end
