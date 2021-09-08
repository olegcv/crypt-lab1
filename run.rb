require_relative 'text_worker'

textworker = TextWorker.new('text.txt')
hash_1 =  textworker.call.upcase.split('').tally
hash_1.sort_by(&:last).each{|value| puts "#{value.first} : #{value.last}"}

hash_2 = textworker.call.upcase.split(' ')
a = ('А'..'Я').to_a.repeated_combination(2).to_a
