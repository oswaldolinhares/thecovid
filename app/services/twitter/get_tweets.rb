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
      tweets = client.search('coronavirus', result_type: 'recent',
                                            geocode: location_coordinates,
                                            lang: 'pt').take(20)
                     .select { !_1.retweeted_tweet? }
    end

    def location_coordinates
      coordinates = Geocoder.search('Teresina').first.coordinates
      "#{coordinates.join(',')},30mi"
    end
  end
end
