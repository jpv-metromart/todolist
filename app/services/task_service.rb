class TaskService
  # Steps:
  # 1. Instantiate contract
  # 2. Create TaskInput struct from params
  # 3. Validate TaskInput with contract
  # 4. If valid, create/update Task record in database
  # 5. If invalid, return validation errors
  # 6. Return .success or .failure
  
  ResultData = Result::Data

  def self.create(params)
    validation = validate(params)
    return validation if validation.failure?

    task = Task.create!(validation.value.to_h)
    ResultData.success(TaskSummary.from_model(task))
  end

  def self.update(task, params)
    validation = validate(params)
    return validation if validation.failure?

    task.update!(validation.value.to_h)
    ResultData.success(TaskSummary.from_model(task))
  end

  private

  def self.contract
    @contract ||= TaskContract.new
  end

  def self.validate(params)
    result = contract.call(params)
    return ResultData.failure(result.errors.to_h) if result.failure?

    unless TodoList.exists?(params[:todo_list_id])
      return ResultData.failure(todo_list_id: ['must be a valid todo list ID'])
    end
    
    ResultData.success(TaskInput.new(result.to_h))
  end

  # Result = Data.define(:success?, :data) do
  #   def self.success(value) = new(success: true, value: value)
  #   def self.failure(value) = new(success: false, value: value)
  #   def failure? = !success?
  # end

end