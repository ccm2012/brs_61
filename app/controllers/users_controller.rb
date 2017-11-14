class UsersController < ApplicationController
  attr_reader :user
  load_and_authorize_resource

  before_action :authenticate_user!

  def index
    @users = User.paginate page: params[:page]
  end

  def new; end

  def create
    if user.save
      flash[:info] = t "user_for.success_create"
      redirect_to users_path
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    param = params[:user][:password].empty? ? blank_user_params : user_params

    if user.update_attributes param
      flash[:success] = t "user_for.success_update", param: user.name
      redirect_to users_url
    else
      render :edit
    end
  end

  def destroy
    user.destroy if user
    flash[:success] = t "user_for.success_destroy", param: user.name
    redirect_to users_url
  end

  private

  def blank_user_params
    params.require(:user).permit User::NO_PASS_ATTRIBUTE_PARAMS
  end

  def user_params
    params.require(:user).permit User::ATTRIBUTE_PARAMS
  end
end
