require "rubygems"
require "thread"
require "drb"
queue = Queue.new
DRb.start_service("druby://:3491", queue)
DRb.thread.join

