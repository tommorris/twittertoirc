require "java"
require "drb"
require "/home/tom/Code/lewebtwitter/pircbot-1.5.0/pircbot.jar"
java_import "org.jibble.pircbot.PircBot"

class LeWebBot < PircBot
  def initialize
    super
    setName("dev8d-bot")
    setLogin("dev8d-bot")
  end
end

bot = LeWebBot.new
bot.setVerbose(true)
bot.startIdentServer()
bot.connect("chat.eu.freenode.net", 6667)
bot.changeNick("my-precious-bot")
bot.joinChannel("#test")

queue = DRbObject.new(nil, "druby://localhost:3491")
while true
	unless queue.empty?
		msg = queue.pop
		bot.sendMessage("#test", msg.gsub(/\n/, " "))
		sleep 3
	end
end

