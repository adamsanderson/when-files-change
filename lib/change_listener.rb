require 'listen'
require 'file_glob'

class ChangeListener
  attr_reader :listener
  attr_reader :command
  attr_reader :arguments
  
  def initialize(command, *arguments)
    @command   = command
    @arguments = arguments
    @listener  = Listen.to('./').ignore(/^\.\w+/)
    
    @listener.change{ execute }
  end
  
  def start
    listener.start(false)
  end
  
  def execute
    listener.pause
    success = Kernel.system(ENV, command, *arguments)
    report_error unless success
    listener.unpause
  end
  
  def ignore(*regexps)
    @listener.ignore(*regexps)
  end
  
  def ignore_path(*paths)
    globs = paths.map{|p| FileGlob.new(p)}
    
    @listener.ignore(*globs)
  end
  
  def report_error
    STDERR.puts "#{command.inspect} exited with #{$?.exitstatus}"
  end
end