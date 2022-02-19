class FixColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :articles, :author, :user_id
  end
end
