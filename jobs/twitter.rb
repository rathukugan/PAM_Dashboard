require 'twitter'

#### Get your twitter keys & secrets:
#### https://dev.twitter.com/docs/auth/tokens-devtwittercom
twitter = Twitter::REST::Client.new do |config|
  config.consumer_key = ENV["PAM_KEY"]
  config.consumer_secret = ENV["PAM_SECRET"]
  config.access_token = ENV["PAM_ACCESS_TOKEN"]
  config.access_token_secret = ENV["PAM_ACCESS_TOKEN_SECRET"]
end

search_term = URI::encode('#EnterHashTagHere')

#Use twitter.update("I'm tweeting with @gem!") to simulate the
#auto generated system tweets
#maybe do this in a randomize block
SCHEDULER.every '30s', :first_in => 0 do |job|
  begin
    #tweets = twitter.search("#{search_term}")
    #tweets = twitter.user_timeline("EnterUserNameHere")
    tweets = twitter.home_timeline
    if tweets
      tweets = tweets.map do |tweet|
        { name: tweet.user.name, body: tweet.text, avatar: tweet.user.profile_image_url_https }
      end
      send_event('twitter_mentions', comments: tweets)
    end
  rescue Twitter::Error
    puts "\e[33mFor the twitter widget to work, you need to put in your twitter API keys in the jobs/twitter.rb file.\e[0m"
  end
end
