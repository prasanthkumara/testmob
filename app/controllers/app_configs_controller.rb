class AppConfigsController < ApplicationController
  def update
    unless current_user.usertype == 'platform'
      redirect_to root_path and return
    end
    AppConfig.find(params[:id]).update params.require(:app_config).permit(:value)
    redirect_to configure_tests_path
  end
end