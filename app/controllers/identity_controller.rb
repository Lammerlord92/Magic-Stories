class IdentityController < ApplicationController
  def create_session
    auth = request.env["omniauth.auth"]
    identity  = Identity.find_by_oauth(auth)
    puts auth
    puts 'Puts auth'
    puts auth["info"].to_hash
    puts auth.to_json


    if(User.where({identity: identity}).nil? && auth.provider == "twitter")
      info = auth["info"].to_hash
      identity = Identity.new({uid: auth["uid"], provider: auth["provider"]})
      profile = Profile.new({})
      @user = User.new({identity: identity, username: auth["info"]["nickname"], email: auth["info"]["email"]})
      redirect_to

    elsif(User.where({identity: identity}).nil? and auth.provider == "facebook")
      auth.to_json
      auth1 = auth.to_json
      first_name = auth1["first_name"]
      last_name = auth1["last_name"]
      age = auth1["extra"]["raw_info"]["age_range"]["min"]
      gender = auth1["extra"]["gender"]
      profile = Profile.new({name: auth1["name"], avatar: auth1["image"], description: auth1["about_me"]})

    else

    end


  end

end
