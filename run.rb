require_relative 'text_worker'

textworker = TextWorker.new('text.txt')
hash_1 =  textworker.call.upcase.split('').tally
hash_1.sort_by(&:last).each{|value| puts "#{value.first} : #{value.last}"}
