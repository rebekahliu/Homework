require 'byebug'

array = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def octopus_n2(array)
  array.each do |fish|
    max_length = true
    array.each do |fish2|
      if fish2.length > fish.length
        max_length = false
      end
    end
    return fish if max_length == true
  end
end

def sort_nlogn(array)
  # debugger
  return array if array.length <= 1
  mid = array.length/2
  left = sort_nlogn(array.take(mid))
  right = sort_nlogn(array.drop(mid))


  merged = []
  until left.empty? || right.empty?
    comp = left[0].length <=> right[0].length
    if comp == 1
      merged << right.shift
    elsif comp == -1
      merged << left.shift
    elsif comp == 0
      merged << right.shift
      merged << left.shift
    end
  end
  merged + right + left
end

def merge_octopus(array)
  sort_nlogn(array).last
end

def n_octopus(array)
  longest = ""
  array.each do |x|
    longest = x if x.length > longest.length
  end
  longest
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(direction, tiles_array)
  tiles_array.each_with_index do |tile, tentacle|
    return tentacle if direction == tile
  end
end

tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

def constant_dance(direction, tiles_hash)
  tiles_hash[direction]
end

if __FILE__ == $0
  p octopus_n2(array) =="fiiiissshhhhhh"
  p merge_octopus(array)=="fiiiissshhhhhh"
  p n_octopus(array) == "fiiiissshhhhhh"
  p slow_dance("up", tiles_array) == 0
  p constant_dance("up", tiles_hash) == 0
end
