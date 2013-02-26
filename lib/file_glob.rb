class FileGlob
  attr_reader :pattern
  
  def initialize(pattern)
    @pattern = pattern
  end
  
  def =~ path
    File.fnmatch?(pattern, path)
  end
  
  def to_s
    pattern
  end
  
  def inspect
    "<#FileGlob #{pattern}>"
  end
end