class TasksController < ApplicationController
  def create
    result = TaskService.create(task_params.to_h)

    return render json: { errors: result.value }, status: :unprocessable_entity if result.failure?
    
    render json: result.value, status: :created
  end

  private

  def task_params
    params.require(:task).permit(:todo_list_id, :description, :due_date, :completed)
  end
end