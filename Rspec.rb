require 'rspec'

class Bubble_Sort
  def bubble_sort(number)
    lnt = number.length
    for i in 0...lnt
      for j in 0...lnt-i-1
        if number[j]>number[j+1]
          swap = number[j]
          number[j] = number[j+1]
          number[j+1] = swap
        end
      end
    end
    return number
  end
end
describe Bubble_Sort do
  it "sort the value" do
    number = [4,3,78,2,0,2]
    number1 = [0,2,2,3,4,78]
    sort1 = Bubble_Sort.new
    expect(sort1.bubble_sort(number)).to eql(number1)
  end
  it "sort the value" do
    number = [10,1,9,2,8,3,7,4,6,5]
    number1 = [1,2,3,4,5,6,7,8,9,10]
    sort1 = Bubble_Sort.new
    expect(sort1.bubble_sort(number)).to eql(number1)
  end
end





6:54
..
Finished in 0.01287 seconds (files took 0.18627 seconds to load)
2 examples, 0 failures
