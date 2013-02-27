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
    Kernel.system(command, *arguments)
    listener.unpause
  end
  
  def ignore(*regexps)
    @listener.ignore(*regexps)
  end
  
  def ignore_path(*paths)
    globs = paths.map{|p| FileGlob.new(p)}
    
    @listener.ignore(*globs)
  end
end