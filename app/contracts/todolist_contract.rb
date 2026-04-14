# Validation Contracts are strictly for validating input data when creating/updating records. 
# They should not contain any logic related to database queries or model existence checks. 
# Instead, they should focus solely on validating the structure and format of the input data.
class TodoListContract < Dry::Validation::Contract
  params do
    required(:title).filled(:string)
    required(:user_id).filled(:integer)
  end

  rule(:title) do
    key.failure('must not be empty') if value.strip.empty?
  end
end