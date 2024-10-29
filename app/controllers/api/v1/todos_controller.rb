# class Api::V1::TodosController < ApplicationController
# end
module Api
    module V1
      class TodosController < ApplicationController
        before_action :set_todo, only: [:show, :update, :destroy]
  
        # GET /todos
        def index
          @todos = Todo.where(user_id: params[:user_id]) # Assumes we pass user_id as a param
          render json: @todos
        end
  
        # POST /todos
        def create
          @todo = Todo.new(todo_params)
          @todo.user_id = params[:user_id] # Associate with the current user
  
          if @todo.save
            render json: @todo, status: :created
          else
            render json: @todo.errors, status: :unprocessable_entity
          end
        end
  
        # GET /todos/:id
        def show
          render json: @todo
        end
  
        # PATCH/PUT /todos/:id
        def update
          if @todo.update(todo_params)
            render json: @todo
          else
            render json: @todo.errors, status: :unprocessable_entity
          end
        end
  
        # DELETE /todos/:id
        def destroy
          @todo.destroy
          head :no_content
        end
  
        private
  
        # Use callbacks to share common setup or constraints between actions.
        def set_todo
          @todo = Todo.find(params[:id])
        end
  
        # Only allow a list of trusted parameters through.
        def todo_params
          params.require(:todo).permit(:title, :completed)
        end
      end
    end
  end
  