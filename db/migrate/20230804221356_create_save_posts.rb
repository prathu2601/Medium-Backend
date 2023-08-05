class CreateSavePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :save_posts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :blog_post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
