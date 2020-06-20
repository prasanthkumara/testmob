class Quaco
  @@connection = nil
  def self.connect(type)
    if type == 'tcp'
      @@connection = QuacoTcp
      QuacoTcp.connect
      QuacoTcp.connection.read
    else
      @@connection = QuacoTelnet
      QuacoTelnet.connect
      QuacoTelnet.connection.waitfor(/\n/)
    end
  end

  def self.disconnect
    self.connection.disconnect
  end

  def self.connection
    @@connection
  end

  def self.execute(user_id, line)
    self.connection.execute(user_id, line)
  end
end