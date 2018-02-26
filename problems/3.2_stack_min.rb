<<~TASK
3.2 Stack Min: How would you design a stack which, in addition to push and pop, has a function min
which returns the minimum element? Push, pop and min should all operate in 0(1) time.
Hints: #27, #59, #78

Questions
1.

Solutions
1. Use the second auxiliary stack to store minimums.

Input Data Checks or Edge Cases
1.
TASK

class StackWhichKnowsMinimum
  def initialize
    # Use Array for simplicity.
    @stack = Array.new
    @stack_with_minimums = Array.new
  end

  def push(data)
    if @stack_with_minimums.empty? || data <= @stack_with_minimums.last
      @stack_with_minimums << data
    end
    @stack << data
    self
  end
  alias_method :<<, :push

  def pop
    @stack_with_minimums.pop if @stack.last == @stack_with_minimums.last
    @stack.pop
  end

  def min
    @stack_with_minimums.last
  end
end
