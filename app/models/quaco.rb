class Quaco
  require 'net/telnet'
  @@connection = nil

  def self.connect
    @@connection = Net::Telnet::new('Host' => AppConfig.where(name: 'host').first.value,
                          'Port' => AppConfig.where(name: 'port').first.value.to_i,
                          'Telnetmode' => false)
  end

  def self.disconnect
    @@connection.close
    @@connection = nil
  end

  def self.connection
    @@connection
  end
end