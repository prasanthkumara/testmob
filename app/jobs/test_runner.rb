class TestRunner < ApplicationJob
  queue_as :default

  def perform(test_id)    
    @test = Test.find(test_id)
    if Quaco.connection.nil?
      Quaco.connect('tcp')
    end
    @test.code.split(/\n/).each do |line|
      Quaco.execute(@test.user_id, line) if line.present?
    end

    unless Quaco.connection.nil?
      Quaco.disconnect
    end
  end
end