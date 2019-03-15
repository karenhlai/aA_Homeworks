  class Stack
    def initialize(stacks)
      @stacks = stacks
    end

    def push(el)
      @stacks << el
    end

    def pop
      @stacks.pop
    end

    def peek
      @stacks[-1]
    end
  end
  
