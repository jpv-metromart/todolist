class TaskContract < Dry::Validation::Contract
  # Defines validation rules for task input when creating/updating a task.
  params do
    required(:todo_list_id).filled(:integer)
    required(:description).filled(:string)
    optional(:due_date).maybe(:date_time)
    optional(:completed).filled(:bool)
  end

  # Custom validation rules for description and due_date fields
  rule(:description) do
    key.failure('must not be empty') if value.strip.empty?
    key.failure('must be at least 1 character') if value.strip.length < 1
  end

  rule(:due_date) do
    if value
      key.failure('must be in the future') if value <= Time.current
    end
  end
end