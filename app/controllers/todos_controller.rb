class TodosController < ApplicationController
  before_action :authenticate_user!
    def index
      @todos = current_user.todos
    end


    def update
      todo = Todo.find(params[:todo_id])
      todo.completed = !todo.completed
      todo.save
      redirect_to todos_path
    end

    def show
      todo = Todo.find(params[:todo_id])
      @task = todo.task
      @todos = Todo.where(task_id: @task.id, completed: true)
    end
end
