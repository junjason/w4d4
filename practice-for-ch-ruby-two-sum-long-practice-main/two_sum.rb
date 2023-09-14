require "byebug"

# brute-force solution
# def two_sum?(arr, target_sum)
#     arr.each_with_index do |ele, i|
#         arr.each_with_index do |ele2, j|
#             if i < j && ele + ele2 == target_sum
#                 return true
#             end
#         end
#     end
#     false
# end

# arr = [0, 1, 5, 7]
# p two_sum?(arr, 6) # => should be true
# p two_sum?(arr, 10) # => should be false

# sorting approach
# def two_sum?(arr, target_sum)
#     sorted = arr.sort
#     left = 0
#     right = sorted.length-1
#     while left < right
#         if arr[left]+arr[right] == target_sum
#             return true
#         else
#             if arr[left]+arr[right] < target_sum
#                 left += 1
#             else
#                 right -= 1
#             end
#         end
#     end
#     false
# end

# arr = [0, 1, 5, 7]
# p two_sum?(arr, 6) # => should be true
# p two_sum?(arr, 10) # => should be false


# hashmap approach
def two_sum?(arr, target_sum)
    hash = {}
    arr.each_with_index do |el, i|
        hash[el] = i
    end

    hash.each do |k,v|
        first = k
        target_num = target_sum-first
        # debugger
        return true if hash.has_key?(target_num) && hash[target_num] != hash[k]
    end
    false
end

arr = [0, 1, 5, 7]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false