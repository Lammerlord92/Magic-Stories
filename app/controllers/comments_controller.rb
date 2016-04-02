class CommentsController < ApplicationController

  #GET /comments/new
  def new
    @comment = Comment.new
    @idProfile = params[:id]
  end

  def create
    @comment = Comment.new(comment_params)

    if current_user.profile.present?
      @profile = Profile.find(@comment.profile_id)

      @comment.profile = @profile
      @comment.author = current_user.name + ' ' + current_user.surname1 + ' ' + current_user.surname2
      @comment.date = Date.current

      if @comment.save
        redirect_to @profile
      else
        render :new
      end
    else
      render 'errors/permission_denied'
    end
  end

  def comment_params
    params.require(:comment).permit(:title, :body, :rating, :date, :author, :profile_id)
  end

end