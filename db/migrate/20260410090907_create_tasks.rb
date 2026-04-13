class CreateTasks < ActiveRecord::Migration[7.2]
  def change
    create_table :tasks do |t|
      t.references :todo_list,    null: false, foreign_key: true
      t.text :description
      t.boolean :completed,       null: false, default: false
      t.datetime :due_date
      t.datetime :completed_at
      

      t.timestamps
    end

    add_index :tasks, [:todo_list_id, :due_date]
    add_index :tasks, :completed
    add_index :tasks, :completed_at
  end
end
