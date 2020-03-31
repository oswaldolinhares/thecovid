# frozen_string_literal: true

module Twitter
  class GetTweets < BaseService
    def call
      search
    end

    def client
      Twitter::REST::Client.new do |config|
        config.consumer_key = 'kMKxglqynosuvilnb1WJQ'
        config.consumer_secret     = 'H3DvuGPeelMuYMn0NK2zOvF1ZouMlIAsLxD1tN0Vqwo'
        config.access_token        = '20645179-hOVhteLmyQqaVvN1Em5hmE79xQ9uj0U7uci5lanwp'
        config.access_token_secret = 'OpKsiUGXsjKHCpeyUOHhAjX2JhHxoe2EAfkYDrmeRUSiW'
      end
    end

    def search
      client.search('coronavirus', result_type: 'recent').take(3).each do |tweet|
        puts tweet.text
      end
    end
  end
end
