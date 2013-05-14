def combination array, size
  if array.size < size
    return false
  end

  if size == 1
    res =array.map{|r| [r]}
  elsif array.size == size 
    res = [array]
  else
    res = []
    array.each_with_index do |c, i|
      tmp = array.clone
      tmp.delete_at i
      res += all_combination(tmp, size - 1).map { |r|
        ([c] + r)
      }
    end 
  end
  return res
end

def all_combination array, size
  res = []
  1.upto(size) {|s|
    res += combination array, s
  }
  return res
end
p all_combination ["a", "b", "c", "d"], 3

p combination ["a", "b", "c", "d"], 4
