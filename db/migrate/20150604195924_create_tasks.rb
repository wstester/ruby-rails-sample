class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :task_text
      t.boolean :is_complete

      t.timestamps null: false
    end
  end
end
