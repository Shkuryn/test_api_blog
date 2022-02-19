class AddColumncToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :header, :string
    add_column :articles, :body, :text
    add_column :articles, :author, :integer
    add_column :articles, :category, :string
  end
end
