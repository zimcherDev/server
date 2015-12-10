class CreateZims < ActiveRecord::Migration
  def change
    create_table :zims do |t|
      t.string :name
      t.text :description
      t.string :image_url
      t.string :publicity

      t.timestamps null: false
    end
  end
end
