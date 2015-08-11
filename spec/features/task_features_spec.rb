require "rails_helper"

RSpec.feature "List", :type => :feature do
    before(:each) do
      @list = create_new_list
    end

    let!(:premade_task) {Task.create!(title: "Premade Task",
                                      notes: "This is a note",
                                      list_id: @list.id)}

  scenario "User can create a new task" do

    visit root_path

    within(".list_list") do
      click_link @list.title
    end

    expect(current_path).to eq(list_path(@list))

    click_link "Create New Task"

    expect(current_path).to eq(new_task_path)
    fill_in "task[title]", with: "New Task"
    fill_in "task[notes]", with: "Notes for New Task"
    fill_in "task[start_date]", with: "08/29/2015"
    fill_in "task[due_date]", with: "08/30/2015"
    click_button "Create Task"
    expect(current_path).to eq(list_path(@list))
    expect(page).to have_css(".flash_success")
    expect(page).to have_content("New Task")
  end

  scenario "User can update an existing task" do
    visit root_path

    within(".list_list") do
      click_link @list.title
    end

    click_link premade_task.title

    expect(current_path).to eq(edit_task_path(premade_task))
    fill_in "task[title]", with: "Updated Task"
    click_button "Update Task"
    expect(current_path).to eq(list_path(@list))
    expect(page).to have_css(".flash_success")
    expect(page).to have_content("Updated Task")
  end

  xscenario "User can not set task start date before current date" do
    visit root_path

    within(".list_list") do
      click_link @list.title
    end

    expect(current_path).to eq(list_path(@list))

    click_link "Create New Task"

    expect(current_path).to eq(new_task_path)
    fill_in "task[title]", with: "bad start date Task"
    fill_in "task[notes]", with: "Notes for bad Task"
    fill_in "task[start_date]", with: "07/29/2015"
    fill_in "task[due_date]", with: "07/30/2015"
    click_button "Create Task"
    expect(current_path).to eq(list_path(@list))
    expect(page).to have_css(".flash_danger")
    expect(page).to_not have_content("bad start date Task")
  end

  scenario "User should only see incomplete tasks" do
    complete_task = Task.create!(title: "Complete task", status: true)

    visit root_path

    within(".list_list") do
      click_link @list.title
    end
    expect(page).to have_content(premade_task.title)

    expect(page).to_not have_content(complete_task.title)
  end



end
