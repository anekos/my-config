#!/usr/bin/ruby
# vim: set fileencoding=utf-8 :

require 'pathname'
require 'shellwords'
require 'find'
require 'optparse'


class Options
  attr_reader :foo, :files

  def initialize (argv)
    parse(argv)
  end

  private
  def init
    @foo = nil
    @files = []
  end

  def parse (argv)
    OptionParser.new do |opt|
      opt.on('-f FOO', '--foo FOO',  'Foo') {|v| @foo = v }
      opt.parse!(argv)
    end

    @files = argv.dup.map {|it| Pathname(it) }
  end
end


class App
  def initialize (options)
    @options = options
  end

  def start
  end
end


if __FILE__ == $0
  App.new(Options.new(ARGV)).start
end
