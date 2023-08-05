Rails.application.routes.draw do
  post "/user/signup", to: "users#create"
  post "/user/signin", to: "users#signin"
  delete "/user/signout", to: "users#signout"

  post "/user/edit", to:"users#edit"
  get "/user/:id", to: "users#show"

  get "/is_liked/", to: "user_like_blog_posts#isLiked"
  post "/togglt_like/", to: "user_like_blog_posts#toggleLike"
  get "/get_total_likes/", to: "user_like_blog_posts#getTotalLikes"

  get "/comments/", to: "comments#show"
  post "/create_comment/", to: "comments#create"
  delete "/destroy_comment/", to: "comments#destroy"

  get "/is_followed/", to: "follows#isFollowed"
  post "/toggle_follow/", to: "follows#toggleFollow"
  get "/all_follows/:id", to: "follows#getAllFollows"

  get "/is_user_followe_topic/", to: "follows_users_topics#isFollowed"
  post "/toggle_follow_topic/", to: "follows_users_topics#toggleFollow"
  get "/all_topic_follows/:id", to: "follows_users_topics#getAllFollows"
  
  post "/subscriptions/", to: "subscriptions#subscriptions"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post "/blog_posts/create", to:"blog_posts#create"
  post "/blog_posts/edit", to:"blog_posts#edit"
  delete "/blog_posts/destroy/:id", to: "blog_posts#destroy"

  get "/blog_posts/search/", to: "blog_posts#search"
  get "/blog_posts/recomendation/", to: "blog_posts#recomendation"
  get "/blog_posts/readingtime/:id", to: "blog_posts#readingtime"
  get "/blog_posts/user/:id", to: "blog_posts#showUserPost"
  get "/blog_posts/:id", to: "blog_posts#show"

  # Defines the root path route ("/")
  # root "articles#index"
  root "blog_posts#index"
end
