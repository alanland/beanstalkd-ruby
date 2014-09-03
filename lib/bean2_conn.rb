require 'beaneater'

beanstalk = Beaneater::Pool.new(['localhost:11300'])

ENV['BEANSTALKD_URL'] == 'localhost:11300,127.0.0.1:11300'
beanstalk2 = Beaneater::Pool.new
puts 1,beanstalk.connections.first
puts 2,beanstalk2.connections.last

puts 3,beanstalk
puts 4,beanstalk2

beanstalk.close
beanstalk2.close