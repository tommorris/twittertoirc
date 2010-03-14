require 'rubygems'  
require 'tweetstream'
require 'drb'

queue = DRbObject.new(nil, "druby://localhost:3491")
TweetStream::Client.new("[twitter_username]", "[password]").track("dev8d", "linkeddata") do |status|
	unless status[:text].match(/^RT /) || status[:text].match(/live on uStream/)
		queue.push( "#{status[:user][:screen_name]}: #{status[:text]}") 
		puts "#{status[:user][:screen_name]}: #{status[:text]}"
	end
end

