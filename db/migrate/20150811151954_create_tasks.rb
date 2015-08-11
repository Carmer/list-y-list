class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.boolean :status, default: false
      t.string :notes
      t.date :due_date
      t.date :start_date

      t.timestamps null: false
    end
  end
end
