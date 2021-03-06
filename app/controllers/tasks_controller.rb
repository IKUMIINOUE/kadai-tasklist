class TasksController < ApplicationController
    before_action :require_user_logged_in , only: [:new,:show]
    before_action :set_task, only:[:show, :edit, :update, :destroy]
    def index
       @tasks = Task.all
    end

    def show
    end

    def new
       @task = Task.new
       
    end

    def create
        @task = current_user.tasks.build(task_params)
        if @task.save
            flash[:success] = "Taskが正常に追加されました"
            redirect_to root_url
        else
            @task = current_user.tasks.order(id: :desc).page(params[:page])
            flash.now[:danger] = "Taskが追加されませんでした"
            render :new
        end
    end

    def edit
    end

    def update
        if @task.update(task_params)
            flash[:success] = "Taskは正常に更新されました"
            redirect_to @task
        else
            flash.now[:danger] = "Taskは更新されませんでした"
            render :edit
        end
    end

    def destroy
        set_task
        @task.destroy

        flash[:success] = "Taskは正常に削除されました"
        redirect_to tasks_url
    end

    private 
    
    def set_task
        @task = Task.find(params[:id])
    end

    def task_params
        params.require(:task).permit(:content,:status)
    end
end 
