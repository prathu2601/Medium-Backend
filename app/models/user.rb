class User < ApplicationRecord
    has_secure_password
    has_many(
        :blog_posts,
        class_name: 'BlogPost',
        foreign_key: 'user_id',
        inverse_of: :user,
        dependent: :destroy
    )

    has_many :user_like_blog_posts, dependent: :destroy
    has_many :blog_posts, through: :user_like_blog_posts

    has_many :save_posts, dependent: :destroy
    has_many :blog_posts, through: :save_posts

    has_many :comments, dependent: :destroy
    has_many :blog_posts, through: :comments

    validates :email, presence: true, uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: { minimum: 6 }

    has_many :follows_as_follower, class_name: 'Follow', foreign_key: 'follower_id', dependent: :destroy
    has_many :followed_users, through: :follows_as_follower, source: :followed
    has_many :follows_as_followed, class_name: 'Follow', foreign_key: 'followed_id', dependent: :destroy
    has_many :followers, through: :follows_as_followed, source: :follower

    def follow(user)
        followed_users << user unless self == user
    end

    def unfollow(user)
        followed_users.delete(user)
    end

    def following?(user)
        followed_users.include?(user)
    end

    has_many :follows_users_topics, dependent: :destroy
    has_many :followed_topics, through: :follows_users_topics, source: :topic

    def follow_topic(topic)
        followed_topics << topic
    end

    def unfollow_topic(topic)
        followed_topics.delete(topic)
    end

    def following_topic?(topic)
        followed_topics.include?(topic)
    end

    has_one :subscription, dependent: :destroy
end
