class CommentsController < ApplicationController
  def create
    tweet = Tweet.find(params[:tweet_id])
    comment = current_user.comments.build(comment_params)
    comment.tweet_id = tweet.id
    comment.save
    redirect_to tweets_path(tweet.id)
  end

  #def new
  #  @comment = Comment.new
  #end

  #def index
  #  @comments = Comment.all
  #end

  #def show
  #  @comment = Comment.find(params[:id])
  #  @user = @comment.user
  #end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
