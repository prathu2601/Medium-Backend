class CommentsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def show 
        render json: Comment.where(blog_post_id: params[:blog_post_id])
    end

    def create 
        @comment = Comment.new(comment_params)
        if @comment.save
            render json: @comment, notice: 'Comment was successfully created.'
        else
            render json: {}, status: :unprocessable_entity
        end
    end

    def destroy 
        @comment = Comment.find(params[:id])
        @comment.destroy
        render json: {}, notice: 'Comment was successfully destroyed.'
    end

    private
    def comment_params
        params.permit(:user_id, :blog_post_id, :body)
    end
end