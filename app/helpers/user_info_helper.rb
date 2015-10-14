module UserInfoHelper

  def inject_extra_userprops(user)
    user_as_json = JSON.parse(user.to_json)


    user_as_json["full_name"] = user["first_name"] + " " + user["last_name"]
    user_as_json["votes"] = JSON.parse(user.votes.to_json) 
  end

end