class Nailbat::Application
  def initialize(args)
    @args = Nailbat::ParseArgs.new(args)
  end

  def run
    if @args.script?
      puts "Asked for script"
    else
      picked = Nailbat::ScriptPicker.pick
      puts picked
    end
  end
end
