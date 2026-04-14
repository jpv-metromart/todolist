class TaskSummary < Dry::Struct
  # Relevant fields for listing tasks. Excludes associations and large text fields.
  attribute :id, Types::Integer
  attribute :todo_list_id, Types::Integer
  attribute :description, Types::String
  attribute :completed, Types::Bool
  attribute :due_date, Types::Time.optional
  attribute :created_at, Types::Time.optional
  attribute :updated_at, Types::Time.optional

  # Factory: Creates a TaskSummary from a Task model instance
  # task = Task.find(some_id) => TaskSummary.from_model(task)
  def self.from_model(task)
      new(
        id:           task.id,
        todo_list_id: task.todo_list_id,
        description:  task.description,
        completed:    task.completed,
        due_date:     task.due_date,
        created_at:   task.created_at,
        updated_at:   task.updated_at
      )
  end

  # Batch Factory: Creates an array of TaskSummary instances from a collection of Task models
  # tasks = Task.where(todo_list_id: some_id) => TaskSummary.from_collection(tasks)
  def self.from_collection(tasks)
    tasks.map { |task| from_model(task) }
  end
end