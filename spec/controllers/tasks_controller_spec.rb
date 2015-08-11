require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  let(:list) {List.create!(title: "Task Test List", description: "Description")}

  let(:valid_attributes) {
    {title: "Task", start_date: Date.today + 2,
     due_date: Date.today + 4,
     notes: "Hello",
     list_id: list.id}
  }

  let(:invalid_attributes) {
    {title: "", start_date: Date.today - 2, due_date: Date.today - 4}
  }


  describe "GET #index" do
    it "assigns all tasks as @tasks" do
      task = Task.create! valid_attributes
      get :index
      expect(assigns(:tasks)).to eq([task])
    end
  end

  describe "GET #show" do
    it "assigns the requested task as @task" do
      task = Task.create! valid_attributes
      get :show, {:id => task.to_param}
      expect(assigns(:task)).to eq(task)
    end
  end

  describe "GET #new" do
    it "assigns a new task as @task" do
      get :new
      expect(assigns(:task)).to be_a_new(Task)
    end
  end

  describe "GET #edit" do
    it "assigns the requested task as @task" do
      task = Task.create! valid_attributes
      get :edit, {:id => task.to_param}
      expect(assigns(:task)).to eq(task)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Task" do
        expect {
          post :create, {:task => valid_attributes}
        }.to change(Task, :count).by(1)
      end

      it "redirects to the created task" do
        post :create, {:task => valid_attributes}
        expect(response).to redirect_to(list)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { title: "New Title" }
      }

      it "updates the requested task" do
        task = Task.create! valid_attributes
        put :update, {:id => task.to_param, :task => new_attributes}
        task.reload
        expect(task.title).to eq("New Title")
      end

      it "redirects to the task" do
        task = Task.create! valid_attributes
        put :update, {:id => task.to_param, :task => valid_attributes}
        expect(response).to redirect_to(list)
      end
    end
  end
end
