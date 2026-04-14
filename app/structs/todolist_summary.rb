class TodoListSummary < Dry::Struct
  attribute :id, Types::Integer
  attribute :title, Types::String
  attribute :user_name, Types::String
  attribute :total_tasks_count, Types::Integer
  attribute :completed_count, Types::Integer
  attribute :pending_count, Types::Integer
  attribute :overdue_count, Types::Integer
  attribute :completion_rate, Types::Float
  attribute :next_due_task, Types::String.optional
  attribute :created_at, Types::Time.optional
  attribute :updated_at, Types::Time.optional  

  # Factory: Creates a TodoListSummary from a TodoList model instance
  def self.from_model(todo_list, last_checked: Time.current)
    tasks =             todo_list.tasks
    total_tasks_count = tasks.count
    completed_count =   tasks.completed.count
    pending_count =     tasks.pending.count
    overdue_count =     tasks.overdue.count
    completion_rate =   total_tasks_count > 0 ? (completed_count.to_f / total_tasks_count.to_f) * 100 : 0.0
    next_due_task =     tasks.pending.where("due_date > ?", last_checked).order(:due_date).first&.description
    created_at =        todo_list.created_at
    updated_at =        todo_list.updated_at

    # Uses these calculated values to create the summary struct
    new(
      id:                 todo_list.id,
      title:              todo_list.title,
      user_name:          todo_list.user.name,
      total_tasks_count:  total_tasks_count,
      completed_count:    completed_count,
      pending_count:      pending_count,
      overdue_count:      overdue_count,
      completion_rate:    completion_rate,
      next_due_task:      next_due_task,
      created_at:         created_at,
      updated_at:         updated_at
    )
  end
end