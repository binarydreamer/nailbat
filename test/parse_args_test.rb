require "test_helper"

class NailbatTest < Minitest::Test
  def test_asking_for_nailbat_param
    args = Nailbat::ParseArgs.new(['-h'])
    refute args.script?, "Flag was not given"
  end

  def test_asking_for_script
    args = Nailbat::ParseArgs.new(['test'])
    assert args.script?, "Script was not requested"
  end

  def test_get_script_name
    args = Nailbat::ParseArgs.new(['test', '-v'])
    assert_equal "test", args.script
  end
end
