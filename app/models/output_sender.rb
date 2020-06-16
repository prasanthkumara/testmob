class OutputSender < ApplicationJob
  O_MAP = {
    1 => "Command Executed Successfully",
    0 => "Command Failed",
    -1 => "Emergency Stop pressed / Door open / Torque off Invalid Parameters",
    -2 => "Invalid API",
    -3 => "Outside Workspace",
    -4 => "Invalid Path",
    -5 => "Manipulator is not Homed",
    -6 => "Wrong number of parameters",
    -7 => "Parameter data type is wrong"
  }
  def perform(user_id, line, output)
    @user = User.find(user_id)
    ApplicationCable::NotificationsChannel.broadcast_to(
      @user,
      message: "<div class='result-line'>#{line}<br/>#{O_MAP[output]}</div>"
    )
  end
end