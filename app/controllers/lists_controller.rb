class ListsController < ApplicationController
  before_action :set_list, only: [:show, :destroy]

  def index
    @lists = List.all
  end

  def show
    @bookmark = Bookmark.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(task_params)
    @list.save
    redirect_to lists_path
  end

  def destroy
    @list.destroy
    redirect_to lists_path
  end
end

private

def set_list
  @list = List.find(params[:id])
end

def task_params
  params.require(:list).permit(:name)
end
