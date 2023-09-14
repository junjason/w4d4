def windowed_max_range(arr, window_size)
    i = 0
    j = i + window_size

    max_range = 0

    while j <= arr.length
        sub_arr = arr[i...j]
        range = sub_arr.max - sub_arr.min
        max_range = range if range > max_range
        i += 1
        j += 1
    end

    max_range
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8

class MyQueue
    def initialize
        @store = Array.new
    end

    def peek
        @store[0]
    end

    def size
        @store.length
    end

    def empty?
        @store.empty?
    end

    def enqueue(element)
        @store.push(element)
    end

    def dequeue
        @store.shift
    end
end

class MyStack
    def initialize
        @store = Array.new
    end 

    def peek
        @store[-1]
    end

    def size
        @store.length
    end

    def empty?
        @store.empty?
    end

    def push(element)
        @store.push(element)
    end

    def pop(element)
        @store.pop
    end
end

class StackQueue
    def initialize
        @enqueue_stack = MyStack.new
        @dequeue_stack = MyStack.new
    end

    def enqueue(element)
        if @enqueue_stack.empty?
            while !@dequeue_stack.empty?
                el = @dequeue_stack.pop
                @enqueue_stack.push(el)
            end
        end
        @enqueue_stack.push(element)
    end

    def dequeue
        if @dequeue_stack.empty?
            while !@enqueue_stack.empty?
                el = @enqueue_stack.pop
                @enqueue_stack.push(el)
            end
        end
        @dequeue_stack.pop
    end

    def size 
        @enqueue_stack.size + @dequeue_stack.size
    end

    def empty?
        @enqueue_stack.empty? && @dequeue_stack.empty?
    end
end


class MinMaxStack
    def initialize
        @store = Array.new
        @max_el = nil
        @min_el = nil
    end 

    def peek
        @store[-1]
    end

    def size
        @store.length
    end

    def empty?
        @store.empty?
    end

    def push(element)
        @store.push(element)
        @max_el = element if @max_el == nil || element > @max_el
        @min_el = element if @min_el == nil || element < @min_el
    end

    def pop(element)
        if peek == @max_el
            @store.pop
            @max_el = @store.max if !empty?
        elsif peek == @min_el
            @store.pop
            @min_el = @store.min if !empty?
        else
            @store.pop
        end
        
        if empty?
            @max_el = nil
            @min_el = nil
        end
    end

    def max
        @max_el
    end

    def min
        @min_el
    end
end

class MinMaxStackQueue
    def initialize
        @enqueue_stack = MyStack.new
        @dequeue_stack = MyStack.new
        @max_el = nil
        @min_el = nil
    end

    def enqueue(element)
        if @enqueue_stack.empty?
            while !@dequeue_stack.empty?
                el = @dequeue_stack.pop
                @enqueue_stack.push(el)
            end
        end
        @enqueue_stack.push(element)
    end

    def dequeue
        if @dequeue_stack.empty?
            while !@enqueue_stack.empty?
                el = @enqueue_stack.pop
                @enqueue_stack.push(el)
            end
        end
        @dequeue_stack.pop
    end

    def size 
        @enqueue_stack.size + @dequeue_stack.size
    end

    def empty?
        @enqueue_stack.empty? && @dequeue_stack.empty?
    end
end