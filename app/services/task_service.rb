class TaskService
  # Steps:
  # 1. Instantiate contract
  # 2. Create TaskInput struct from params
  # 3. Validate TaskInput with contract
  # 4. If valid, create/update Task record in database
  # 5. If invalid, return validation errors
  # 6. Return .success or .failure
  
  Contract = TaskContract.new
  ResultData = Result::Data

  def self.create(params)
    validation = validate(params)
    return validation if validation.failure?
    
    task_input = TaskInput.new(validation.value.to_h)
    task = Task.create!(task_input.to_h)
    ResultData.success(TaskSummary.from_model(task))
  end

  def self.update(task, params)
    validation = validate(params)
    return validation if validation.failure?

    task_input = TaskInput.new(validation.value.to_h)
    task.update!(task_input.to_h)
    ResultData.success(TaskSummary.from_model(task))
  end

  def self.validate(params)
    result = Contract.call(params)
    return ResultData.failure(result.errors.to_h) if result.failure?
    
    ResultData.success(TaskInput.new(result.to_h))
  end

  # Result = Data.define(:success?, :data) do
  #   def self.success(value) = new(success: true, value: value)
  #   def self.failure(value) = new(success: false, value: value)
  #   def failure? = !success?
  # end

end