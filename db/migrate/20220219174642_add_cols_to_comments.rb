class AddColsToComments < ActiveRecord::Migration[6.1]
    def change
      add_column :comments, :body, :text
      add_column :comments, :user_id, :integer
      add_column :comments, :article_id, :integer
    end
 end
