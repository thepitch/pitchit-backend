module VotesHelper
  def bookmark

    p "PARAMS ******************"
    p params
    p "PARAMS ******************"

    @vote = Vote.find_by(user_id: params["user_id"], votable_id: params["votable_id"], votable_type: params["votable_type"])
    if @vote
      @vote.update(bookmarked: !@vote.bookmarked)
      return false
    else
      @vote = User.find(params[:user_id]).votes.create!(votable_id: params[:votable_id], votable_type: params[:votable_type], bookmarked: true)
      return true
    end
  end

  def vote_params
    params
  end
end
