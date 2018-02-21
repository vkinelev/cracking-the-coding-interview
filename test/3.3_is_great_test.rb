require './test/test_helper'
require './problems/3.3_is_great'

class TestIsGreat < Minitest::Test
  def test_example
    assert is_great()
  end
end

class BenchmarkIsGreat < Minitest::Benchmark
  def bench_algorithm
  end
end
