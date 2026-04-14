class UserSummary < Dry::Struct
  attribute :id, Types::Integer
  attribute :name, Types::String
  attribute :email, Types::Email
  attribute :todo_lists_count, Types::Integer.optional
  attribute :tasks_count, Types::Integer.optional
  attribute :created_at, Types::Time.optional
  attribute :updated_at, Types::Time.optional

  # Factory: Creates a UserSummary from a User model instance
  # user = User.find(some_id) => UserSummary.from_model(user)
  def self.from_model(user)
    new(
      id: user.id,
      name: user.name,
      email: user.email,
      todo_lists_count: user.todo_lists.count,
      tasks_count: user.tasks.count,
      created_at: user.created_at,
      updated_at: user.updated_at
    )
  end
end