def substring(dict, val)
  hash = Hash.new(0)

  dict.each do |n|
    if val.include?(n)
      hash[n] += 1
    end
  end
  return hash
end




  dict = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
  z =  substring( dict,"below")
  puts z
