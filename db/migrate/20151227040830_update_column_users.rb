class UpdateColumnUsers < ActiveRecord::Migration
  def change
    change_column :users, :image_url, :text
  end
end
