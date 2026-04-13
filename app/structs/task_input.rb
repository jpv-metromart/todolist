class TaskInput < Dry::Struct
  module Types
    include Dry.Types()
  end

  attribute :description, Types::String
  attribute :priority, Types::Priority.optional
  attribute :due_date, Types::Time.optional
  attribute :completed, Types::Bool.default(false)
end