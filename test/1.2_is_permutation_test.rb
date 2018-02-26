require './test/test_helper'
require './problems/1.2_is_permutation'

class TestIsPermutation < Minitest::Test
  def test_example
    assert is_permutation('abc', 'cba')
  end
end

class BenchmarkIsPermutation < Minitest::Benchmark
  def bench_algorithm
  end
end
