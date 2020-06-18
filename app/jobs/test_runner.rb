class TestRunner < ApplicationJob
  def perform(test_id)
    if false
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


    require 'net/telnet'
    
    fork do
      server = Net::Telnet::new('Host' => AppConfig.where(name: 'host').first.value,
                          'Port' => AppConfig.where(name: 'port').first.value.to_i,
                          'Telnetmode' => false)
    
      @test = Test.find(test_id)
    
      @test.code.split(/\n/).each do |line|
        server.puts(line)
        server.waitfor(/./) do |data|
          OutputSender.perform_later(@test.user_id, line, data)
        end
      end
    end

  end
end