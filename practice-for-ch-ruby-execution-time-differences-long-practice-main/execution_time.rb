def my_min(arr)
    min = arr[0]
    arr.each_with_index do |ele1, i|
        arr.each_with_index do |ele2, j|
            if i < j && ele1 < min
                min = ele1
            elsif i < j && ele2 < min
                min = ele2
            end
        end
    end
    min
end


list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5


def my_min_2(arr)
    min = arr[0]
    arr.each do |ele|
        if ele < min
            min = ele
        end
    end
    min
end

# p my_min_2(list)  # =>  -5




def largest_contiguous_subsum(list)
    sub_arr = []
    (0...list.length).each do |start|
        (start...list.length).each do |finish|
            sub_arr << list[start..finish]
        end
    end
    sub_arr.map(&:sum).max
end

def faster_subsum(list)
    max = 0
    curr_total = 0
    (0...list.length).each do |i|
        curr_total += list[i]
        if curr_total < 0
            curr_total = 0
        end
        if curr_total > max
            max = curr_total
        end
    end
    if max == 0
        return list.max
    end
    max
end



# # possible sub-sums
# [5]           # => 5
# [5, 3]        # => 8 --> we want this one
# [5, 3, -7]    # => 1
# [3]           # => 3
# [3, -7]       # => -4
# [-7]          # => -7
list = [5, 3, -7]
# p largest_contiguous_subsum(list) # => 8
p faster_subsum(list)
list = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])
p faster_subsum(list)
list = [-5, -1, -3]
# p largest_contiguous_subsum(list) # => -1 (from [-1])
p faster_subsum(list)