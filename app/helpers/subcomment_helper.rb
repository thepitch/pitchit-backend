module SubcommentHelper
  def inject_extra_subcomment_props(input)
    subcomment = JSON.parse(input.to_json)
      subcomment["created_at"] = "#{time_ago_in_words(subcomment["created_at"])} ago"
      subcomment["author"] = Subcomment.find(subcomment["id"]).user.full_name
      subcomment
  end
end