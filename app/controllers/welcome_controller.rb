# frozen_string_literal: true

class WelcomeController < ApplicationController
  def index
    @tweets = Twitter::GetTweets.call
  end
end
