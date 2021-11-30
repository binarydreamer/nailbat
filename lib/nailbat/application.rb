class Nailbat::Application
  def initialize(args)
    @args = Nailbat::ParseArgs.new(args)
  end

  def run
    puts "Running"
  end
end
