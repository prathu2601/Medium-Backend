class BlogPostsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index 
        render json: BlogPost.all
    end

    def show 
        @blog_post = BlogPost.where(id: params[:id])[0]
        if session[:user_id] == nil
            render json: {}, notice: 'SignUp / Signin to read the blog...'
        else 
            if session[:user_id] == @blog_post.user_id
                render json: @blog_post
            else 
                @subscription = Subscription.where(user_id: session[:user_id])[0]
                if @subscription.allowedViews > 0
                    @subscription.allowedViews = @subscription.allowedViews-1
                    @subscription.save
                    render json: @blog_post
                else 
                    render json: {}, notice: 'Upgrade your subscription to view more...'
                end
            end
        end
    end

    def showUserPost 
        @blog_post = BlogPost.where(user_id: params[:id])
        render json: @blog_post, notice: 'Successfully fecthed all user posts.'
    end

    def create
        @blog_post = BlogPost.new(blog_post_params)
        if @blog_post.save
            render json: @blog_post
        else 
            render json: {}, status: :unprocessable_entity
        end
    end

    def edit
        @blog_post = BlogPost.find(params[:id])
        if @blog_post.update(blog_post_params)
            render json: @blog_post
        else 
            render json: {}, status: :unprocessable_entity
        end
    end

    def destroy
        @blog_post = BlogPost.find(params[:id])
        @blog_post.destroy
        render json: {}
    end

    def search 
        @blog_post    = []
        if params[:user_id]
            @blog_post1 = BlogPost.where(user_id: params[:user_id])
            @blog_post = @blog_post + @blog_post1
        end

        if params[:topic]
            @blog_post2 = BlogPost.where(topic: params[:topic])
            @blog_post = @blog_post + @blog_post2
        end

        if params[:post] and params[:post].length > 0
            @blog_post3 = BlogPost.where("title like ?", "%#{params[:post]}%")
            @blog_post = @blog_post + @blog_post3
        end

        if params[:post] and params[:post].length > 0
            @blog_post4 = BlogPost.where("body like ?", "%#{params[:post]}%")
            @blog_post = @blog_post + @blog_post4
        end

        render json: @blog_post, notice: 'Search Reults'
    end

    def recomendation
        @topics = FollowsUsersTopic.where(user_id: params[:user_id]).to_a
        @blog_posts = []

        for @topic in @topics
            @helper = BlogPost.where("topic like ?", "%#{Topic.find(@topic.topic_id).topicname}%")
            @blog_posts = @blog_posts + @helper
        end
        
        render json: @blog_posts
    end

    def readingtime 
        @blog_post = BlogPost.find(params[:id])
        render json: (((@blog_post.title + @blog_post.topic + @blog_post.body).split.size)/100.0).ceil()
    end

    private 
    def blog_post_params
        params.permit(:title, :topic, :body, :imgurl, :views, :user_id)
    end
end