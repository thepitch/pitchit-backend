module PitchHelper

  def inject_extra_index_props(pitches)
    JSON.parse(pitches.to_json).map do |pitch|
      pitch["created_at"] = "#{time_ago_in_words(pitch["created_at"])} ago"
      pitch["vote_count"] = Pitch.find(pitch["id"]).votes.count
      pitch["comment_count"] = Pitch.find(pitch["id"]).comments.count
      pitch["author"] = Pitch.find(pitch["id"]).user.full_name
      pitch
    end
  end

  def inject_extra_show_props(pitch)
    pitch_as_json = JSON.parse(pitch.to_json)
    pitch_as_json["num_votes"] = pitch.votes.count
    pitch_as_json["comments"] = JSON.parse(pitch.comments.to_json)
    
    pitch_as_json["comments"].map! do |comment|
      comment["created_at"] = "#{time_ago_in_words(comment["created_at"])} ago"
      comment["vote_count"] = Comment.find(comment["id"]).votes.count
      comment["subcomment_count"] = Comment.find(comment["id"]).subcomments.count
      comment["author"] = Comment.find(comment["id"]).user.full_name
      comment["subcomments"] = JSON.parse(Comment.find(comment["id"]).subcomments.to_json)

      comment["subcomments"].map! do |subcomment|
        subcomment["created_at"] = "#{time_ago_in_words(subcomment["created_at"])} ago"
        subcomment["author"] = Subcomment.find(subcomment["id"]).user.full_name
        subcomment
      end

      comment 
    end

    pitch_as_json
  end

end