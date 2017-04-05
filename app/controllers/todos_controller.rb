class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :update, :destroy]

  # GET /todos
  def index
    @todos = scope.todos

    render json: @todos
  end

  # GET /todos/1
  def show
    render json: @todo
  end

  # POST /todos
  def create
    @todo = scope.todos.build(todo_params)

    if @todo.save
      render json: @todo, status: :created, location: @todo
    else
      debugger
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /todos/1
  def update
    if @todo.update(todo_params)
      render json: @todo
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /todos/1
  def destroy
    @todo.destroy
  end

  def scope
    @scope ||= find_scope
  end

  def find_scope
    return User.find(params[:user_id]) if params[:user_id]
    return Department.find(params[:department_id]) if params[:department_id]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      if params[:user_id].nil? and params[:department_id].nil?
        @todo = Todo.find(params[:id])
      else
        @todo = scope.todos.find(params[:id])
      end
    end

    # Only allow a trusted parameter "white list" through.
    def todo_params
      params.require(:todo).permit(:text, :completed, :tag, :user_id)
    end
end
