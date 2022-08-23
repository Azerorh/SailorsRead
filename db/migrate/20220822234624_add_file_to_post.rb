class AddFileToPost < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :file_path, :string
  end
end
