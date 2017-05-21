class AddImageToArticles < ActiveRecord::Migration[5.0]
  def change
    add_index :articles, :image, unique: true
  end
end
