class UserService
  ResultData = Result::Data

  def self.create(params)
    validation = validate(params)
    return validation if validation.failure?

    user = User.create!(validation.value.to_h)
    ResultData.success(UserSummary.from_model(user))
  end

  def self.update(user, params)
    validation = validate(params)
    return validation if validation.failure?

    user.update!(validation.value.to_h)
    ResultData.success(UserSummary.from_model(user))
  end

  private

  def self.contract
    @contract ||= UserContract.new
  end

  def self.validate(params)
    result = contract.call(params)
    return ResultData.failure(result.errors.to_h) if result.failure?

    ResultData.success(UserInput.new(result.to_h))
  end
end