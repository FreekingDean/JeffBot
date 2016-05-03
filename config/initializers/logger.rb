require 'colorize'
require 'awesome_print'

# Color logger adds a little flair to your logs
class ColorLogger < Logger
  def info(text)
    super(text.yellow)
  end

  def error(text)
    super(text.red)
  end

  def debug(text)
    super(text.blue)
  end
end
