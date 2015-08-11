class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @list = List.find_by!(id: params[:id])
  end

  def new
    @list = List.new
  end

  def edit
    @list = List.find_by!(id: params[:id])
  end

  def create
    list = List.new(list_params)
    if list.save
      flash[:success] = "List Added"
      redirect_to list
    else
      flash[:danger] = list.errors.full_messages.join(", ")
      redirect_to request.referrer
    end
  end

  def update
    list = List.find_by!(id: params[:id])
    list.update(list_params)
    redirect_to list
  end

  def destroy
    list = List.find_by!(id: params[:id])
    list.destroy
    redirect_to lists_path
  end

  private

  def list_params
    params.require(:list).permit(:title, :description)
  end
end
