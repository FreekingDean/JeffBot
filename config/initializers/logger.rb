require 'colorize'
require 'awesome_print'

# Color logger adds a little flair to your logs
class ColorLogger < Logger
  def info(text)
    super(text.yellow)
  end

  def error(ex)
    if ex.is_a? Exception
      super("#{ex.to_s.red}\n#{ex.backtrace.map{|bt| bt.red}.join("\n\t")}".red)
    else
      super(ex.red)
    end
  end

  def debug(text)
    super(text.blue)
  end
end
