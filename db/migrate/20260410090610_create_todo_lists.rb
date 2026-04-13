class CreateTodoLists < ActiveRecord::Migration[7.2]
  def change
    create_table :todo_lists do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title,    null: false, limit: 255

      t.timestamps
    end

    add_index :todo_lists, [:user_id, :title, :created_at]
  end
end
