class TaskInput < Dry::Struct
  attribute :todo_list_id, Types::Integer
  attribute :description, Types::String.optional
  attribute :priority, Types::Priority.optional
  attribute :due_date, Types::Time.optional
  attribute :completed, Types::Bool.default(false)
end