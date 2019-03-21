# Sluggish Octopus
# Find the longest fish in O(n^2) time. Do this by comparing all fish lengths to 
# all other fish lengths

def quadratic_longest_fish(fishes)
    biggest = nil
    fishes.each_index do |i|
        fishes.each_index do |j|
            if fishes[i] > fishes[j] && i != j
                biggest = fishes[i]
            end
        end
    end
    return biggest
end

# Dominant Octopus
# Find the longest fish in O(n log n) time. Hint: You saw a sorting algorithm that 
# runs in O(n log n) in the Sorting Complexity Demo. Remember that Big O is 
# classified by the dominant term.


def merge_sort(fishes)
    return fishes if self.length <= 1
    mid = fishes.length / 2
    sort_left = fishes.take(mid).merge_sort(fishes)
    sort_right = fishes.drop(mid).merge_sort(fishes)
    merge(sort_left, sort_right)
end

def merge(left, right)
    merged = []
    until left.empty? || right.empty?
        case left.first <=> right.first
        when -1 
            merged << left.shift
        when 1
            merged << right.shift
        end
    end
    merged + left + right
end

# Clever Octopus
# Find the longest fish in O(n) time. The octopus can hold on to the longest fish 
# that you have found so far while stepping through the array only once.
def linear_longest_fish(fishes)
    biggest = fishes.first
    fishes.each do |fish|
        biggest = fish if fish.length > biggest.length
    end
    biggest
end
