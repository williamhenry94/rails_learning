class ItemsController < ApplicationController
    # before action is performed before going to the method body
    # set todo validates if model id is found
    # model route binding
    before_action :set_todo
    before_action :set_todo_item, only: [:show, :update, :destroy]
    # @item is instance variables
    # any variable with @is class instance variable
    # private as default
    # like self.item in python

    # a class reserve method name
    # initialize => like __init__ in python

    # GET /items
    def index
        items = @todo.items
        json_response(items)
    end


    def create
        @todo.items.create!(item_params)
        json_response(@todo, :created)
    end

    def show
        json_response(@item)
    end


    def destroy
        @item.destroy
        head :no_content
    end


    def update
        @item.update(item_params)
        head :no_content
    end

    private
    
    def item_params
        params.permit(:name, :done)
    end


    def set_todo
        @todo = Todo.find(params[:todo_id])
    end


    def set_todo_item
        @item = Item.find(params[:id])
    end
end
