module Result
  Data = Struct.new(:success?, :value) do
    def self.success(value) = new(true, value)
    def self.failure(value) = new(false, value)
    def success? = success
    def failure? = !success
  end
end