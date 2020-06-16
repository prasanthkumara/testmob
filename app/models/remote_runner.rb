class RemoteRunner
  def initialize(test)
    @test = test
  end

  def execute
    @test.update output: @test.code
    ApplicationCable::NotificationsChannel.broadcast_to(
      @test.user,
      message: @test.output
    )
  end
end