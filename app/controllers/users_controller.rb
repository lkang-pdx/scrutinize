class UsersController < ApplicationController
  def show
    @user = current_user
    @registered_apps = @user.registered_applications
  end
end
