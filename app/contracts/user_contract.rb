# Validation Contracts are strictly for validating input data when creating/updating records. 
# They should not contain any logic related to database queries or model existence checks. 
# Instead, they should focus solely on validating the structure and format of the input data.
class UserContract < Dry::Validation::Contract
  params do
    required(:name).filled(:string)
    required(:email).filled(:string)
  end

  rule(:name) do
    key.failure('must not be empty') if value.strip.empty?
    key.failure('must be at least 3 characters') if value.strip.length < 3
    key.failure('must be at most 32 characters') if value.strip.length > 32
    key.failure('must only contain letters, numbers, spaces, underscores, and dashes') unless value.match?(/\A[a-zA-Z0-9 _-]+\z/)
  end

  rule(:email) do
    key.failure('must not be empty') if value.strip.empty?
    key.failure('must be at least 3 characters') if value.strip.length < 3
    key.failure('must be a valid email format') unless value.match?(URI::MailTo::EMAIL_REGEXP)
  end
end