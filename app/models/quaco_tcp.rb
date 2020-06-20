class QuacoTcp
  require 'socket'
  @@connection = nil

  def self.connect
    #@@connection = TCPSocket.new(AppConfig.where(name: 'host').first.value, AppConfig.where(name: 'port').first.value.to_i)
    @@connection = TCPSocket.open(AppConfig.where(name: 'host').first.value,AppConfig.where(name: 'port').first.value.to_i)
  end

  def self.disconnect
    @@connection.close
    @@connection = nil
  end

  def self.connection
    @@connection
  end

  def self.execute(user_id, line)
    self.connection.print(line)
    data = self.connection.read
    OutputSender.perform_later(user_id, line, data)
  end
end