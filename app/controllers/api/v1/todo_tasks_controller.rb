# frozen_string_literal: true

class Api::V1::TodoTasksController < Api::V1::BaseController
  before_action :set_todo_task, only: %i[update destroy]

  def index
    render json: current_user.todo_tasks
  end

  def create
    TodoTask.create!(todo_task_params.merge(user: current_user))

    head :created
  end

  def update
    @todo_task.update(todo_task_params)

    render json: @todo_task
  end

  def destroy
    @todo_task.destroy

    head :deleted
  end

  private

  def set_todo_task
    @todo_task = current_user.todo_tasks.find(params[:id])
  end

  def todo_task_params
    params.require(:todo_task).permit(:title, :description, :status)
  end
end
