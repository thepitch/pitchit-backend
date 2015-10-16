module CommentHelper
  def inject_extra_comment_props(input)
    comment = JSON.parse(input.to_json)
      comment["created_at"] = "#{time_ago_in_words(comment["created_at"])} ago"
      comment["vote_count"] = Comment.find(comment["id"]).votes.count
      comment["subcomment_count"] = Comment.find(comment["id"]).subcomments.count
      comment["author"] = Comment.find(comment["id"]).user.full_name
      comment
  end
end