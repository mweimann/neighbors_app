class CreateTools < ActiveRecord::Migration
  def change
    create_table :tools do |t|
      t.string :tool_name
      t.integer :user_id
      t.boolean :placeholder, :default => true

      t.timestamps

    end
  end
end
