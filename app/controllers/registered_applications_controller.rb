class RegisteredApplicationsController < ApplicationController
  def index
    @registered_apps = RegisteredApplication.all
  end

  def show
    @registered_app = RegisteredApplication.find(params[:id])
    @events = @registered_app.events.group_by(&:name)
  end

  def new
    @registered_app = RegisteredApplication.new
  end

  def create
    @registered_app = RegisteredApplication.new(app_params)
    @registered_app.user = current_user

    if @registered_app.save
      flash[:notice] = "App was saved."
      redirect_to [current_user, @registered_app]
    else
      flash.now[:alert] = "There was an error saving the app. Please try again."
      render :new
    end
  end

  def edit
    @registered_app = RegisteredApplication.find(params[:id])
  end

  def update
    @registered_app = RegisteredApplication.find(params[:id])
    @registered_app.assign_attributes(app_params)

    if @registered_app.save
      flash[:notice] = "App was updated."
      redirect_to [current_user, @registered_app]
    else
      flash.now[:alert] = "There was an error saving the app. Please try again."
      render :edit
    end
  end

  def destroy
    @registered_app = RegisteredApplication.find(params[:id])

    if @registered_app.destroy
      flash[:notice] = "\"#{@registered_app.name}\" was deleted successfully."
      redirect_to user_registered_applications_path
    else
      flash.now[:alert] = "There was an error deleting the app."
      render :show
    end
  end

  private
  def app_params
    params.require(:registered_application).permit(:name, :url)
  end
end
