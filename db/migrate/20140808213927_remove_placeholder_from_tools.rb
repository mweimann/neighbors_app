class RemovePlaceholderFromTools < ActiveRecord::Migration
  def change
    remove_column :tools, :placeholder
  end
end
