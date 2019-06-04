class UsersController < ApplicationController
  def show
    @user = current_user
    @boxe = Boxe.new
    authorize @user
  end

  def edit
  end

  def update
  end
end
