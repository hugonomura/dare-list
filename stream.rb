require "tweetstream"
require "net/http"
require "uri"

TweetStream.configure do |config|
  config.consumer_key       = '3wIpcp8HNtfFriTMiH6ThH8Kt'
  config.consumer_secret    = 'wKqbwmXYPPDplZTvqGWwG8VpHXRP32qI4WrcxAOSVmkQtqB2Y7'
  config.oauth_token        = '50778021-xFIZtmXH4MraRk6rcsN2PsZ19cJkrOvTAmAJ8drac'
  config.oauth_token_secret = 'KMDhlVb0FPbRIreyjCDSB3MHYkMfWSD4pcJP8ptV7qvv3'
  config.auth_method        = :oauth
end

# Use 'track' to track a list of single-word keywords
TweetStream::Client.new.track('#darelist') do |status|
  puts "#{status.user.screen_name}"
  puts "#{status.text}"
  tweet = status.text
  screen_name = status.user.screen_name
  #Net::HTTP.post_form URI('http://dare-list.herokuapp.com/tweets'),
	Net::HTTP.post_form URI('http://0.0.0.0:3000/tweets'),
                    { "tweet" => tweet,"screen_name" => screen_name}

end



