require 'beaneater'
require 'json'

beanstalk = Beaneater::Pool.new(['localhost:11300'])

tube = beanstalk.tubes['tube1']
tube.put '{"key":"foo"}', :pre=>5
tube.put '{"key":"bar"}', :delay=>3

while tube.peek(:ready)
  job = tube.reserve
  puts "job value is #{JSON.parse(job.body)["key"]}"
  job.delete
end

beanstalk.close

