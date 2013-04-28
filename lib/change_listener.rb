require 'listen'
require 'file_glob'

class ChangeListener
  attr_reader :listener
  attr_reader :command
  attr_reader :arguments
  attr_accessor :verbose
  attr_accessor :out
  
  def initialize(command, *arguments)
    @command   = command
    @arguments = arguments
    @out       = STDERR
    
    @listener  = Listen.to('./').ignore(/^\.\w+/)
    @listener.change{ execute }
  end
  
  def start
    listener.start(false)
  end
  
  def execute
    listener.pause
    run_command
    listener.unpause
  end
  
  def ignore(*regexps)
    listener.ignore(*regexps)
  end
  
  def ignore_path(*paths)
    globs = paths.map{|p| FileGlob.new(p)}
    
    listener.ignore(*globs)
  end
  
  def verbose?
    verbose
  end
  
  private
  
  def run_command
    out.print "#{command_to_s} " if verbose?
    success = Kernel.system(ENV, command, *arguments)
    report_error unless success
  end
  
  def report_error
    out.puts "exited with #{$?.exitstatus}"
  end
  
  def command_to_s
    "#{command} #{arguments.join(' ')}"
  end
end