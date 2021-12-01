class Nailbat::Application
  def initialize(args)
    @args = Nailbat::ParseArgs.new(args)
  end

  def run
    scripts = Nailbat::Scripts.load

    if @args.script?
      script = scripts.find { |s| s["name"] == @args.first }
      unless script
        $stderr.puts "Could not find script #{@args.first}"
        exit
      end
      picked = script["path"]
    elsif @args.flag?
      if @args.first == "-v"
        puts Nailbat::VERSION
      end
    else
      picked = Nailbat::ScriptPicker.pick(scripts)
    end

    script = File.read(picked)
    lines = script.lines
    found = lines.index { |s| s.strip === "..." }
    script = lines[found+1..-1].join

    temp_file = Tempfile.new('script')
    temp_file.write script
    temp_file.flush
    temp_file.close

    FileUtils.chmod "+x", temp_file.path
    out = `#{temp_file.path} #{@args.arg_string}`
    puts out

    temp_file.unlink
  end
end

