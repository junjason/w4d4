def fourth_anagram?(string_one, string_two)
    count_1 = Hash.new(0)
    count_2 = Hash.new(0)

    string_one.each_char do |ch|
        count_1[ch] += 1
    end

    string_two.each_char do |ch|
        count_2[ch] += 1
    end

    count_1 == count_2
end

def third_anagram?(string_one, string_two)
    sorted_1 = string_one.chars.sort.join
    sorted_2 = string_two.chars.sort.join

    sorted_1 == sorted_2
end

def second_anagram?(string_one, string_two)
    return false if string_one.length != string_two.length
    arr_2 = string_two.split("")

    string_one.each_char do |ch|
        i = arr_2.index(ch)
        arr_2.delete_at(i) if i != nil
    end

    arr_2.length == 0
end

def first_anagram?(string_one, string_two)
    all_perms = permutations(string_one.split(""))
    all_perms.each_with_index do |arr, i|
        all_perms[i] = arr.join("")
    end
    all_perms.include?(string_two)
end

def permutations(arr)
    return [[]] if arr.length == 0
    return [arr] if arr.length == 1
    prev_perms = permutations(arr[0...-1])
    all_perms = []
    (0...prev_perms.length).each do |i|
        curr_prev_perm = prev_perms[i]
        (0...arr.length).each do |j|
            new_perm = curr_prev_perm.deep_dup
            new_perm.insert(j, arr[-1])
            all_perms << new_perm
        end
    end
    all_perms
end

# deep dup
class Array
    def deep_dup
        #return [self] if !self.is_a?(Array)
        new_arr = []
        self.each do |el|
            if el.is_a?(Array)
                new_arr << el.deep_dup
            else
                new_arr << el
            end
        end
        new_arr
    end
end

#p permutations("hello".split(""))

p first_anagram?("hello", "olleh")
p second_anagram?("hello", "olleh")
p third_anagram?("hello", "olleh")
p fourth_anagram?("hello", "olleh")

p first_anagram?("hello", "olllh")
p second_anagram?("hello", "olllh")
p third_anagram?("hello", "olllh")
p fourth_anagram?("hello", "olllh")