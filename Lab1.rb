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