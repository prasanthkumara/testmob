class TestRunner < ApplicationJob
  def perform(test_id)    
    @test = Test.find(test_id)
  
    @test.code.split(/\n/).each do |line|
      Quaco.execute(@test.user_id, line) if line.present?
    end
  end
end