class UserLikeBlogPostsController < ApplicationController 
    skip_before_action :verify_authenticity_token

    def isLiked
        render json: UserLikeBlogPost.where(user_id: params[:user_id], blog_post_id: params[:blog_post_id])
    end

    def toggleLike 
        like = UserLikeBlogPost.where(user_id: params[:user_id], blog_post_id: params[:blog_post_id])
        if like.length == 0
            UserLikeBlogPost.create(user_id: params[:user_id], blog_post_id: params[:blog_post_id])
        else
            like[0].destroy
        end

        render json: UserLikeBlogPost.all
    end

    def getTotalLikes 
        render json: UserLikeBlogPost.where(blog_post_id: params[:blog_post_id])
    end

end