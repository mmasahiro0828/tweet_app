class LikesController < ApplicationController
    def create
        @tweet = Tweet.find_by(id: params[:id])
        @like = current_user.likes.new(tweet_id: params[:id])
        @like.save
    end
    
    def destroy
        @tweet = Tweet.find_by(id: params[:id])
        @like = Like.find_by(tweet_id: params[:id], user_id: current_user.id)
        @like.destroy
    end
end
