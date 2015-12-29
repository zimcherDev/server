class CreatePostcontents < ActiveRecord::Migration
  def change
    create_table :postcontents do |t|
      t.string :description
      t.text :media_url
      t.string :media_type
      t.belongs_to :post, index: true

      t.timestamps null: false
    end
    add_foreign_key :postcontents, :posts
  end
end
