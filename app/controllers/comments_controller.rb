class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @comment = Comment.new
    @idStory = params[:id_story]
  end

  def create
    if current_user.profile.present?
      @comment = Comment.new(comment_params)
      story = Story.find(@comment.story_id)
      @comment.story = story
      @comment.profile = current_user.profile
      @comment.date = Date.current
      if @comment.save
        redirect_to story
      else
        @idStory = @comment.story_id
        render :new
      end
    else
      render 'errors/permission_denied'
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @idStory = params[:id_story]
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.date = Date.current
    story = Story.find(@comment.story_id)
    if @comment.update(comment_params)
      redirect_to story
    else
      render :edit
    end
  end

  def comment_params
    params.require(:comment).permit(:title, :body, :story_id)
  end

end
