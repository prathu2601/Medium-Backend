class FollowsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def isFollowed 
        @user1 = User.find(params[:user1_id])
        @user2 = User.find(params[:user2_id])
        render json: @user1.following?(@user2)
    end

    def toggleFollow
        @user1 = User.find(params[:user1_id])
        @user2 = User.find(params[:user2_id])
        if @user1.following?(@user2)
            @user1.unfollow(@user2)
        else 
            @user1.follow(@user2) 
        end

        render json: @user1.following?(@user2)
    end

    def getAllFollows 
        @user1 = User.find(params[:id])
        render json: @user1.followed_users
    end
end