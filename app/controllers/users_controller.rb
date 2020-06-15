class UsersController < ApplicationController
  before_action :check_user
  def show
    render plain: 'fghj'
  end

  protected

  def check_user
    unless current_user
      redirect_to new_user_sessions_path
    end
  end
end