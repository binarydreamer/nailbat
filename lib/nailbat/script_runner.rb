class Nailbat::ScriptRunner
  def initialize(picked, args: "")
    @picked = picked
    @args = args
  end

  def run
    temp_file = Tempfile.new('script')
    temp_file.write script
    temp_file.flush
    temp_file.close

    FileUtils.chmod "+x", temp_file.path
    system("#{temp_file.path} #{@args}")

    temp_file.unlink
  end

  def script
    data = File.read(@picked)
    lines = data.lines
    found = lines.index { |s| s.strip === "..." }
    lines[found+1..-1].join
  end
end
