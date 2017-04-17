class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
 
  def index
    @tasks = Task.all
  end
  
  def show
  end

  def new
     @tasks = Task.new
  end

  def create
     @tasks = Task.new(task_params)
    if @tasks.save
      flash[:success] = 'task が正常に投稿されました'
      redirect_to @tasks
    else
      flash.now[:danger] = 'task が投稿されませんでした'
      render :new
    end
  end

  def edit
  end

  def update
    @tasks = Task.find(params[:id])

    if @tasks.update(task_params)
      flash[:success] = 'task は正常に更新されました'
      redirect_to @tasks
    else
      flash.now[:danger] = 'task は更新されませんでした'
      render :edit
    end
    
  end

  def destroy
    @tasks.destroy

    flash[:success] = 'task は正常に削除されました'
    redirect_to tasks_url
  end
  
  private
  
  def set_task
    @tasks =Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:content,:status)
  end
end