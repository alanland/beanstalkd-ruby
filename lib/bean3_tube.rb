require 'beaneater'

@beanstalk = Beaneater::Pool.new ['localhost:11300']
@tube = @beanstalk.tubes.find 'some-tube-here'

# Watch only the tubes listed below (!)
@beanstalk.tubes.watch!('some-tube')
# Append tubes to existing set of watched tubes
@beanstalk.tubes.watch('another-tube')
# You can also ignore tubes that have been watched previously
@beanstalk.tubes.ignore('some-tube-ignore')

puts 'all tubes', @beanstalk.tubes.all
puts 'current tube', @beanstalk.tubes.used
puts 'watch tubes', @beanstalk.tubes.watched

tube = @beanstalk.tubes['some-tube']
tube.pause 3 # pause 3 seconds

# clean tube
tube = @beanstalk.tubes['some-tube']
tube.clear



