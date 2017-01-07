class RegisteredApplicationsController < ApplicationController
  def index
    @registered_apps = RegisteredApplication.all
  end

  def show
    @registered_app = RegisteredApplication.find(params[:id])
  end

  def new
    @registered_app = RegisteredApplication.new
  end

  def create
    @registered_app = RegisteredApplication.new(app_params)
    @registered_app.user = current_user

    if @registered_app.save
      flash[:notice] = "Wiki was saved."
      redirect_to @registered_app
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
    @registered_app.name = params[:registered_app][:name]
    @registered_app.url = params[:registered_app][:url]

    if @registered_app.save
      flash[:notice] = "App was updated."
      redirect_to @registered_app
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
    params.require(:registered_app).permit(:name, :url)
  end
end
