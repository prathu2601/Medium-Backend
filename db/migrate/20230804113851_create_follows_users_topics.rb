class CreateFollowsUsersTopics < ActiveRecord::Migration[7.0]
  def change
    create_table :follows_users_topics do |t|
      t.integer :user_id
      t.integer :topic_id

      t.timestamps
    end
  end
end
