require './config/application'
require 'bunny'
require_relative '../config/environments'
require_relative 'lib/botsolver'
require_relative 'lib/responder'
require_relative 'lib/learner'
require_relative 'lib/jeffserver'

begin
  logger = ColorLogger.new(STDOUT)
  conn = Bunny.new(ENV['RABBITMQ_BIGWIG_URL'])
  conn.start
  ch = conn.create_channel
  server = JeffServer.new(ch)
  logger.info 'A new backend worker is now online.'
  begin
    server.respond
    server.learn
    server.start
  rescue StandardError => ex
    ap ex
    ch.close
    conn.close
  end
rescue Interrupt => ex
  if logger
    logger.error 'Graceful Exit'
    logger.close
  else
    ap ex
  end
  exit
end
