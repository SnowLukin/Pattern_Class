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
