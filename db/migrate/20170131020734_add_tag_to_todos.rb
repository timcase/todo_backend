class AddTagToTodos < ActiveRecord::Migration[5.0]
  def change
    add_column :todos, :tag, :string
  end
end
