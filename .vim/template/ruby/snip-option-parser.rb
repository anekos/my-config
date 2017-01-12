
require 'optparse'

Version = '1.0.0'

class Options < OptionParser
  include Enumerable

  attr_reader :argv, :along, :blong, :clong

  def initialize (args)
    super do |opt|
      opt.banner = 'Usage: hogehoge [options]'
      opt.on('-a', '--along',         'DESCRIPTION') {|v| @along = v }
      opt.on('-b', '--blong=VALUE',   'DESCRIPTION') {|v| @blong = v }
      opt.on('-c', '--clong=[VALUE]', 'DESCRIPTION') {|v| @clong = v }
      opt.parse!(args)
    end
    @argv = args.dup

    unless validate_options
      STDERR.puts(help)
      exit 1
    end
  end

  def each (&block)
    @argv.each(&block)
  end

  def validate_options
    !argv.empty?
  end
end

if $0 == __FILE__
  options = Options.new(ARGV)
  p 1
  p options.argv
  p options.along
  p options.blong
end
