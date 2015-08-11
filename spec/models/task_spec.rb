require 'rails_helper'

RSpec.describe Task, type: :model do
  it "can not have a start date in the past" do
    valid_task = Task.create(title: "Taskytask",
                             notes: "New Task",
                             start_date: Date.today + 1 )

    expect(valid_task).to be_valid

    invalid_task = Task.create(title: "Taskytask",
                             notes: "New Task",
                             start_date: Date.today - 1 )

    expect(invalid_task).to_not be_valid
  end

  it "can not have a due date in the past" do
    valid_task = Task.create(title: "Taskytask",
                             notes: "New Task",
                             due_date: Date.today + 1 )

    expect(valid_task).to be_valid

    invalid_task = Task.create(title: "Taskytask",
                             notes: "New Task",
                             due_date: Date.today - 1 )

    expect(invalid_task).to_not be_valid
  end


  it{ should validate_presence_of :title }
end
