class Nailbat::ParseArgs
  attr_accessor :first, :args_string

  def initialize(args)
    @first = args[0]
    @args_string = args[1..-1]
  end

  def script?
    return false unless @first
    (@first !~ /\A\-/)
  end

  def flag?
    return false unless @first
    (@first =~ /\A\-/)
  end
end
