class CommentsController < ApplicationController
  before_action :authenticate!

  #GET /comments/new
  def new
    @comment = Comment.new

    if params[:commentedClass].eql?('profile')
      @idProfile = params[:id]
    else
      @idStory = params[:id]
    end

    @commentedClass = params[:commentedClass]
  end

  def create
    @comment = Comment.new(comment_params)

    if current_user.profile.present?

      if @comment.profile_id.present?
        @profile = Profile.find(@comment.profile_id)
        @comment.profile = @profile
      else
        @story = Story.find(@comment.story_id)
        @comment.story = @story
      end

      @comment.author = current_user.name + ' ' + current_user.surname1 + ' ' + current_user.surname2
      @comment.date = Date.current


      if @comment.save
        if @comment.profile_id.present?
          redirect_to @profile
        else
          redirect_to @story
        end
      else
        @idProfile = @comment.profile_id
        @idStory = @comment.story_id

        if @idProfile.nil?
          @commentedClass = 'story'
        else
          @commentedClass = 'profile'
        end

        render :new
      end
    else
      render 'errors/permission_denied'
    end
  end

  def comment_params
    params.require(:comment).permit(:title, :body, :rating, :date, :author, :profile_id, :story_id)
    #params.require(:comment).permit(:title, :body, :rating, :date, :author, :class_id)
  end

end
