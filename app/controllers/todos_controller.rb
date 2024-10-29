# class TodosController < ApplicationController
# end
class TodosController < ApplicationController
    def index
      @todos = Todo.where(user_id: params[:user_id])
      render json: @todos
    end
  
    def create
      @todo = Todo.new(todo_params)
      @todo.user_id = params[:user_id]  # Associates todo with user
      if @todo.save
        render json: @todo, status: :created
      else
        render json: @todo.errors, status: :unprocessable_entity
      end
    end
  
    def update
      @todo = Todo.find(params[:id])
      if @todo.update(todo_params)
        render json: @todo
      else
        render json: @todo.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @todo = Todo.find(params[:id])
      @todo.destroy
      head :no_content
    end
  
    private
  
    def todo_params
      params.require(:todo).permit(:task, :completed)
    end
  end
  
