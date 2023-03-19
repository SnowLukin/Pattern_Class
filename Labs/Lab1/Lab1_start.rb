# task1
puts "Hello World"

# task2
name = ARGV[0]
puts "Hello, #{name}!!!"

puts "Favorite language?"
langv = STDIN.gets.chomp
case langv
when "Swift"
  puts "Подлиза!"
when "C++"
  puts "Жесть умный!!"
when "Python"
  puts "Вопросов больше нет..."
when "Ruby"
  puts "Все верно!"
else
  puts "Скоро будет Ruby!"
end

name = ARGV[0]
puts "Hello, #{name}!!!"

# task3
puts "Введите команду для ОС"
cmd_os = #{STDIN.gets.chomp}
  puts cmd_os
# system cmd_os

puts "Введите команду языка ruby"

cmd_ruby = #{STDIN.gets.chomp}
  # puts cmd_ruby
  # cmd_ruby= ruby -e "#{STDIN.gets.chomp}"
  system "ruby -e \"#{cmd_ruby}\""


puts "number of arguments: #{ARGV.count}"
ARGV.each do |arg|
  puts "argument: #{arg}"
end
