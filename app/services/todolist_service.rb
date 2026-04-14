class TodoListService
  ResultData = Result::Data

  def self.create(params)
    validation = validate(params)
    return validation if validation.failure?

    todolist = TodoList.create!(validation.value.to_h)
    ResultData.success(TodoListSummary.from_model(todolist))
  end

  def self.update(todolist, params)
    validation = validate(params)
    return validation if validation.failure?

    todolist.update!(validation.value.to_h)
    ResultData.success(TodoListSummary.from_model(todolist))
  end

  private

  def self.contract
    @contract ||= TodoListContract.new
  end

  def self.validate(params)
    result = contract.call(params)
    return ResultData.failure(result.errors.to_h) if result.failure?

    unless User.exists?(params[:user_id])
      return ResultData.failure(user_id: ['must be a valid user ID'])
    end
    
    ResultData.success(TodoListInput.new(result.to_h))
  end
end