class CreateInstructions < ActiveRecord::Migration[5.0]
  def change
    create_table :instructions do |t|
      t.string :url_youtube
      t.integer :user_id

      t.timestamps
    end
    add_index :instructions, [:user_id, :created_at]
  end
end
