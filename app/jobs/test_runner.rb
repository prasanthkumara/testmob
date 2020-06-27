class TestRunner < ApplicationJob
  queue_as :default

  def perform(test_id) 
    OutputSender.perform_later(1, 'line', '1')   
    @test = Test.find(test_id)
    @test.code.split(/\n/).each do |line|
      Quaco.execute(@test.user_id, line) if line.present?
    end
  end
end