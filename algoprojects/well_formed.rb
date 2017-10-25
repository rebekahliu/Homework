bracket = 0
parenthesis = 0
curly = 0



def well_formed(str)
  pairs = {"("=>")", "{"=>"}", "["=>"]"}
  return true if str.length == 0
  return false if [")","]","}"].include?(str[0])
  #otherwise, we need to go until the closing thing
  #if we reach the end without a closer, return false
  #if we reach the closer, take the contents
  #if the contents are well formed, call well formed on the rest of the string
  #past the closed
  #if the contents are not well formed return false
  open_char = str[0]
  i = 1
  contents = ""
  length = str.length
  until(str[i] == pairs[open_char])
    return false if i == length
    contents << str[i]
    i += 1
  end
  #we found a closer, check its contents
  return false unless well_formed(contents)
  return true if i == (length - 1)
  well_formed(str[i+1...length])
end
