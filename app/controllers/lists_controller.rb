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
    if list.save
      flash[:success] = "List Updated"
      redirect_to list
    else
      flash[:danger] = list.errors.full_messages.join(", ")
      redirect_to request.referrer
    end
  end

  def destroy
    list = List.find_by!(id: params[:id])
    if list.destroy
      flash[:danger] = "List Deleted"
      redirect_to lists_path
    else
      flash[:danger] = "An error occured while trying to delete your list. Please try again"
      redirect_to request.referrer
    end
  end

  private

  def list_params
    params.require(:list).permit(:title, :description)
  end
end
