module UserInfoHelper
  include PitchHelper

  def inject_extra_user_props(user)
    user_as_json = JSON.parse(user.to_json)


    user_as_json["full_name"] = user["first_name"] + " " + user["last_name"]
    user_as_json["votes"] = JSON.parse(user.votes.to_json)

    user_as_json["votes"].map! do |vote|
      vote_obj = Vote.find(vote["id"])

      if vote_obj.votable_type == "Pitch"
        vote["votable_title"] = vote_obj.votable.title
        vote["votable_tagline"] = vote_obj.votable.tagline
      else
        vote["votable_title"] = vote_obj.votable.pitch.title
        vote["votable_parent_id"] = vote_obj.votable.pitch.id
        vote["votable_content"] = vote_obj.votable.content
      end

      vote
    end

    user_as_json["pitches"] = JSON.parse(user.pitches.to_json)
    user_as_json["pitches"].map! do |pitch|
      pitch["vote_count"] = Pitch.find(pitch["id"]).votes.count
      pitch
    end
    user_as_json["comments"] = JSON.parse(user.comments.to_json)
    user_as_json["comments"].map! do |comment|
      comment["vote_count"] = Comment.find(comment["id"]).votes.count
      comment["pitch_title"] = Comment.find(comment["id"]).pitch.title
      comment
    end

    user_as_json
  end

  def current_user(user)
    current_user_as_json = inject_extra_user_props(user)
    current_user_as_json["signed_in"] = true
  end

end
