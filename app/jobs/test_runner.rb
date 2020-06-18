class TestRunner < ApplicationJob
  def perform(test_id)    
    @test = Test.find(test_id)
  
    @test.code.split(/\n/).each do |line|
      Quaco.connection.puts(line)
      Quaco.connection.waitfor(/./) do |data|
        OutputSender.perform_later(@test.user_id, line, data)
      end
    end
  end
end