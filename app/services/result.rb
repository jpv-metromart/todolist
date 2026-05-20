module Result
  # Represents the outcome of a service operation.
  # Usage:
  #   Result::Data.success(payload) => #<Result::Data success=true, value=payload>
  #   Result::Data.failure(errors)  => #<Result::Data success=false, value=errors>
  Data = Struct.new(:success, :value) do
    # Factory: wraps a successful value
    def self.success(value) = new(true, value)

    # Factory: wraps a failure value (e.g. error hash)
    def self.failure(value) = new(false, value)

    # Predicates: true when the operation succeeded or failed
    def success? = self.success
    def failure? = !self.success
  end
end