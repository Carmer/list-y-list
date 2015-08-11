require "rails_helper"

RSpec.feature "List", :type => :feature do
  scenario "User can create a new list" do
    visit root_path

    click_button "Create New List"

    fill_in "list[title]", with: "New Todo List"
    fill_in "list[description]", with: "New Todo List Description"
    click_button "Submit List"

    expect(page).to have_content("New Todo List")
    expect(page).to have_content("New Todo List Description")
  end

  scenario "User cannot create a new list with a blank title" do
    visit root_path

    click_button "Create New List"

    fill_in "list[title]", with: ""
    fill_in "list[description]", with: "New Todo List Description"
    click_button "Submit List"

    expect(page).to_not have_content("New Todo List Description")
    expect(page).to have_content("Title can't be blank")
  end

  scenario "User can rename an existing list with valid attributes" do
    list = create_new_list

    visit root_path

    within(".list_list") do
      click_link "Test List Title"
    end
    expect(current_path).to eq(list_path(list))

    click_button "Edit"
    expect(current_path).to eq(edit_list_path(list))

    fill_in "list[title]", with: "New Todo List"
    fill_in "list[description]", with: "New Todo List Description"
    click_button "Submit List"

    expect(page).to have_content("New Todo List")
    expect(page).to have_content("New Todo List Description")
  end

  scenario "User cannot rename an existing list with a blank title" do
    list = create_new_list

    visit root_path

    within(".list_list") do
      click_link "Test List Title"
    end
    expect(current_path).to eq(list_path(list))

    click_button "Edit"
    expect(current_path).to eq(edit_list_path(list))

    fill_in "list[title]", with: ""
    fill_in "list[description]", with: "I will not see this description"
    click_button "Submit List"

    expect(page).to_not have_content("I will not see this description")
    expect(page).to have_content("Title can't be blank")
  end

  scenario "User can delete a list" do
    list = create_new_list

    visit root_path

    within(".list_list") do
      click_link "Test List Title"
    end
    expect(current_path).to eq(list_path(list))

    click_button "Delete"

    expect(page).to have_css(".flash_danger")
    expect(page).to have_content("List Deleted")
  end
end
