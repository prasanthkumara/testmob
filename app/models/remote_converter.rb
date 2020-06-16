class RemoteConverter
  def initialize(test)
    @test = test
  end

  def execute
    @test.update code: @test.spec
  end
end