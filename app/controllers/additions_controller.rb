class AdditionsController < ActionController::Base

  def create
    id = params[:story_id]

    @addition= Addition.new
    @addition.purchase_date = Date.current
    story = Story.find(id)
    @addition.base_price = story.price
    @addition.discount_id = nil
    profile = Profile.find_by_user_id(current_user.id)
    @addition.profile_id = profile.id
    @addition.story_id = id

    if @addition.save
     redirect_to '/stories'
    else
      redirect_to '/stories/1'
    end
  end

  def addition_params
    params.require(:addition).permit(:purchase_date,:base_price,:discount_id, :profile_id, :story_id)
  end

end