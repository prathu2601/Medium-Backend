class FollowsUsersTopicsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def isFollowed 
        @user  = User.find(params[:user_id])
        @topic = Topic.find(params[:topic_id])
        render json: @user.following_topic?(@topic)
    end

    def toggleFollow 
        @user  = User.find(params[:user_id])
        @topic = Topic.find(params[:topic_id])
        if @user.following_topic?(@topic)
            @user.unfollow_topic(@topic)
        else 
            @user.follow_topic(@topic) 
        end

        render json: @user.following_topic?(@topic)
    end

    def getAllFollows 
        
        @user = User.find(params[:id])
        render json: @user.followed_topics
    end
end