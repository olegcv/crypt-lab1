require_relative 'text_worker'

def get_single_letters
  textworker = TextWorker.new('text.txt')
  hash_1 =  textworker.call.upcase.split('').tally
  hash_1.sort_by(&:last).each do |value| 
    res = value.last.to_f/hash_1.values.sum
    puts "%5s    " % value.first + "    %5d    " % value.last + "    %5f    " % res + "    %5f   " % Math.log2(res).abs
  end
  p "Result = #{hash_1.values.sum}"
end

def get_pair_letters
  textworker = TextWorker.new('text.txt')
  hash_2 = textworker.call.upcase.split(' ')
  a = (%w[А Б В Г Ґ Д Е Є Ж З И І Ї Й К Л М Н О П Р С Т У Ф Х Ц Ч Ш Щ Ь Ю Я]).to_a.repeated_permutation(2).to_a
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
  
  sum = result_hash.values.sum
  f = File.open('result.txt', 'w+')
  result_hash.each do |key, value|
    result_hash[key] = value.to_f / sum.to_f
    result = "%10s" % key + "    %10f    " % result_hash[key] + "    %5f \n" % Math.log2(value).round(5)
    f.write(result)
  end

  #result_hash.sort_by(&:last).each{|value| puts "#{value.first} : #{value.last}" }
end

#get_single_letters
get_pair_letters

