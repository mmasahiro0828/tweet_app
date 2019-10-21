class TweetsController < ApplicationController
  before_action :login_required, except: [:index, :show]
  
  def index
    @tweets = Tweet.all
  end

  def show
    @tweet = Tweet.find(params[:id])
    @user = User.find_by(id: @tweet.user_id)
  end

  def new
    @tweet = Tweet.new
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end
  
  def create
    @tweet = current_user.tweets.new(tweet_params)
    
    if @tweet.save
      redirect_to tweets_url, notice: "投稿を作成しました。"
    else
      render :new
    end
    
  end
  
  def update
    @tweet = Tweet.find(params[:id])
    
    if @tweet.update(tweet_params)
      redirect_to tweets_url, notice: "投稿を編集しました。"
    else
      render :edit
    end
    
  end
  
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to tweets_url, notice: "投稿を削除しました。"
  end
  
  
  
  private
  
  def tweet_params
    params.require(:tweet).permit(:description)
  end
end
