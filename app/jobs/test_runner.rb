class TestRunner < ApplicationJob
  def perform(test_id)

    require 'socket'
    sock = TCPSocket.new(AppConfig.where(name: 'host').first.value, AppConfig.where(name: 'port').first.value.to_i)    

    @test = Test.find(test_id)
    @test.code.split(/\n/).each do |line|
      sock.write line
      output = sock.read(1024)
      OutputSender.perform_later(@test.user_id, line, output)
    end
    sock.close
  end
end