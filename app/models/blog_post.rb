class BlogPost < ApplicationRecord
    belongs_to(
        :user,
        class_name: 'User',
        foreign_key: 'user_id',
        inverse_of: :blog_posts
    )

    has_many :user_like_blog_posts, dependent: :destroy
    has_many :users, through: :user_like_blog_posts

    has_many :save_posts, dependent: :destroy
    has_many :users, through: :save_posts

    has_many :comments, dependent: :destroy
    has_many :users, through: :comments
end
