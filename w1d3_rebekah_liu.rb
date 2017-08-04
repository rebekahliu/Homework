def sum_to(num)
  return nil if num < 0
  return num if num <= 1
  num + sum_to(num-1)
end

def add_numbers(arr)
  return nil if arr.length == 0
  return arr[0] if arr.length <= 1
  arr[0] + add_numbers(arr[1..-1])
end

def gamma_fnc(num)
  return nil if num < 1
  return 1 if num <= 1
  (num-1) * gamma_fnc(num-1)
end

def ice_cream_shop(arr, fav_flvr)
  return false if arr.length == 0
  return true if arr[0] == fav_flvr
  ice_cream_shop(arr[1..-1], fav_flvr)
end

def reverse(string)
  return nil if string.length == 0
  return string if string.length == 1
  reverse(string[1..-1]) + string[0]
end


if __FILE__ == $PROGRAM_NAME
  p reverse("house") # => "esuoh"
  p reverse("dog") # => "god"
  p reverse("atom") # => "mota"
  p reverse("q") # => "q"
  p reverse("id") # => "di"
  p reverse("") # => "
end
