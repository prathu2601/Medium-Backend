class CreateUserLikeBlogPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :user_like_blog_posts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :blog_post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
