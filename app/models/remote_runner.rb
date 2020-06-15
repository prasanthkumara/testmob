class RemoteRunner
  def initialize(test)
    @test = test
  end

  def execute
    @test.update output: 'ddddd'
  end
end