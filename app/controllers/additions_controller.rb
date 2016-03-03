class AdditionsController < ActionController::Base

  def create
    id = params[:story_id]
    @addition= Addition.new(:purchase_date=)
    if @addition.save
     redirect_to url_for (:controller => :StoriesController, :action => :show_stories_acquired)
    else
      redirect_to url_for (:controller => :StoriesController, :action => :show)
    end
  end

  def addition_params
    params.require(:addition).permit(:purchase_date,:base_price,:discount_id, :profile_id, :story_id)
  end

end