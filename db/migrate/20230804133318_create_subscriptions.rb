class CreateSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :tierfree
      t.boolean :tier3d
      t.boolean :tier5d
      t.boolean :tier10d
      t.integer :allowedViews

      t.timestamps
    end
  end
end
