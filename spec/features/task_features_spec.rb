require "rails_helper"

RSpec.feature "List", :type => :feature do
    before(:each) do
      @list = create_new_list
    end

  scenario "User can create a new task" do

    visit root_path

    within(".list_list") do
      click_link @list.title
    end

    expect(current_path).to eq(list_path(@list))

    click_button "Create New Task"

    expect(current_path).to eq(new_task_path)

    




  end
end
