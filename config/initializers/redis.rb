uri = URI.parse(ENV["REDISTOGO_URL"] || "redis://redistogo:47eb82ac3e3034558eb03c60fcbfcc10@ray.redistogo.com:10018/" )
REDIS = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)