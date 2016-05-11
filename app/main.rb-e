$stdout.sync = true
require './config/application'

begin
  App.logger = ColorLogger.new(STDOUT)
  conn = Bunny.new(ENV['RABBITMQ_BIGWIG_URL'])
  conn.start
  ch = conn.create_channel
  server = JeffServer.new(ch)
  App.logger.info 'A new backend worker is now online.'
  begin
    server.respond
    server.learn
    server.start
  rescue StandardError => ex
    ap ex.red
    ch.close
    conn.close
  end
rescue Interrupt => ex
  if App.logger
    App.logger.error ex
    App.logger.info 'Graceful Exit'
    App.logger.close
  else
    ap ex.red
  end

  exit
end
