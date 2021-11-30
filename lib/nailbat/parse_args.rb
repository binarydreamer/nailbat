class Nailbat::ParseArgs
  def initialize(args)
    @args = args
  end

  def script
    @args[0]
  end

  def script?
    return false if @args.length == 0
    (@args[0] !~ /\A\-/)
  end
end
