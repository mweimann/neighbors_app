class AddAvailableToTools < ActiveRecord::Migration
  def change
    add_column :tools, :available, :boolean, :default => true
  end
end
