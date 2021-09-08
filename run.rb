require_relative 'text_worker'

textworker = TextWorker.new('text.txt')

#single letters
hash_1 =  textworker.call.upcase.split('').tally
hash_1.sort_by(&:last).each{|value| puts "#{value.first} : #{value.last}"}

#pair of letters
hash_2 = textworker.call.upcase.split(' ')
a = ('А'..'Я').to_a.repeated_combination(2).to_a
result_hash = {}

a.each do |pair| 
  result_hash[pair.first+pair.last] = 0
end

hash_2.each do |word|
  result_hash.each do |key, value|
    sum = word.scan(/(?=#{key})/).count
    result_hash[key]+=sum
  end  
end

p result_hash