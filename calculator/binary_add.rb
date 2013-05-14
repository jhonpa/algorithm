def add a, b
  a_s = a.split(//)
  b_s = b.split(//)
  max = [a_s.size, b_s.size].max
  res = []
  increase = 0
  (max + 1).times {|i|
    j = a_s.size - i - 1
    k = b_s.size - i - 1
    a_tmp = (j < 0) ? 0 : a_s[j]  
    b_tmp = (k < 0) ? 0 : b_s[k]
    sum = a_tmp.to_i + b_tmp.to_i + increase
    res << (sum) % 2
    increase = (sum > 1) ? 1 : 0 
  }
  res.reverse.join()
end

p add "1001", "10"
p add "1111", "11"
p add "11", "1111" 

