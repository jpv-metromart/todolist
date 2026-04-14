class UsersController < ApplicationController
  before_action :set_user, only: [:update]

  def create
    result = UserService.create(user_params.to_h)

    return render json: { errors: result.value }, status: :unprocessable_entity if result.failure?
    
    render json: result.value, status: :created
  end

  def update
    result = UserService.update(@user, user_params.to_h)
    return render json: { errors: result.value }, status: :unprocessable_entity if result.failure?

    render json: result.value, status: :ok
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end