class SubscriptionsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def subscriptions 
        if session[:user_id] == nil
            render json: {}, notice: 'SignUp / Signin to read the blog...'
        end
        
        @subscription = Subscription.where(user_id: params[:user_id])[0]
        @subscription.tierfree = params[:tierfree]
        @subscription.tier3d   = params[:tier3d]
        @subscription.tier5d   = params[:tier5d]
        @subscription.tier10d  = params[:tier10d]

        if @subscription.tierfree
            @subscription.allowedViews = 1
        elsif @subscription.tier3d
            @subscription.allowedViews = 3
        elsif @subscription.tier5d
            @subscription.allowedViews = 5
        elsif @subscription.tier10d
            @subscription.allowedViews = 10
        end
        @subscription.save
        render json: @subscription, notice: 'Subscription added...'
    end
end