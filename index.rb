def input
  size = gets.to_i
  p size
  i = 0
  answers = []
  while i < size do
    answers << gets.split(' ')
    i += 1
  end
  p answers
  num = gets.to_i
  p num
  i = 0
  words = []
  while i < num do 
    words << gets
    i += 1
  end
  p words
end

input