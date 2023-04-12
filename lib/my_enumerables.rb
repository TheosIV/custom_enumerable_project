module Enumerable
  # Your code goes here
  def my_each_with_index
    return to_enum(__callee__) unless block_given?

    index = 0

    for el in self
      yield el, index
      index += 1
    end
  end

  def my_select
    return to_enum(__callee__) unless block_given?
    output = []
    self.my_each do |el|
      output << el if yield el
    end
    output
  end

  def my_all?
    return to_enum(__callee__) unless block_given?

    self.my_each { |el| return false unless yield el }
    true
  end

  def my_any?
    return to_enum(__callee__) unless block_given?

    self.my_each { |el| return true if yield el }
    false
  end

  def my_none?
    return to_enum(__callee__) unless block_given?

    self.my_each { |el| return false if yield el}
    true
  end

  def my_count  
    return self.size unless block_given?

    count = 0
    self.my_each { |el| count += 1 if yield el}
    count
  end

  def my_inject(start_count = self[0])
    return to_enum(__callee__) unless block_given?

    result = start_count
    self.my_each { |el| result = (yield result, el)}
    result
  end

  def my_map(my_proc = nil)
    return to_enum(__callee__) unless block_given?

    output = []
    self.my_each { |el| my_proc ? my_proc.call(el) : output << yield(el) }
    output
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    return to_enum(__callee__) unless block_given?

    for el in self
     yield el
    end
  end

end
