class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:update]

  def index
    result = UserService.index
    render json: result.value, status: :ok
  end

  def show
    result = UserService.show(params[:id])
    return render json: { errors: result.value }, status: :not_found if result.failure?
    
    render json: result.value, status: :ok
  end

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
    @user = UserService.set_user(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end