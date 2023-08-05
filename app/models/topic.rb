class Topic < ApplicationRecord
    has_many :follows_users_topics, dependent: :destroy
    has_many :followers, through: :follows_users_topics, source: :user
end
