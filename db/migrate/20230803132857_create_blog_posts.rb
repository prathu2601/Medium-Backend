class CreateBlogPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :blog_posts do |t|
      t.string :title
      t.string :topic
      t.text :body
      t.string :imgurl
      t.integer :views

      t.timestamps
    end
  end
end
