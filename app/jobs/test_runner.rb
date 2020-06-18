class TestRunner < ApplicationJob
  def perform(test_id)    
    @test = Test.find(test_id)
  
    @test.code.split(/\n/).each do |line|
      @result = nil
      Quaco.connection.cmd(line) do |data| 
        OutputSender.perform_later(@test.user_id, line, data)
        break
      end
    end
  end
end