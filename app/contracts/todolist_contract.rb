class TodoListContract < Dry::Validation::Contract
  params do
    required(:title).filled(:string)
    required(:user_id).filled(:integer)
  end

  rule(:title) do
    key.failure('must not be empty') if value.strip.empty?
    key.failure('must be at least 1 character') if value.strip.length < 1
  end

  rule(:user_id) do
    key.failure('must be a valid user ID') unless User.exists?(value)
  end
end