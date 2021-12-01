require "test_helper"

class NailbatTest < Minitest::Test
  def test_no_params
    args = Nailbat::ParseArgs.new([])
    refute args.flag?, "Must not have flag"
    refute args.script?, "Must not have script"
  end

  def test_asking_for_nailbat_param
    args = Nailbat::ParseArgs.new(['-h'])
    assert args.flag?, "Flag was not given"
  end

  def test_asking_for_script
    args = Nailbat::ParseArgs.new(['test'])
    assert args.script?, "Script was not requested"
  end

  def test_get_script_name
    args = Nailbat::ParseArgs.new(['test', '-v'])
    assert_equal "test", args.first
  end
end
