require 'twitter'

#### Get your twitter keys & secrets:
#### https://dev.twitter.com/docs/auth/tokens-devtwittercom
twitter = Twitter::REST::Client.new do |config|
  config.consumer_key = ENV["PAM_KEY"]
  config.consumer_secret = ENV["PAM_SECRET"]
  config.access_token = ENV["PAM_ACCESS_TOKEN"]
  config.access_token_secret = ENV["PAM_ACCESS_TOKEN_SECRET"]
end

#search_term = URI::encode('#EnterHashTagHere')

#Send a randomized tweet every 2minutes from @RBCsPAM
#Simulates the auto generated messages from PAM
SCHEDULER.every '2m' do
    milestone = Random.new.rand(1..10)
    projects = ["Automated DSA", "GEMA Team Portal"]
    msgchoice = Random.new.rand(1..3)

    msg1 = "System: Milestone #{milestone} Completed in project #{projects[0]}"
    msg2 = "System: @Bailey has implemented dashboard feature for task - #{projects[1]}"
    msg3 = "Jim has updated AutoDSA.vbs in project #{projects[0]}"

    if msgchoice == 1
        twitter.update(msg1)
    elsif msgchoice == 2
        twitter.update(msg2)
    else
        twitter.update(msg3)
    end
end

SCHEDULER.every '30s', :first_in => 0 do |job|
  begin
    #tweets = twitter.search("#{search_term}")
    #tweets = twitter.user_timeline("EnterUserNameHere")
    tweets = twitter.home_timeline #Fetch tweets from timeline
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
