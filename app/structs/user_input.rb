class UserInput < Dry::Struct
  attribute :name, Types::String
  attribute :email, Types::Email
end