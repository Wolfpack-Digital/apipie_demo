# frozen_string_literal: true

class CreateTodoTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :todo_tasks do |t|
      t.references :user
      t.string :title
      t.text :description
      t.integer :status, default: 0, null: false

      t.timestamps
    end
  end
end
