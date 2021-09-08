class TextWorker

  def initialize(filename)
    @filename = filename
    @array = []

  end

  def call 
    read_file
    change_values
  end

  private

  def read_file
    f = File.open(@filename, 'r')
    @array = f.read
    f.close
  end

  def change_values
    @array.gsub!(/[^A-Za-z]/, '')
  end


end