class TodosController < ApplicationController
    before_action :set_todo, only: [:show, :update, :destroy]
    # @todo is instance variables
    # any variable with @is class instance variable
    # private as default
    # like self.todo in python

    # a class reserve method name
    # initialize => like __init__ in python

    
    # GET /todos
    def index
        todos = Todo.includes(:items).all
        logger.debug todos[0].items
        @todos = todos
        json_response(@todos)
    end


    def create
        @todo = Todo.create!(todo_params)
        # :created 201
        json_response(@todo, :created)
    end

    def show
        json_response(@todo)
    end


    def destroy
        @todo.destroy
        head :no_content
    end


    def update
        @todo.update(todo_params)
        head :no_content
    end

    private

    def todo_params
        params.permit(:title, :created_by)
    end


    def set_todo
        @todo = Todo.find(params[:id])
    end
end
