# Validates todo list input for creating/updating a todo list. 
# This is separate from the TodoList model, which is used for database interactions.
class TodoListInput < Dry::Struct
  attribute :title, Types::String
  attribute :user_id, Types::Integer
end