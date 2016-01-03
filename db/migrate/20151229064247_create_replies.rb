class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.string :comment
      t.belongs_to :post, index: true
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :replies, :posts
    add_foreign_key :replies, :users
  end
end
