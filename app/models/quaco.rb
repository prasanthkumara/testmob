class Quaco
  @@connection = nil
  def self.connect(type)
    type = 'telnet'
    if type == 'tcp'
      @@connection = QuacoTcp
      QuacoTcp.connect
    else
      @@connection = QuacoTelnet
      QuacoTelnet.connect
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