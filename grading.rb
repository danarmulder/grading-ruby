require 'JSON'

data = File.read('data/grades.json')
@grades = JSON.parse(data)

def grade_diff(grades)
  differences = {}
  grades.map do |person, grade_list|
    differences[person] = difference(grade_list)
  end
  differences
end

def difference(array)

  grade_differences = []
  i = 0
  while i < (array.length - 1)
    if array[i] > array[i+1]
      grade_differences << :down
    elsif array[i] < array[i+1]
      grade_differences << :up
    else
      grade_differences << :even
    end
    i += 1
  end
  return grade_differences
end

def decline(grades)
  differences = grade_diff(grades)
  declining = {}
  differences.map do |person, difference_list|
    i = 0
    difference_list.each do |diff|
      if diff == :up
        i = 0
      else
        i += 1
      end
    end
    declining[person] = i >= 3 ? "in decline" : "not in decline"
  end
  declining
end

p decline(@grades)
