class TaskInput < Dry::Struct
  attribute :description, Types::String
  attribute :priority, Types::Priority.optional
  attribute :due_date, Types::Time.optional
  attribute :completed, Types::Bool.default(false)
end