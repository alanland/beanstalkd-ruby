require 'beaneater'

beanstalk = Beaneater::Pool.new ['localhost:11300']
loop do
  job = beanstalk.tubes.reserve
  puts job.body # prints "hello"
  job.delete
end