def caesar_cipher(s, sf)
  #First, we set an array to contain letters a to z
  letters = ("a".."z").to_a
  s_arr = s.chars
  s_arr.map! do |c|
    unless (/[\W]/.match(c))
      was_upcase = /[[:upper:]]/.match(c)
      idx = letters.index(c.downcase)
      if idx != nil
        unless was_upcase
          letters.at((idx + sf) % letters.length)
        else
          (letters.at((idx + sf) % letters.length)).upcase
        end
      end
    else
      c
    end
  end
  p s_arr.join
end

def substrings(word, substrings)
  #Return a hash listing each substring (case insensitive) that was found in
  word_arr = word.split(' ')

  word_arr.map! do |substr|
    substr.downcase
  end

  res_hash = Hash.new
  word_arr.each do |curr|
    substrings.each do |to_match|
      #Can we match the substring?
      pattern = Regexp.new(to_match)
      if curr =~ pattern
        if res_hash.has_key?(to_match)
          res_hash[to_match] += 1
        else
          res_hash[to_match] = 1
        end
      end
    end
  end
  res_hash
end

def stock_picker(prices)
  max_profit = -1.0/0.0
  prices.each_with_index do |curr_price, curr_idx|
    for i in (curr_idx+1..prices.length-1) do
      this_profit = prices[i] - curr_price
      if (this_profit > max_profit)
        max_profit = this_profit
      end
    end
  end
  max_profit
end

def bubble_sort(list)
  sorted = false
  until sorted do
    swap_done = false
    (list.length-1).times do |idx|
      if list[idx] > list[idx+1]
        tmp = list[idx]
        list[idx] = list[idx+1]
        list[idx+1] = tmp
        swap_done = true
      end
    end
    unless swap_done
      break
    end
  end
  list
end

caesar_cipher("What a string!", 5)
dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings("below", dictionary)
puts substrings("Howdy partner, sit down! How's it going?", dictionary)
puts stock_picker([17,3,6,9,15,8,6,1,10])
puts bubble_sort([4,3,78,2,0,2])
