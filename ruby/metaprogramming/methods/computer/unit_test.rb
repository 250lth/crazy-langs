require_relative 'datasource'
require 'test/unit'

class ComputerTest < Test::Unit::TestCase
  def setup
    @computer = Computer.new(60, DS.new)
  end

  def test_returns_a_printable_description
    assert_equal "Mouse: Wireless Touch ($60)", @computer.mouse
  end

  def test_marks_expensive_items_with_an_asterisk
    assert_equal "* Cpu: 2.9 Ghz quad-core ($120)", @computer.cpu
  end
end
