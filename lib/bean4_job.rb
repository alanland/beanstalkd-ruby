require 'beaneater'
require 'json'

beanstalk = Beaneater::Pool.new ['localhost:11300']
tube = beanstalk.tubes['default']
tube.put 'job1'
tube.put({:foo => 'bar'}.to_json)
tube.put 'job2', :pri => 1030, :delay => 3, :ttr => 100

beanstalk.tubes.watch! 'default','other'

puts '-'*80
job = beanstalk.tubes.reserve
puts job.body
puts job.stats.state
job.delete

puts '-'*80
job = beanstalk.tubes.reserve
puts job.body
puts job.stats.state
job.delete

puts '-'*80
job = beanstalk.tubes.reserve(5)
puts job.body
puts job.stats.state
job.delete

puts '-'*80
job = beanstalk.tubes.reserve
job.release :delay=>5
puts job.body
puts job.stats.state

puts '-'*80
job = beanstalk.tubes.reserve
job.bury
puts job.body
puts job.stats.state


beanstalk.close

