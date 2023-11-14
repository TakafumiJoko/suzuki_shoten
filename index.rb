$answers = [];
$words = [];

def input
  size = gets.to_i
  p size
  i = 0
  while i < size do
    $answers << gets.split(' ')
    i += 1
  end
  p $answers
  num = gets.to_i
  p num
  i = 0
  while i < num do 
    $words << gets.chomp
    i += 1
  end
  p $words
end

def check_answer
  $answers.each_with_index do |row, row_i|
    row.each_with_index do |answer, answer_i|
      if $words.include?($answers[row_i][answer_i])
        $answers[row_i][answer_i] = nil
      end
    end
  end
  p $answers
end

input
check_answer
