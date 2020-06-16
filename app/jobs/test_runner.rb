class TestRunner < ApplicationJob
  def perform(test_id)
    @test = Test.find(test_id)
    if @test.spec.present?
      RemoteConverter.new(@test).execute
    end
    RemoteRunner.new(@test).execute
  end
end