class UserService
  ResultData = Result::Data

  def self.set_user(params)
    User.find_by(id: params[:id])
  end

  def self.index
    ResultData.success(UserSummary.all)
  end

  def self.show(params)
    user = User.find_by(id: params)
    return ResultData.failure('User not found') unless user
    ResultData.success(UserSummary.from_model(user))
  end

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

  def self.delete(user)
    user.destroy!
    ResultData.success(nil)
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