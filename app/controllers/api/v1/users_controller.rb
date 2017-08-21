class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user, except: [:create]
  def create
    @user = User.new(user_params)
    @user.password = params[:password]
    @user.save
    render json: @user
  end

  def cu
    render json: current_user
  end

  def show
    render json: current_user
  end

  def lines
    render json: current_user.lines
  end

  def created_lines
    render json: current_user.created_lines
  end

  private
  def user_params
    params.require(:user).permit(:email,:password,:first_name,:last_name,:phone_number)
  end
end