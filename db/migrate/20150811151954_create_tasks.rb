class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.boolean :status
      t.string :notes
      t.date :due_date
      t.date :start_date

      t.timestamps null: false
    end
  end
end
