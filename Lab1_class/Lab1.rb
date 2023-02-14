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


