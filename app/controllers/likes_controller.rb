class LikesController < ApplicationController
    def create
        @like = current_user.likes.new(tweet_id: params[:id])
        @like.save
        redirect_to tweets_url
    end
    
    def destroy
        @like = current_user.likes.find_by(tweet_id: params[:id])
        @like.destroy
        redirect_to tweets_url
    end
end
