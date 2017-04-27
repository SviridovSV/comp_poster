class CreatePosters < ActiveRecord::Migration
  def change
    create_table :posters do |t|
      t.text :content
      t.integer :user_id

      t.timestamps null: false
    end
    add_index :posters, [:user_id, :created_at]
  end
end
