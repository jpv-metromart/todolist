# Validates user input for creating/updating a user. 
# This is separate from the User model, which is used for database interactions.
class UserInput < Dry::Struct
  attribute :name, Types::String
  attribute :email, Types::Email
end