number = [4,3,78,2,0,2]

  def bubble_sort(number)
    lnt = number.length-1
    for i in 0..lnt
      for j in 0..lnt-i-1
        if number[j]>number[j+1]
          swap = number[j]
          number[j] = number[j+1]
          number[j+1] = swap
        end
      end
    end
    return number
  end

  z = bubble_sort(number)
  p z
