require './test/test_helper'
require './problems/3.2_stack_min'

class TestStackMin < Minitest::Test
  def setup
    @stack = StackWhichKnowsMinimum.new
  end

  def test_updates_minimum_on_push
    @stack << 5
    assert_equal @stack.min, 5
    @stack << 8
    assert_equal @stack.min, 5
    @stack << 4
    assert_equal @stack.min, 4
    @stack << 6
    assert_equal @stack.min, 4
  end

  def test_updates_minimum_on_pop
    @stack << 5 << 8 << 4 << 6
    @stack.pop
    assert_equal @stack.min, 4
    @stack.pop
    assert_equal @stack.min, 5
    @stack.pop
    assert_equal @stack.min, 5
    @stack.pop
    assert_nil @stack.min
  end

  def test_empty
    assert_nil @stack.min, nil
    assert_nil @stack.pop, nil
  end
end
