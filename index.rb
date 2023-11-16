$size = 0
$answers = []
$words = []
$result

def input
  $size = gets.to_i
  i = 0
  while i < $size do
    $answers << gets.split(' ')
    i += 1
  end
  num = gets.to_i
  i = 0
  while i < num do 
    $words << gets.chomp
    i += 1
  end
end

def check_answer
  $answers.each_with_index do |row, row_i|
    row.each_with_index do |col, col_i|
      if $words.include?($answers[row_i][col_i])
        $answers[row_i][col_i] = nil
      end
    end
  end
end

def judge_horizontal
  $answers.each_with_index do |row, row_i|
    row.each_with_index do |col, col_i|
      if col.nil?
        if col_i == $size - 1
          p 'yes:38'
          return true
        end
      else
        break
      end
    end
  end

  return false
end

def judege_vertical
  for col in 0..$size - 1 do
    for row in 0..$size - 1 do
      if $answers[col][row].nil?
        if row == $size - 1
          p 'yes:55'
          return true
        end
      else
        break
      end
    end
  end

  return false
end

def judge_diagonal
  i = 0

   for i in 0..$size - 1 do
    if $answers[i][i].nil?
      if i == $size - 1
        p 'yes:73'
        return true
      end
    else
      break
    end
  end

   for i in 0..$size - 1 do
    if $answers[i][$size - 1 - i].nil?
      if i == $size - 1
        p 'yes:84'
        return true
      end
    else
      break
    end
  end

  return false
end

def judge_result
  if judge_horizontal || judege_vertical || judge_diagonal
    $result = 'yes'
  else
    $result = 'no'
  end
end

input
check_answer
judge_result
p $result