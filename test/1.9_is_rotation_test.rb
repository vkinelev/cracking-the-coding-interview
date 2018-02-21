require './test/test_helper'
require './problems/1.9_is_rotation'

class TestIsRotation < Minitest::Test
  def test_example
    assert is_rotation('waterbottle', 'erbottlewat')
  end
end

class BenchmarkIsRotation < Minitest::Benchmark
  def self.bench_range
    bench_linear(1, 1_000_000, 100_000)
  end

  def setup
    @strings = {}
    self.class.bench_range.each { |n| @strings[n] = "a" * n }
  end

  def bench_algorithm
    assert_performance_linear 0.7 do |n|
      is_rotation(@strings[n], @strings[n])
    end
  end
end
