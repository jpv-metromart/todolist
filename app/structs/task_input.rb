# Validates task input for creating/updating a task. 
# This is separate from the Task model, which is used for database interactions.
class TaskInput < Dry::Struct
  attribute :todo_list_id, Types::Integer
  attribute :description, Types::String.optional
  attribute :due_date, Types::Time.optional
  attribute :completed, Types::Bool.default(false)
end