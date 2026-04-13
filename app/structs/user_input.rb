class UserInput < Dry::Struct
  module Types
    include Dry.Types()
  end

  attribute :name, Types::String
  attribute :email, Types::Email
end