class TaskSummary < Dry::Struct
  # Relevant fields for listing tasks. Excludes associations and large text fields.
  attribute :id, Types::Integer
  attribute :todo_list_id, Types::Integer
  attribute :description, Types::String
  attribute :completed, Types::Bool
  attribute :priority, Types::Priority.optional
  attribute :due_date, Types::Time.optional
  attribute :created_at, Types::Time.optional
  attribute :updated_at, Types::Time.optional

  # Factory: Creates a TaskSummary from a Task model instance
  def self.from_model(task)
      new(
        id:           task.id,
        todo_list_id: task.todo_list_id,
        description:  task.description,
        completed:    task.completed,
        priority:     task.priority,
        due_date:     task.due_date,
        created_at:   task.created_at,
        updated_at:   task.updated_at
      )
  end

  # Batch Factory: Creates an array of TaskSummary instances from a collection of Task models
  def self.from_collection(tasks)
    tasks.map { |task| from_model(task) }
  end
end