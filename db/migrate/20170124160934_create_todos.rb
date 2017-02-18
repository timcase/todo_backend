class CreateTodos < ActiveRecord::Migration[5.0]
  def change
    create_table :todos do |t|
      t.text :text
      t.boolean :completed
      t.integer :user_id

      t.timestamps
    end
  end
end
