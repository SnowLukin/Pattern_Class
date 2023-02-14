# Задание 1

# Минимальный общий делитель
def gcd(a, b)
  b.zero? ? a : gcd(b, a % b)
end

# Найти количество чисел, взаимно простых с заданным.
def find_coprimes(num)
  count = 0
  (1..num).each do |i|
    count += 1 if gcd(num, i) == 1
  end
  count
end

# Найти сумму цифр числа, делящихся на 3
def sum_of_digits(num)
  sum = 0
  while num.positive?
    sum += num % 10 if (num % 10) % 3 == 0
    num /= 10
  end
  sum
end

# Найти делитель числа, являющийся взаимно простым с наибольшим количеством цифр данного числа.
def find_divisor(num)
  max = 0
  divisor = 0
  (1..num).each do |i|
    next unless (num % i).zero?

    if gcd(num, i) == 1
      if i.to_s.length > max
        max = i.to_s.length
        divisor = i
      end
    end
  end
  divisor
end

puts find_coprimes(10)
puts sum_of_digits(123)
puts find_divisor(10)

# Задание 2

# Задача 1
# Найти минимальный элемент массива
def min_while(arr)
  min = arr[0]
  i = 0
  while i < arr.length
    min = arr[i] if arr[i] < min
    i += 1
  end
  min
end

def min_for(arr)
  min = arr[0]
  for i in arr
    min = i if i < min
  end
  min
end

def min(arr)
  min = arr[0]
  arr.each do |i|
    min = i if i < min
  end
  min
end

# Номер первого положительного элемента через while

def first_positive_while(arr)
  i = 0
  while i < arr.length
    return i if arr[i].positive?
    i += 1
  end
  -1
end

def first_positive_for(arr)
  for i in arr
    return arr.index(i) if i.positive?
  end
  -1
end

def first_positive(arr)
  arr.each_with_index do |i, index|
    return index if i.positive?
  end
  -1
end

# Задача 2

# 2 Написать программу, которая принимает как аргумент два
# значения. Первое значение говорит, какой из методов задачи
# 1 выполнить, второй говорит о том, откуда читать список
# аргументом должен быть написан адрес файла. Далее
# необходимо прочитать массив и выполнить метод.

def read_file(file)
  file = File.open(file)
  arr = file.readlines
  file.close
  arr.map! { |i| i.to_i }
end

def write_file(file, arr)
  file = File.open(file, 'w')
  file.write(arr)
  file.close
end

def main(method, file)
  arr = read_file(file)
  case method
  when 'min_while'
    write_file(file, min_while(arr))
  when 'min_for'
    write_file(file, min_for(arr))
  when 'min'
    write_file(file, min(arr))
  when 'first_positive_while'
    write_file(file, first_positive_while(arr))
  when 'first_positive_for'
    write_file(file, first_positive_for(arr))
  when 'first_positive'
    write_file(file, first_positive(arr))
  else
    puts 'Неверный метод'
  end
end

# main('min_while', 'input.txt')


# Задание 4

# Задача 8
# Дан целочисленный массив. Необходимо найти индексы двух
# наименьших элементов массива.
def find_min_index(arr)
  min = arr[0]
  min_index = 0
  arr.each_with_index do |i, index|
    if i < min
      min = i
      min_index = index
    end
  end
  min_index
end

# Задача 20
# Дан целочисленный массив. Необходимо найти все пропущенные числа.
def find_missing(arr)
  arr.sort!
  missing = []
  (arr[0]..arr[-1]).each do |i|
    missing.push(i) unless arr.include?(i)
  end
  missing
end

# Задача 32
# Дан целочисленный массив. Найти количество его локальных максимумов.
def find_local_max(arr)
  count = 0
  (1..arr.length - 2).each do |i|
    count += 1 if arr[i - 1] < arr[i] && arr[i] > arr[i + 1]
  end
  count
end

# Задача 44
# Дан массив чисел. Необходимо проверить, чередуются ли в нем
# целые и вещественные числа.
def check_alternate(arr)
  arr.each_with_index do |i, index|
    if index.odd?
      return false if i.is_a?(Integer)
    else
      return false if i.is_a?(Float)
    end
  end
  true
end

# Задача 56
# Для введенного списка посчитать среднее арифметическое непростых
# элементов, которые больше, чем среднее арифметическое простых.
def is_prime(num)
  return false if num < 2
  (2..Math.sqrt(num)).each do |i|
    return false if (num % i).zero?
  end
  true
end
