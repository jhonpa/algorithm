# -*- coding: utf-8 -*-


str = "x+9-2-4+x=-x+5-1+3-x"

def calc str
  num_of_x = 0
  num_of_number = 0
  
  plus = true
  reverse = false
  str.split(//).each do |s|
    if s == "-"
      plus = false
    elsif s == "x"
      num_of_x += (( plus ^ reverse ) ? 1 : -1)
      plus = true
    elsif s == "="
      reverse = true
    elsif s =~ /[0-9]/
      num_of_number += (( plus ^ reverse ) ? 1 : -1) * s.to_i
      plus = true
    end
  end
  #p num_of_x, num_of_number
  return - num_of_number.to_f /  num_of_x.to_f
end

p calc str
