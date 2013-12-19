class UsersController < ApplicationController
  respond_to :js, :html

  def create
    @user = User.new(params[:user])

    if @user.save
      render json: @user, status: :created
    else
      render json: {errors: @user.errors}, status: :unprocessable_entity
    end
  end
end
