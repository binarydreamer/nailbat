class Nailbat::Application
  def initialize(args)
    @args = Nailbat::ParseArgs.new(args)
  end

  def run
    if @args.flag? && @args.first == "-v"
      puts Nailbat::VERSION
      exit
    end

    scripts = Nailbat::ScriptsScanner.load

    if @args.script?
      script = scripts.find { |s| s["name"] == @args.first }
      unless script
        $stderr.puts "Could not find script #{@args.first}"
        exit
      end
      picked = script["path"]
    elsif @args.flag?
      #placeholder for now
      exit
    else
      picked = Nailbat::ScriptPicker.pick(scripts)
    end

    runner = Nailbat::ScriptRunner.new(picked, args: @args.args_string)
    runner.run
  end
end

