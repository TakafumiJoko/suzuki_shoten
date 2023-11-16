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
      # 一致した単語（$words）の中にマスの単語（$answers[row_i][col_i]）が含まれていたら、そのマスをチェックする。
      if $words.include?($answers[row_i][col_i])
        $answers[row_i][col_i] = nil
      end
    end
  end
end

def judge_horizontal
  $answers.each_with_index do |row, row_i|
    row.each_with_index do |col, col_i|
      # １行内で最後のマスまでnilの値が連続すれば、true（ビンゴの意）を返す
      if col.nil?
        if col_i == $size - 1
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
      # １列内で最後のマスまでnilの値が連続すれば、true（ビンゴの意）を返す
      if $answers[col][row].nil?
        if row == $size - 1
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
   # 斜めの並び（左上隅から右下隅まで）の最後のマスまでnilの値が連続すれば、true（ビンゴの意）を返す
   for i in 0..$size - 1 do
    if $answers[i][i].nil?
      if i == $size - 1
        return true
      end
    else
      break
    end
  end
   # 斜めの並び（右上隅から左下隅まで）の最後のマスまでnilの値が連続すれば、true（ビンゴの意）を返す
   for i in 0..$size - 1 do
    if $answers[i][$size - 1 - i].nil?
      if i == $size - 1
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

def output
  p $result
end

input
check_answer
judge_result
output
