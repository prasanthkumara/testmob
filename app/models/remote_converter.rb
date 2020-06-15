class RemoteConverter
  def initialize(test)
    @test = test
  end

  def execute
    @test.update spec: 'sdfghj'
  end
end