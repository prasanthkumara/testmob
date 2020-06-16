class AppConfigsController < ApplicationController
  def update
    redirect_to root_path unless current_user.usertype == 'platform' and return
    AppConfig.find(params[:id]).update params.require(:app_config).permit(:value)
    redirect_to configure_tests_path
  end
end