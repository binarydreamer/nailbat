class Nailbat::ParseArgs
  attr_accessor :first, :arg_string

  def initialize(args)
    @first = args[0]
    tmp = args.dup
    tmp.shift
    @arg_string = tmp
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
